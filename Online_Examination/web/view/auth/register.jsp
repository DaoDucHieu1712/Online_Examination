<%-- 
    Document   : register
    Created on : Feb 16, 2022, 7:47:36 AM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="././css/register.css">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;700&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;700&display=swap" rel="stylesheet">
    </head>
    <body>
        <div class="register">
            <h2 class="register__heading">Register</h2>
            <p class="register__para">Nhanh chóng và dễ dàng</p>
            <form action="register" method="POST" class="register__form">
                <div class="form_group">
                    <label class="form__lable">Full Name</label><br>
                    <input type="text" name="full_name" class="form__input" placeholder="Nhập tên của bạn ....">
                </div>
                <div class="form__group" style="margin-top: 10px;">
                    <label class="form__lable">Giới tính: </label><br>
                    <input type="radio" class="form__radio" name="gender" value="male"> Male <br>
                    <input type="radio" class="form__radio" name="gender" value="female"> Female <br>
                </div>
                <div class="form__group">
                    <label class="form__lable">Ngày sinh</label><br>
                    <input type="date" name="dob" class="from__input">
                </div>
                <div class="form__group">
                    <label class="form__lable">Phone</label><br>
                    <input type="text" name="phone" class="form__input" placeholder="Nhập sđt của bạn ...." >
                </div>
                <div class="form__group">
                    <label class="form__lable">Address</label><br>
                    <input type="text" name="address" class="form__input" placeholder="Nhập địa chỉ của bạn ....">
                </div>
                <div class="form__group">
                    <label class="form__lable">Email</label><br>
                    <input type="text" name="email" class="form__input" placeholder="Nhập email của bạn ....">
                </div>
                <div class="form__group">
                    <label class="form__lable">Password</label><br>
                    <input type="password" name="password" class="form__input" placeholder="Nhập password của bạn ....">
                </div>
                <div class="form__group">
                    <button type="submit" class="form__submit">Đăng ký</button>
                </div>
            </form>
        </div>
    </body>
</html>
