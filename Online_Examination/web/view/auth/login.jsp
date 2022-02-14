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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
        <link rel="stylesheet" href="../../css/login.css">
    </head>
    <body>
       <div class="signup">
        <h2 class="signup__heading">Login</h2>
        <p class="signup__already">Bạn đã có tài khoản chưa? <a href="#">Đăng ký</a></p>
        <form action="#" class="signup_form">
            <div class="form__group">
                <input type="email" class="form__input" placeholder="Nhập email ...">
            </div>
            <div class="form__group">
                <input type="text" class="form__input" placeholder="Nhập mật khẩu ...">
            </div>
            <div class="form__group">
                <button class="form__submit">
                    Đăng nhập <i class="fa fa-long-arow-right"></i>
                </button>
            </div>
            <div class="form__tos">
                <input type="checkbox" id="tos">
                <label for="tos">Bạn đồng ý những với những <a href="#" class="signup_tos">điều khoản</a></label>
            </div>
        </form>
    </div>
    </body>
</html>
