package com.example.util;

import com.example.entity.Booking;
import com.example.entity.Tour;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import java.time.LocalDate;
import java.util.List;

public class TourDAO {
    private final SessionFactory sessionFactory;

    public TourDAO(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public List<Tour> getFirstThreeTours() {
        try (Session session = sessionFactory.openSession()) {
            Query<Tour> query = session.createQuery("FROM Tour ORDER BY id ASC", Tour.class);
            query.setMaxResults(3);
            return query.list();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public Tour getTourById(int id) {
        try (Session session = sessionFactory.openSession()) {
            return session.get(Tour.class, id);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public List<Tour> getAllTours() {
        try (Session session = sessionFactory.openSession()) {
            Query<Tour> query = session.createQuery("FROM Tour ORDER BY id ASC", Tour.class);
            return query.list();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public List<Tour> searchTours(String departureLocation, String destination, LocalDate departureDate,
                                  Integer minDays, Integer maxDays, Double minPrice, Double maxPrice) {
        try (Session session = sessionFactory.openSession()) {
            String hql = "FROM Tour WHERE 1=1";
            if (departureLocation != null && !departureLocation.isEmpty()) {
                hql += " AND departureLocation = :departureLocation";
            }
            if (destination != null && !destination.isEmpty()) {
                hql += " AND destination = :destination";
            }
            if (departureDate != null) {
                hql += " AND departureDate = :departureDate";
            }
            if (minDays != null || maxDays != null) {
                hql += " AND duration BETWEEN :minDays AND :maxDays";
            }
            if (minPrice != null || maxPrice != null) {
                hql += " AND price BETWEEN :minPrice AND :maxPrice";
            }

            Query<Tour> query = session.createQuery(hql, Tour.class);
            if (departureLocation != null && !departureLocation.isEmpty()) {
                query.setParameter("departureLocation", departureLocation);
            }
            if (destination != null && !destination.isEmpty()) {
                query.setParameter("destination", destination);
            }
            if (departureDate != null) {
                query.setParameter("departureDate", departureDate);
            }
            if (minDays != null || maxDays != null) {
                query.setParameter("minDays", minDays != null ? minDays : 0);
                query.setParameter("maxDays", maxDays != null ? maxDays : Integer.MAX_VALUE);
            }
            if (minPrice != null || maxPrice != null) {
                query.setParameter("minPrice", minPrice != null ? minPrice : 0.0);
                query.setParameter("maxPrice", maxPrice != null ? maxPrice : Double.MAX_VALUE);
            }

            return query.list();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}