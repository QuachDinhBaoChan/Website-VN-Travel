<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
    .body-container {
        max-width: 1200px;
        margin: 0 auto;
    }

    h2 {
        text-align: center;
        margin-bottom: 0px;
    }

    .tour-container {
        display: grid;
        grid-template-columns: repeat(3, 250px); /* 3 tours per row */
        gap: 20px;
        justify-content: center;
    }

    .tour-card {
        border: 1px solid #FF6600;
        background-color: #fff;
        border-radius: 15px;
        overflow: hidden;
        box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        display: flex;
        flex-direction: column;
        text-align: center;
        transition: transform 0.2s;
        font-size: 14px;
        height: 380px;
        width: 250px;
    }

    .tour-card:hover {
        transform: translateY(-5px);
    }

    .tour-card img {
        width: 100%;
        height: 200px;
        object-fit: cover;
        object-position: center;
        background-color: #ccc;
    }

    .tour-card .price {
        font-size: 16px;
        color: #e91e63;
        margin: 8px 0;
    }

    .tour-card .details {
        padding: 10px 12px;
        flex: 1;
        display: flex;
        flex-direction: column;
        justify-content: center;
    }

    .tour-card .details p.name {
        margin: 2px 0;
        color: #002B8D;
        font-size: 20px;
        font-weight: bold;
    }

    .tour-card .details p.description,
    .tour-card .details p.category {
        margin: 3px 0;
        color: #555;
        font-size: 12px; /* Smaller font to fit all content */
    }

    .tour-card .view-btn {
        background-color: transparent;
        color: #FF6600;
        padding: 5px 14px;
        text-decoration: none;
        border-radius: 8px;
        margin: 10px auto 15px;
        font-size: 13px;
        border: 1px solid #FF6600;
    }

    .tour-card .view-btn:hover {
        background-color: #FF6600;
        color: white;
    }

    .tour-card .duration {
        display: flex;
        align-items: center;
        justify-content: center;
        gap: 6px;
        margin-top: 3px;
        font-size: 14px;
        color: #555;
    }

    .tour-card .duration i {
        font-size: 16px;
    }
</style>

<div class="tour-container">
    <c:forEach var="tour" items="${tours}">
        <div class="tour-card">
            <img src="${tour.imageUrl}" alt="${tour.name}" onerror="this.src='images/default.jpg'">
            <div class="details">
                <p class="name"><strong>${tour.name}</strong></p>
                <p class="description">${tour.description}</p>
                <p class="category">Category: ${tour.category}</p>
                <div class="duration">
                    <i class="fa-regular fa-clock"></i>
                    <span>${tour.duration} ngày</span>
                </div>
            </div>
            <div class="price">$${tour.price}</div>
            <a href="tourDetail?id=${tour.id}" class="view-btn">View Details</a>
        </div>
    </c:forEach>
</div>