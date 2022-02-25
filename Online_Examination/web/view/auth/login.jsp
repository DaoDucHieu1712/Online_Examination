<%-- 
    Document   : login
    Created on : Feb 15, 2022, 5:17:19 AM
    Author     : ADMIN
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
        <link rel="stylesheet" href="././css/login.css">
    </head>
    <body>
        <div class="signup">
            <div class="signup-content">
                <h1 class="signup__heading">Sign up</h1>
                <h2 class="signup__caption">sign up with</h2>
                <div class="signup-socail">
                    <div class="signup-socail__items">
                        <i class="fab fa-google signup-socail__icons"></i>
                        <span>signup with Google</span>
                    </div>
                    <div class="signup-socail__items">
                        <i class="fab fa-facebook signup-socail__icons"></i>
                        <span>signup with Facebook</span>
                    </div>
                </div>
                <p style="color: red; margin: 15px 10px;">${notify}</p>
                <div class="signup-form">
                    <form action="login" method="POST">
                        <div class="signup-form__group">
                            <label for="name" class="signup-form__lable">Email</label>
                            <input type="email" name="email" id="name" class="signup-form__input" placeholder="Enter email ...">
                        </div>
                        <div class="signup-form__group">
                            <label for="pw" class="signup-form__lable">Password</label>
                            <input type="password" name="password" id="pw" class="signup-form__input" placeholder="Enter password ...">
                        </div>
                        <div class="signup-form__group">
                            <input type="checkbox" name="remember" value="true" id="signup-form__checkbox" class="signup-form__checkbox">
                            <label for="signup-form__checkbox" class="signup-form__term">remember me</label>
                        </div>
                        <button type="submit" class="signup-form__submit"><i class="fa-solid fa-arrow-right"></i></button>
                        <p class="signup-form__span">Don't have an account <a href="register">Register</a></p>
                    </form>
                </div>
            </div>
            <div class="signup-img">
                <img src="././image/course-1-3.png" class="signup-img__image" alt="hinhAnh">
            </div>
        </div>

    </body>
</html>
