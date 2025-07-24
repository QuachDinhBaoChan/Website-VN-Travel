package com.example.servlet;

import com.example.entity.Tour;
import com.example.util.HibernateUtil;
import com.example.util.TourDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/tourDetail")
public class TourDetailServlet extends HttpServlet {
    private TourDAO tourDAO;

    @Override
    public void init() {
        tourDAO = new TourDAO(HibernateUtil.getSessionFactory());
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idStr = request.getParameter("id");
        if (idStr != null) {
            try {
                int id = Integer.parseInt(idStr);
                Tour tour = tourDAO.getTourById(id); // Sử dụng phương thức getTourById (cần thêm vào TourDAO)
                request.setAttribute("tour", tour);
            } catch (NumberFormatException e) {
                e.printStackTrace();
            }
        }
        request.getRequestDispatcher("/tourdetail.jsp").forward(request, response);
    }
}