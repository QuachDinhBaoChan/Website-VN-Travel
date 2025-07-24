<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.entity.Tour" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <style>

        .show-slideshow-container {
            max-width: 1200px;
            margin: 20px auto;
            padding: 0 10px;
        }
        .show-title {
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
        }
        .show-grid {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            grid-template-rows: repeat(2, auto);
            gap: 10px;
            justify-content: center;
        }
        .show-review-card {
            box-sizing: border-box;
            padding: 10px;
            text-align: center;
            background: #fff;

            border-radius: 0px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        .show-review-header {
            display: flex;
            align-items: center;
            margin-bottom: 10px;
        }
        .show-review-card img {
            width: 50px;
            height: 50px;
            object-fit: cover;
            border-radius: 50%;
            margin-right: 10px; /* Space between image and name */
        }
        .show-review-card .show-customer-name {
            font-size: 16px;
            color: #0047AB;
            font-weight: bold;
            margin: 0;
        }
        .show-review-card .show-rating {
            color: #ffcc00;
            font-size: 20px;
            margin: 0px 0;
        }
        .show-review-card p {
            font-size: 14px;
            color: #333;
            margin: 5px 0;
            flex-grow: 1; /* Allows text to fill available space */
        }
        .center-wrapper {
                  display: flex;
                  justify-content: center; /* Canh giữa ngang */
                }
    </style>
</head>
<body>

    <div class="center-wrapper">
        <div class="show-slideshow-container">
        <div class="center-wrapper">
            <div class="show-title">PHẢN HỒI TỪ KHÁCH HÀNG VỀ TOUR VN TOURIST</div>
            </div>
            <div class="show-grid">
                <div class="show-review-card">
                    <div class="show-review-header">
                        <img src="images/user.png" alt="Nguyen Van A">
                        <div class="show-customer-name">Nguyen Van A</div>
                    </div>
                    <div class="show-rating">★★★★★</div>
                    <p>Chuyến đi Mui Ne tuyệt vời với VN Tourist, cát đỏ và đồi cát đẹp mê hồn, dịch vụ chu đáo!</p>
                </div>
                <div class="show-review-card">
                    <div class="show-review-header">
                        <img src="images/user.png" alt="Tran Thi B">
                        <div class="show-customer-name">Tran Thi B</div>
                    </div>
                    <div class="show-rating">★★★★★</div>
                    <p>Nha Trang với bãi biển đẹp, nước trong xanh, VN Tourist tổ chức rất chuyên nghiệp!</p>
                </div>
                <div class="show-review-card">
                    <div class="show-review-header">
                        <img src="images/user.png" alt="Le Van C">
                        <div class="show-customer-name">Le Van C</div>
                    </div>
                    <div class="show-rating">★★★★★</div>
                    <p>Khám phá ruộng bậc thang Sapa cùng VN Tourist, trải nghiệm văn hóa bản địa tuyệt vời!</p>
                </div>
                <div class="show-review-card">
                    <div class="show-review-header">
                        <img src="images/user.png" alt="Pham Thi D">
                        <div class="show-customer-name">Pham Thi D</div>
                    </div>
                    <div class="show-rating">★★★★★</div>
                    <p>Hang động Phong Nha hùng vĩ, VN Tourist hướng dẫn viên tận tâm, chuyến đi đáng nhớ!</p>
                </div>
                <div class="show-review-card">
                    <div class="show-review-header">
                        <img src="images/user.png" alt="Hoang Van E">
                        <div class="show-customer-name">Hoang Van E</div>
                    </div>
                    <div class="show-rating">★★★★★</div>
                    <p>Chợ nổi Cần Thơ sôi động, VN Tourist giúp khám phá văn hóa miền Tây dễ dàng!</p>
                </div>
                <div class="show-review-card">
                    <div class="show-review-header">
                        <img src="images/user.png" alt="Nguyen Thi F">
                        <div class="show-customer-name">Nguyen Thi F</div>
                    </div>
                    <div class="show-rating">★★★★★</div>
                    <p>Thành phố Huế cổ kính, VN Tourist mang đến trải nghiệm lịch sử tuyệt vời!</p>
                </div>
                <div class="show-review-card">
                    <div class="show-review-header">
                        <img src="images/user.png" alt="Tran Van G">
                        <div class="show-customer-name">Tran Van G</div>
                    </div>
                    <div class="show-rating">★★★★★</div>
                    <p>Đảo Côn Đảo hoang sơ, biển đẹp, dịch vụ VN Tourist rất tốt!</p>
                </div>
                <div class="show-review-card">
                    <div class="show-review-header">
                        <img src="images/user.png" alt="Le Thi H">
                        <div class="show-customer-name">Le Thi H</div>
                    </div>
                    <div class="show-rating">★★★★★</div>
                    <p>Tam Đảo mát mẻ, không khí trong lành, VN Tourist tổ chức chu đáo!</p>
                </div>
            </div>
        </div>

</div>
</body>
</html>