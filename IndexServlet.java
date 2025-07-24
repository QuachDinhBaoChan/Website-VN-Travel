package com.example.servlet;

import com.example.entity.Tour;
import com.example.util.TourDAO;
import com.example.util.HibernateUtil;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;

import java.util.List;

@WebServlet(urlPatterns = "/init", loadOnStartup = 1)
public class IndexServlet extends HttpServlet {
    private TourDAO tourDAO;

    @Override
    public void init() throws ServletException {
        tourDAO = new TourDAO(HibernateUtil.getSessionFactory());

        // Lấy toàn bộ danh sách tour
        List<Tour> allTours = tourDAO.getAllTours();

        // Lưu danh sách tour vào application scope (toàn cục)
        ServletContext context = getServletContext();
        context.setAttribute("allTours", allTours);

        System.out.println("Danh sách tour đã được tải sẵn vào ứng dụng.");
    }
}
