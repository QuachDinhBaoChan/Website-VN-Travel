package com.example.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.example.util.BookingDAO;
import com.example.util.EmailUtil;
import com.example.util.HibernateUtil;
import org.hibernate.SessionFactory;

import java.io.IOException;

@WebServlet("/confirmPayment")
public class ConfirmPaymentServlet extends HttpServlet {
    private BookingDAO bookingDAO;

    @Override
    public void init() throws ServletException {
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        bookingDAO = new BookingDAO(sessionFactory);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String bookingId = request.getParameter("bookingId");
        String email = request.getParameter("email");

        System.out.println("Booking ID: " + bookingId);
        System.out.println("Email: " + email);

        if (bookingId != null && email != null && !email.isEmpty()) {
            // Soạn nội dung email
            String subject = "Xác nhận thanh toán tour thành công";
            String body = "VN Tourist chào bạn,\n\n"
                    + "Bạn đã đặt tour thành công!\n\n"
                    + "CÔNG TY CỔ PHẦN DU LỊCH VN TOURIST\n\n"
                    + "123 Trần Đại Nghĩa, Ngũ Hành Sơn, Tp. Đà Nẵng\n\n"
                    + "Email: info@vntourist.com.vn\n\n"
                    + "Hotline: 0999 888 777\n\n"
                    + "Trân trọng,\n";

            // Chỉ khi gửi email thành công thì mới cập nhật trạng thái
            boolean emailSent = EmailUtil.sendEmail(email, subject, body);

            if (emailSent) {
                boolean paymentSuccess = bookingDAO.updatePaymentStatus(bookingId, "Paid");

                if (paymentSuccess) {
                    request.setAttribute("success", true);
                } else {
                    request.setAttribute("error", "Cập nhật trạng thái thanh toán thất bại");
                }
            } else {
                request.setAttribute("error", "Gửi email thất bại");
            }

            // Forward đến trang kết quả
            request.getRequestDispatcher("/pay.jsp").forward(request, response);
        } else {
            response.sendRedirect(request.getContextPath() + "/pay.jsp?error=Thông tin không hợp lệ");
        }
    }

}
