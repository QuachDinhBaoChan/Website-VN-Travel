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
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Date;
import java.util.List;

@WebServlet("/searchTour")
public class SearchTourServlet extends HttpServlet {
    private TourDAO tourDAO;

    @Override
    public void init() {
        tourDAO = new TourDAO(HibernateUtil.getSessionFactory());
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String departureLocation = request.getParameter("departureLocation");
        String destination = request.getParameter("destination");
        String departureDateStr = request.getParameter("departureDate");
        String daysRange = request.getParameter("daysRange");
        String budgetRange = request.getParameter("budget");
        String customDaysStr = request.getParameter("customDaysInput");

        // Xử lý ngày khởi hành
        LocalDate departureDate = null;
        if (departureDateStr != null && !departureDateStr.isEmpty()) {
            try {
                Date parsedDate = new SimpleDateFormat("yyyy-MM-dd").parse(departureDateStr);
                departureDate = new java.sql.Date(parsedDate.getTime()).toLocalDate();
            } catch (ParseException e) {
                e.printStackTrace();
            }
        }

        // Xử lý số ngày
        Integer minDays = null, maxDays = null;
        if (daysRange != null && !daysRange.isEmpty()) {
            switch (daysRange) {
                case "1-4": minDays = 1; maxDays = 4; break;
                case "5-8": minDays = 5; maxDays = 8; break;
                case "9-12": minDays = 9; maxDays = 12; break;
                case "14+": minDays = 14; maxDays = Integer.MAX_VALUE; break;
            }
        } else if (customDaysStr != null && !customDaysStr.isEmpty()) {
            try {
                int customDays = Integer.parseInt(customDaysStr);
                minDays = maxDays = customDays;
            } catch (NumberFormatException e) {
                e.printStackTrace();
            }
        }

        // Xử lý ngân sách
        Double minPrice = 0.0, maxPrice = null;
        if (budgetRange != null && !budgetRange.isEmpty()) {
            String[] prices = budgetRange.split("-");
            try {
                if (prices.length == 2) {
                    minPrice = Double.parseDouble(prices[0]);
                    maxPrice = Double.parseDouble(prices[1]);
                } else if (prices.length == 1) {
                    maxPrice = Double.parseDouble(prices[0]);
                }
            } catch (NumberFormatException e) {
                e.printStackTrace();
            }
        }

        // Gọi DAO để tìm kiếm
        List<Tour> filteredTours = tourDAO.searchTours(
                departureLocation,
                destination,
                departureDate,
                minDays,
                maxDays,
                minPrice,
                maxPrice
        );

        // Gửi kết quả về JSP
        request.setAttribute("tours", filteredTours);
        request.getRequestDispatcher("/booking.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Tour> allTours = tourDAO.getAllTours();
        request.setAttribute("tours", allTours);
        request.getRequestDispatcher("/booking.jsp").forward(request, response);
    }
}
