<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>TOUR</title>
    <style>


         body {
                margin: 0; padding: 0;
                margin-top:80px;
                }

                .slideshow-container {
                    position: relative;
                    width: 100%;
                    height: 70vh;
                    overflow: hidden;
                }

                .slide {
                    position: absolute;
                    width: 100%;
                    height: 100%;
                    opacity: 0;
                    transition: opacity 1s ease-in-out;
                }

                .slide img {
                    width: 100%;
                    height: 100%;
                    object-fit: cover;
                }

                .active {
                    opacity: 1;
                    z-index: 1;
                }

                .prev, .next {
                    position: absolute;
                    top: 50%;
                    transform: translateY(-50%);
                    background-color: rgba(0, 0, 0, 0.4);
                    color: white;
                    font-size: 32px;
                    padding: 10px;
                    cursor: pointer;
                    border: none;
                    z-index: 2;
                    border-radius: 50%;
                }

                .prev { left: 15px; }
                .next { right: 15px; }
                .prev i, .next i { pointer-events: none; }

                .tour-list {
                    padding: 20px;
                    font-size: 18px;
                }
    </style>
</head>
<body>
<jsp:include page="navbar.jsp" />
<jsp:include page="contact-floating.jsp" />
<div class="slideshow-container">
    <div class="slide active">
        <img src="images/banner2.png" alt="Ảnh 1">
    </div>
    <div class="slide">
        <img src="images/banner3.png" alt="Ảnh 2">
    </div>
    <div class="slide">
        <img src="images/le304.png" alt="Ảnh 3">
    </div>

    <!-- Nút chuyển -->
    <button class="prev" onclick="plusSlides(-1)">
        <i class="fa-solid fa-circle-arrow-left"></i>
    </button>
    <button class="next" onclick="plusSlides(1)">
        <i class="fa-solid fa-circle-arrow-right"></i>
    </button>
</div>


<script>
    let slides = document.getElementsByClassName("slide");
    let slideIndex = 0;
    let slideInterval = setInterval(nextSlide, 3000);

    function showSlide(index) {
        for (let i = 0; i < slides.length; i++) {
            slides[i].classList.remove("active");
        }
        slides[index].classList.add("active");
    }

    function nextSlide() {
        slideIndex = (slideIndex + 1) % slides.length;
        showSlide(slideIndex);
    }

    function plusSlides(n) {
        clearInterval(slideInterval);
        slideIndex += n;
        if (slideIndex >= slides.length) slideIndex = 0;
        if (slideIndex < 0) slideIndex = slides.length - 1;
        showSlide(slideIndex);
        slideInterval = setInterval(nextSlide, 3000);
    }
</script>
<jsp:include page="touradventure.jsp" />
<jsp:include page="beachTour.jsp" />
<jsp:include page="culture.jsp" />
<jsp:include page="nature.jsp" />
<jsp:include page="historical.jsp" />
<jsp:include page="relaxation.jsp" />
<jsp:include page="footer.jsp" />
</body>
</html>