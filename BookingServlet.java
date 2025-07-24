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
import java.util.List;

@WebServlet("/booking")
public class BookingServlet extends HttpServlet {
    private TourDAO tourDAO;

    @Override
    public void init() {
        tourDAO = new TourDAO(HibernateUtil.getSessionFactory());
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Tour> allTours = tourDAO.getAllTours(); // Cần thêm phương thức getAllTours trong TourDAO
        request.setAttribute("tours", allTours);
        request.getRequestDispatcher("/booking.jsp").forward(request, response);
    }
}