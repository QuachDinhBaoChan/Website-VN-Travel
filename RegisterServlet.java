package com.example.servlet;

import com.example.entity.User;
import com.example.util.HibernateUtil;
import com.example.util.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.mindrot.jbcrypt.BCrypt;

import java.io.IOException;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    private UserDAO userDAO;

    @Override
    public void init() {
        userDAO = new UserDAO(HibernateUtil.getSessionFactory());
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Lấy thông tin từ form
        String email = request.getParameter("email");
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Kiểm tra xem email hoặc username đã tồn tại chưa
        User existingEmail = userDAO.findByEmail(email);
        User existingUsername = userDAO.findByUsername(username);

        if (existingEmail != null) {
            request.setAttribute("error", "Email already exists");
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }

        if (existingUsername != null) {
            request.setAttribute("error", "Username already exists");
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }

        // Mã hóa mật khẩu
        String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt());

        // Tạo người dùng mới với role mặc định là "user"
        User newUser = new User(username, email, hashedPassword, "user");

        // Lưu vào database
        userDAO.save(newUser);

        // Chuyển tiếp hoặc redirect
        request.setAttribute("success", true);
        request.getRequestDispatcher("register.jsp").forward(request, response);
    }
}
