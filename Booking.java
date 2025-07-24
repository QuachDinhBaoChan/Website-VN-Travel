package com.example.entity;

import jakarta.persistence.*;

import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Date;

@Entity
@Table(name = "booking")
public class Booking {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;

    @ManyToOne
    @JoinColumn(name = "tour_id", nullable = false)
    private Tour tour;

    @ManyToOne
    @JoinColumn(name = "user_id", nullable = false)
    private User user;

    @Column(name = "full_name", nullable = false)
    private String fullName;

    @Column(name = "email", nullable = false)
    private String email;

    @Column(name = "number_of_people", nullable = false)
    private int numberOfPeople;

    @Column(name = "booking_date", nullable = false)
    private LocalDate bookingDate;

    @Column(name = "status")
    private String status;

    @Column(name = "rejectionReason")
    private String rejectionReason;

    public Booking() {}

    public Booking(Tour tour, User user, String fullName, String email, int numberOfPeople, LocalDate bookingDate, String status, String rejectionReason) {
        this.tour = tour;
        this.user = user;
        this.fullName = fullName;
        this.email = email;
        this.numberOfPeople = numberOfPeople;
        this.bookingDate = bookingDate;
        this.status = status;
        this.rejectionReason = rejectionReason;
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public Tour getTour() { return tour; }
    public void setTour(Tour tour) { this.tour = tour; }

    public User getUser() { return user; }
    public void setUser(User user) { this.user = user; }

    public String getFullName() { return fullName; }
    public void setFullName(String fullName) { this.fullName = fullName; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public int getNumberOfPeople() { return numberOfPeople; }
    public void setNumberOfPeople(int numberOfPeople) { this.numberOfPeople = numberOfPeople; }

    public LocalDate getBookingDate() { return bookingDate; }
    public void setBookingDate(LocalDate bookingDate) { this.bookingDate = bookingDate; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }

    public String getRejectionReason() { return rejectionReason; }
    public void setRejectionReason(String rejectionReason) { this.rejectionReason = rejectionReason; }

    @Transient
    public Date getBookingDateAsDate() {
        if (this.bookingDate != null) {
            return Date.from(this.bookingDate.atStartOfDay(ZoneId.systemDefault()).toInstant());
        }
        return null;
    }
}