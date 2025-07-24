package com.example.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

import com.example.util.EmailUtil;

@WebServlet("/sendEmail")
public class SendEmailServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Đảm bảo xử lý UTF-8 cho request
        request.setCharacterEncoding("UTF-8");

        String email = request.getParameter("email");

        if (email != null && !email.trim().isEmpty()) {
            String subject = "Xác nhận đặt tour thành công";
            String body = "VN Tourist chào bạn,\n\n"
                    + "Bạn đã đặt tour thành công!\n\n"
                    + "Trân trọng,\n\n"
                    + "CÔNG TY CỔ PHẦN DU LỊCH VN TOURIST\n\n"
                    + "123 Trần Đại Nghĩa, Ngũ Hành Sơn, Tp. Đà Nẵng\n\n"
                    + "Email: info@vntourist.com.vn\n\n"
                    + "Hotline: 0999 888 777\n";

            boolean emailSent = EmailUtil.sendEmail(email, subject, body);

            if (emailSent) {
                request.setAttribute("message", "✅ Email xác nhận đã được gửi thành công!");
            } else {
                request.setAttribute("message", "❌ Gửi email thất bại. Vui lòng thử lại sau!");
            }

            request.getRequestDispatcher("/success.jsp").forward(request, response);
        } else {
            // Điều hướng nếu email không hợp lệ
            response.sendRedirect(request.getContextPath() + "/success.jsp?error=Email không hợp lệ");
        }
    }
}
