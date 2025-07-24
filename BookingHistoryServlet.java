package com.example.servlet;

import com.example.util.BookingDAO;
import com.example.entity.Booking;
import com.example.entity.User;
import com.example.util.HibernateUtil;
import org.hibernate.SessionFactory;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/bookingHistory")
public class BookingHistoryServlet extends HttpServlet {
    private BookingDAO bookingDAO;

    @Override
    public void init() throws ServletException {
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        if (sessionFactory == null) {
            throw new ServletException("SessionFactory is not initialized");
        }
        bookingDAO = new BookingDAO(sessionFactory);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        // Kiểm tra người dùng đã đăng nhập
        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        try {
            // Lấy lịch sử đặt tour của người dùng
            List<Booking> userBookings = bookingDAO.getBookingsByUser(user);
            request.setAttribute("userBookings", userBookings);
            request.getRequestDispatcher("/bookingHistory.jsp").forward(request, response);
        } catch (Exception e) {
            request.setAttribute("error", "Không thể tải lịch sử đặt tour. Vui lòng thử lại sau.");
            request.getRequestDispatcher("/WEB-INF/views/error.jsp").forward(request, response);
        }
    }
}