<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AquaVista - Login</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/login.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    
 
</head>

<body>
    <div class="main-container">
        <div class="left-container">
            <div class="logo">
                <i class="fas fa-fish"></i> AquaVista
            </div>
        </div>
        <div class="login-box">
            <div class="login-title">SIGN IN</div>

            <c:if test="${not empty error}">
                <div class="alert alert-danger" style="color: red; text-align: center; margin-bottom: 15px;">
                    ${error}
                </div>
            </c:if>
          
            <form action="${pageContext.request.contextPath}/login" method="post" onsubmit="validateLoginForm(event);">
                <div class="input-group">
                    <i class="fas fa-user"></i>
                    <input type="text" id="username" name="username" placeholder="Username">
                    <div id="username-error" class="error-message">Please enter your username.</div>
                </div>

                <div class="input-group">
                    <i class="fas fa-lock"></i>
                    <input type="password" id="password" name="password" placeholder="Password">
                    <div id="password-error" class="error-message">Please enter your password.</div>
                </div>

                <button type="submit" class="login-btn">GET STARTED</button>

                <div class="links">
                    <a href="#" class="forgot">Forgot Password?</a>
                    <a href="${pageContext.request.contextPath}/register" class="create-account">CREATE ACCOUNT</a>
                </div>
            </form>
        </div>
    </div>

    <div class="footer">
        <div class="footer-left">
            <a href="#">About Us</a>
            <a href="#">Privacy Policy</a>
            <a href="#">Terms Of Use</a>
        </div>
        <div class="footer-right">
            © 2025 AquaVista. All Rights Reserved
        </div>
    </div>
</body>

</html>