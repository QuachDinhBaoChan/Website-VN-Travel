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

@WebServlet("/pendingBookings")
public class AdminBookingServlet extends HttpServlet {
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

        // Kiểm tra quyền admin
        if (user == null || !"ADMIN".equalsIgnoreCase(user.getRole())) {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }

        try {
            // Lấy danh sách booking đang chờ duyệt
            List<Booking> pendingBookings = bookingDAO.getPendingBookings();
            request.setAttribute("pendingBookings", pendingBookings);
            request.getRequestDispatcher("/pendingBookings.jsp").forward(request, response);
        } catch (Exception e) {
            request.setAttribute("error", "Không thể tải danh sách booking. Vui lòng thử lại sau.");
            request.getRequestDispatcher("/WEB-INF/views/error.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null || !"ADMIN".equalsIgnoreCase(user.getRole())) {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }

        String action = request.getParameter("action");
        String bookingIdParam = request.getParameter("bookingId");

        try {
            int bookingId = Integer.parseInt(bookingIdParam);
            Booking booking = bookingDAO.findById(bookingId);

            if (booking == null) {
                request.setAttribute("error", "Không tìm thấy booking!");
                doGet(request, response);
                return;
            }

            if ("approve".equals(action)) {
                booking.setStatus("Approved");
                booking.setRejectionReason(null);
                bookingDAO.update(booking);
            } else if ("reject".equals(action)) {
                String rejectionReason = request.getParameter("rejectionReason");
                if (rejectionReason == null || rejectionReason.trim().isEmpty()) {
                    request.setAttribute("error", "Vui lòng nhập lý do từ chối!");
                    doGet(request, response);
                    return;
                }
                booking.setStatus("Rejected");
                booking.setRejectionReason(rejectionReason);
                bookingDAO.update(booking);
            }

            response.sendRedirect(request.getContextPath() + "/pendingBookings");
        } catch (NumberFormatException e) {
            request.setAttribute("error", "ID booking không hợp lệ!");
            doGet(request, response);
        } catch (Exception e) {
            request.setAttribute("error", "Có lỗi xảy ra khi xử lý yêu cầu. Vui lòng thử lại.");
            doGet(request, response);
        }
    }
}