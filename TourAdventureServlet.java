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
import java.util.ArrayList;
import java.util.List;

@WebServlet("/adventure-tours")
public class TourAdventureServlet extends HttpServlet {
    private TourDAO tourDAO;

    @Override
    public void init() {
        tourDAO = new TourDAO(HibernateUtil.getSessionFactory());
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Tour> allTours = tourDAO.getAllTours();
        List<Tour> adventureTours = new ArrayList<>();

        // Lọc các tour có category là "Adventure"
        for (Tour tour : allTours) {
            if (tour.getCategory() != null && tour.getCategory().equalsIgnoreCase("Phiêu lưu")) {
                adventureTours.add(tour);
            }
        }

        // Gửi danh sách lọc vào request
        request.setAttribute("adventureTours", adventureTours);
        request.getRequestDispatcher("/touradventure.jsp").forward(request, response);
    }
}
