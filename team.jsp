<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Team Building DKRA</title>
    <style>


        .container {
            position: relative;
            width: 145vh;
            height: 60vh;
            margin: 0px auto;
        }

        .main-image {
            width: 100%;
            height: 100%;
            object-fit: cover;
            border-radius: 15px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.3);
        }

        .gallery {
            position: absolute;
            bottom: -20%;
            left: 50%;
            transform: translateX(-50%);
            display: flex;
            gap: 10px;
            z-index: 10;
        }

        .gallery img {
            width: 25vh;
            height: 15vh;
            object-fit: cover;
            border-radius: 10px;
            border: 4px solid white;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.25);
            transition: transform 0.3s ease;
        }

        .gallery img:hover {
            transform: scale(1.05);
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
                                    margin-bottom: 40px;
                                    margin-top:50px;
        }
        .center-wrapper {
                          display: flex;
                          justify-content: center; /* Canh giữa ngang */
                        }

    </style>
</head>
<body>
<div class="center-wrapper">
<div class="title">HOẠT ĐỘNG DU LỊCH NỔI BẬT</div>
</div>
<div class="container">
    <img src="images/hd2.png" alt="Team Building Main" class="main-image">

    <div class="gallery">
        <img src="images/hd1.png" alt="Sub Image 1">
        <img src="images/hd3.png" alt="Sub Image 2">
        <img src="images/hdchinh.png" alt="Sub Image 3">
        <img src="images/hd4.png" alt="Sub Image 4">
    </div>
</div>

</body>
</html>
