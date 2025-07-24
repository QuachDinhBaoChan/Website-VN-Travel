<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>BOOKING</title>
    <style>
        * {
            box-sizing: border-box;
        }


        .body-wrapper {
            font-family: Arial, sans-serif;
            margin: 0 auto;
            padding: 0px 40px;
            max-width: 1230px;

        }

        h2 {
            text-align: center;
            margin-top: 20px;
        }

        .main-container {
            display: flex;
            gap: 20px;
            align-items: flex-start;
            padding: 20px;
        }

        .back-link {
            display: block;
            text-align: center;
            margin: 20px;
        }

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
                .center-wrapper {
                          display: flex;
                          justify-content: center; /* Canh giữa ngang */
                        }
                        .title {
                                        text-align: center;
                                                        color: #555;
                                        font-size: 24px;
                                        font-weight: bold;
                                                                font-family: Arial, sans-serif;
                                                                margin-bottom: 20px;
                                                                border-bottom: 3px solid #FF6600;
                                                                display: inline-block;
                                                                padding-bottom: 5px;
                                                                margin-bottom: 0px;
                                                                margin-top:50px;
                                    }
                                    .back-to-top {
                                          position: fixed;
                                          bottom: 20px;
                                          right: 20px;
                                          background-color: #002B8D;
                                          color: white;
                                          border: none;
                                          border-radius: 50%;
                                          width: 50px;
                                          height: 50px;
                                          display: flex;
                                          align-items: center;
                                          justify-content: center;
                                          cursor: pointer;
                                          opacity: 0;
                                          transition: opacity 0.4s;
                                        }
                                        .back-to-top.show {
                                              opacity: 1;
                                            }
    </style>
</head>
<body>
<jsp:include page="navbar.jsp" />
<jsp:include page="contact-floating.jsp" />
<button class="back-to-top" onclick="scrollToTop()"><i class="fas fa-chevron-up"></i></button>
<div class="slideshow-container">
    <div class="slide active">
        <img src="images/banner4.png" alt="Ảnh 1">
    </div>
    <div class="slide">
        <img src="images/banner2.png" alt="Ảnh 2">
    </div>
    <div class="slide">
        <img src="images/banner1.png" alt="Ảnh 3">
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
 function scrollToTop() {
        window.scrollTo({ top: 0, behavior: 'smooth' });
      }

      window.addEventListener('scroll', () => {
        const backToTop = document.querySelector('.back-to-top');
        backToTop.classList.toggle('show', window.scrollY > 400);
      });

</script>
<div class="center-wrapper">
  <p class="title">Tìm Kiếm Tour Phù Hợp Với Bạn!</p>
</div>
<div class="body-wrapper">

    <div class="main-container">
        <jsp:include page="searchForm.jsp"/>
        <jsp:include page="tourList.jsp"/>
    </div>
</div>
<jsp:include page="footer.jsp" />
</body>
</html>