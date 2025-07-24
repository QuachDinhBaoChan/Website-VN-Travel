<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Điểm Mạnh</title>

    <!-- Font Awesome CDN -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f7f7f7;
            margin: 0;
            padding: 0;
        }

        .section-title {
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
                        margin-top:160px;
        }

.center-wrapper {
                  display: flex;
                  justify-content: center; /* Canh giữa ngang */
                }


        .strengths {
            display: flex;
            justify-content: center;
            gap: 23px;
            padding: 30px;
            flex-wrap: wrap;
        }

        .strength-item {
            background-color: #fff;
            border: 1px solid #FF6600;
            border-radius: 10px;
            width: 230px;
            text-align: center;
            padding: 13px 25px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
            transition: transform 0.3s ease;
        }

        .strength-item:hover {
            transform: translateY(-5px);
        }

        .strength-item i {
            font-size: 40px;
            color: #003399;
            margin-bottom: 15px;
        }

        .strength-item h3 {
            color: #003399;
            font-size: 16px;
            margin-bottom: 10px;
        }

        .strength-item p {
            color: #555;
            font-size: 14px;
            line-height: 1.4;
        }
    </style>
</head>
<body>
<div class="center-wrapper">
<div class="section-title">ĐIỂM MẠNH</div>
</div>
<div class="strengths">
    <div class="strength-item">
        <i class="fa-solid fa-handshake"></i>
        <h3>Chuyên nghiệp, uy tín</h3>
        <p>Đội ngũ nhân viên giàu kinh nghiệm, xử lý nhanh chóng, thương hiệu uy tín, an toàn</p>
    </div>

    <div class="strength-item">
        <i class="fa-solid fa-hand-fist"></i>
        <h3>Thế mạnh Châu Mỹ</h3>
        <p>Am hiểu sâu rộng các điểm đến và văn hoá bản địa tại Châu Mỹ</p>
    </div>

    <div class="strength-item">
        <i class="fa-solid fa-gift"></i>
        <h3>Giá tốt – Quà tặng</h3>
        <p>Ưu đãi và nhiều khuyến mãi, quà tặng hấp dẫn khi mua tour</p>
    </div>

    <div class="strength-item">
        <i class="fa-solid fa-globe"></i>
        <h3>Tư vấn miễn phí</h3>
        <p>Hỗ trợ tư vấn miễn phí</p>
    </div>
</div>

</body>
</html>
