package com.example.util;

import com.example.entity.Booking;
import com.example.entity.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import jakarta.persistence.EntityManagerFactory;
import java.util.Collections;
import java.util.List;

public class BookingDAO {
    private static final Logger logger = LoggerFactory.getLogger(BookingDAO.class);
    private final SessionFactory sessionFactory;

    public BookingDAO(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    // Lấy danh sách booking của người dùng
    public List<Booking> getBookingsByUser(User user) {
        if (user == null) {
            return Collections.emptyList();
        }
        try (Session session = sessionFactory.openSession()) {
            String hql = "FROM Booking b WHERE b.user = :user ORDER BY b.bookingDate DESC";
            Query<Booking> query = session.createQuery(hql, Booking.class);
            query.setParameter("user", user);
            return query.getResultList(); // Sử dụng getResultList() trong Hibernate 6
        } catch (Exception e) {
            logger.error("Error fetching bookings for user: {}", user, e);
            return Collections.emptyList();
        }
    }

    // Lấy tất cả các booking đang ở trạng thái Pending
    public List<Booking> getPendingBookings() {
        try (Session session = sessionFactory.openSession()) {
            String hql = "FROM Booking b WHERE b.status = :status ORDER BY b.bookingDate DESC";
            Query<Booking> query = session.createQuery(hql, Booking.class);
            query.setParameter("status", "Pending");
            return query.getResultList(); // Sử dụng getResultList() trong Hibernate 6
        } catch (Exception e) {
            logger.error("Error fetching pending bookings", e);
            return Collections.emptyList();
        }
    }

    // Tìm booking theo ID (int)
    public Booking findById(int id) {
        try (Session session = sessionFactory.openSession()) {
            return session.find(Booking.class, id); // Sử dụng find() thay vì get() trong Hibernate 6
        } catch (Exception e) {
            logger.error("Error finding booking by ID: {}", id, e);
            return null;
        }
    }

    // Cập nhật thông tin booking
    public void update(Booking booking) {
        Transaction tx = null;
        try (Session session = sessionFactory.openSession()) {
            tx = session.beginTransaction();
            session.merge(booking);
            tx.commit();
        } catch (Exception e) {
            if (tx != null) tx.rollback();
            logger.error("Error updating booking: {}", booking, e);
        }
    }

    // Cập nhật trạng thái thanh toán
    public boolean updatePaymentStatus(String bookingIdStr, String status) {
        Transaction tx = null;
        try {
            int id = Integer.parseInt(bookingIdStr);
            try (Session session = sessionFactory.openSession()) {
                tx = session.beginTransaction();
                Booking booking = session.find(Booking.class, id);
                if (booking != null) {
                    booking.setStatus(status);
                    session.merge(booking);
                    tx.commit();
                    return true;
                }
                tx.rollback();
                return false;
            }
        } catch (NumberFormatException e) {
            logger.error("Invalid booking ID format: {}", bookingIdStr, e);
            return false;
        } catch (Exception e) {
            if (tx != null) tx.rollback();
            logger.error("Error updating payment status for booking ID: {}", bookingIdStr, e);
            return false;
        }
    }
}