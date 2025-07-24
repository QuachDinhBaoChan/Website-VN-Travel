package com.example.servlet;

import com.example.entity.User;
import com.example.entity.Tour;
import com.example.util.HibernateUtil;
import com.example.util.UserDAO;
import com.example.util.TourDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import org.mindrot.jbcrypt.BCrypt;

import java.io.IOException;
import java.util.List;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private UserDAO userDAO;
    private TourDAO tourDAO;

    @Override
    public void init() {
        userDAO = new UserDAO(HibernateUtil.getSessionFactory());
        tourDAO = new TourDAO(HibernateUtil.getSessionFactory());
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        User user = userDAO.findByUsername(username);

        if (user != null && BCrypt.checkpw(password, user.getPassword())) {
            request.getSession().setAttribute("user", user);

            List<Tour> allTours = tourDAO.getAllTours();
            request.getServletContext().setAttribute("allTours", allTours);

            if ("admin".equalsIgnoreCase(user.getRole())) {
                response.sendRedirect(request.getContextPath() + "/admin.jsp");
            } else {
                response.sendRedirect(request.getContextPath() + "/index.jsp");
            }

        } else {
            request.setAttribute("error", "Invalid username or password");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}
