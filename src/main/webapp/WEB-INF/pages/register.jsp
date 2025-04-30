<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AquaVista - Sign Up</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/register.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
</head>

<body>
    <div class="main-container">
        <div class="left-container">
            <div class="logo">
                <i class="fas fa-fish"></i> AquaVista
            </div>
        </div>

        <div class="signup-box">
            <div class="signup-title">SIGN UP</div>

            <form action="${pageContext.request.contextPath}/register" method="post">
                <div class="form-row">
                    <div class="form-group">
                        <label for="firstName">First Name</label>
                        <input 
                            type="text" 
                            id="firstName" 
                            name="firstName" 
                            class="form-control" 
                            placeholder="First Name" 
                            value="${firstName != null ? firstName : ''}" 
                            required 
                            title="Please enter your first name.">
                    </div>

                    <div class="form-group">
                        <label for="lastName">Last Name</label>
                        <input 
                            type="text" 
                            id="lastName" 
                            name="lastName" 
                            class="form-control" 
                            placeholder="Last Name" 
                            value="${lastName != null ? lastName : ''}" 
                            required 
                            title="Please enter your last name.">
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group">
                        <label for="email">Your Email</label>
                        <input 
                            type="email" 
                            id="email" 
                            name="email" 
                            class="form-control" 
                            placeholder="Your Email" 
                            value="${email != null ? email : ''}" 
                            required 
                            title="Please enter a valid email address.">
                    </div>

                    <div class="form-group">
                        <label for="username">Username</label>
                        <input 
                            type="text" 
                            id="username" 
                            name="username" 
                            class="form-control" 
                            placeholder="Username" 
                            value="${username != null ? username : ''}" 
                            required 
                            title="Please enter a username.">
                    </div>
                </div>

                <div class="form-group">
                    <label for="password">Password</label>
                    <input 
                        type="password" 
                        id="password" 
                        name="password" 
                        class="form-control" 
                        placeholder="Password" 
                        pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" 
                        title="Password must be at least 8 characters long, include one uppercase letter, one lowercase letter, and one number." 
                        required>
                </div>

                <div class="checkbox-group">
                    <input 
                        type="checkbox" 
                        id="termsCheckbox" 
                        name="agreeTerms" 
                        required 
                        title="You must agree to the terms and conditions.">
                    <label for="termsCheckbox">I agree to the <a href="#" class="terms-link">Terms and Conditions</a></label>
                </div>

                <button type="submit" class="signup-btn">GET STARTED</button>

                <div class="links">
                    <span>Already have an account?</span>
                    <a href="${pageContext.request.contextPath}/login" class="create-account">SIGN IN</a>
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