package com.example.servlet;

import com.example.entity.Booking;
import com.example.entity.Tour;
import com.example.entity.User;
import com.example.util.HibernateUtil;
import com.example.util.TourDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet("/submitTourBooking")
@MultipartConfig // THÊM nếu form có multipart/form-data
public class TourBookingServlet extends HttpServlet {
    private static final Logger LOGGER = Logger.getLogger(TourBookingServlet.class.getName());
    private TourDAO tourDAO;

    @Override
    public void init() {
        tourDAO = new TourDAO(HibernateUtil.getSessionFactory());
        if (tourDAO == null) {
            LOGGER.severe("Failed to initialize TourDAO due to null SessionFactory");
        } else {
            LOGGER.info("TourDAO initialized successfully.");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/plain");
        response.setCharacterEncoding("UTF-8");

        Session session = null;
        Transaction transaction = null;

        try {
            // Lấy thông tin từ form
            int tourId = Integer.parseInt(request.getParameter("tourId"));
            String fullName = request.getParameter("fullName");
            String email = request.getParameter("email");
            int numberOfPeople = Integer.parseInt(request.getParameter("numberOfPeople"));
            String bookingDateStr = request.getParameter("bookingDate");

            // Parse ngày đặt tour
            LocalDate bookingDate = LocalDate.parse(bookingDateStr, DateTimeFormatter.ISO_LOCAL_DATE);
            LocalDate currentDate = LocalDate.now();

            // Lấy user từ session
            User user = (User) request.getSession().getAttribute("user");
            if (user == null) {
                response.getWriter().write("error: Please log in to book a tour.");
                return;
            }

            // Lấy thông tin tour
            Tour tour = tourDAO.getTourById(tourId);
            if (tour == null) {
                response.getWriter().write("error: Tour not found.");
                return;
            }

            // Kiểm tra số người
            if (numberOfPeople <= 0 || numberOfPeople > tour.getNumberOfPeople()) {
                response.getWriter().write("error: Number of people must be between 1 and " + tour.getNumberOfPeople() + ".");
                return;
            }

            // Kiểm tra ngày
            if (bookingDate.isBefore(currentDate)) {
                response.getWriter().write("error: Booking date cannot be in the past.");
                return;
            }

            // Tạo booking
            Booking booking = new Booking();
            booking.setTour(tour);
            booking.setUser(user);
            booking.setFullName(fullName);
            booking.setEmail(email);
            booking.setNumberOfPeople(numberOfPeople);
            booking.setBookingDate(bookingDate);
            booking.setStatus("Pending");

            // Lưu vào database
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            session.save(booking);
            transaction.commit();

            response.getWriter().write("success");

        } catch (NumberFormatException e) {
            LOGGER.log(Level.SEVERE, "Invalid number format", e);
            if (transaction != null && transaction.isActive()) transaction.rollback();
            response.getWriter().write("error: Invalid input format. Please enter valid numbers.");
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Unexpected error in TourBookingServlet.doPost", e);
            if (transaction != null && transaction.isActive()) transaction.rollback();
            response.getWriter().write("error: An unexpected error occurred. Please try again later.");
        } finally {
            if (session != null && session.isOpen()) {
                session.close();
            }
        }
    }
}
