<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Register</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <style>
        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', sans-serif;
            background-color: white;
            background-size: cover;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .register-container {
            background: rgba(255, 255, 255, 0.85);
            border-radius: 15px;
            padding: 40px 30px;
            width: 100%;
            max-width: 400px;
            box-shadow: 0 8px 32px rgba(0,0,0,0.15);
            color: #004aad;
        }

        .register-container h2 {
            text-align: center;
            margin-bottom: 30px;
            font-size: 28px;
            font-weight: 600;
            color: #004aad;
        }

        .input-group {
            position: relative;
            margin-bottom: 25px;
        }

        .input-group i {
            position: absolute;
            top: 50%;
            left: 14px;
            transform: translateY(-50%);
            color: #004aad;
        }

        .input-group input {
            width: 100%;
            padding: 12px 14px 12px 38px;
            border: 1px solid #004aad;
            border-radius: 10px;
            background: #ffffff;
            color: #004aad;
            font-size: 15px;
        }

        .input-group input::placeholder {
            color: #6ca4e6;
        }

        .register-btn {
            width: 100%;
            padding: 12px;
            background-color: #002B8D;
            color: white;
            border: none;
            border-radius: 10px;
            font-weight: bold;
            cursor: pointer;
            transition: 0.3s;
        }

        .register-btn:hover {
            background-color: #FF6600;
        }

        .login-link {
            text-align: center;
            margin-top: 20px;
            font-size: 13px;
            color: #004aad;
        }

        .login-link a {
            color: #004aad;
            text-decoration: underline;
        }

        .error-message {
            color: red;
            text-align: center;
            margin-bottom: 15px;
        }

        .success-message {
            color: green;
            text-align: center;
            margin-top: 15px;
        }
    </style>
</head>
<body>
<jsp:include page="navbar.jsp" />
<jsp:include page="contact-floating.jsp" />

<div class="register-container">
    <h2>Đăng Ký</h2>
    <form action="register" method="post">
        <div class="input-group">
            <i class="fa-solid fa-envelope"></i>
            <input type="email" name="email" placeholder="email" required>
        </div>
        <div class="input-group">
            <i class="fa-solid fa-lock"></i>
            <input type="password" name="password" placeholder="mật khẩu" required>
        </div>
        <div class="input-group">
            <i class="fa-solid fa-user"></i>
            <input type="text" name="username" placeholder="tên người dùng" required>
        </div>

        <div class="error-message">${error}</div>

        <button type="submit" class="register-btn">Đăng ký</button>
    </form>

    <div class="login-link">
        Bạn đã có tài khoản? <a href="login.jsp" style="color:#FF6600">Đăng nhập</a>
    </div>

    <% if (request.getAttribute("success") != null) { %>
        <div class="success-message">Đăng ký thành công! Đang chuyển về trang đăng nhập...</div>
        <script>
            setTimeout(() => {
                window.location.href = "login.jsp";
            }, 1000);
        </script>
    <% } %>
</div>
</body>
</html>
