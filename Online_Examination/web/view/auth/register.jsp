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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    </head>
    <body>
        <div class="insert">
            <div class="insert-form">
                <h1 class="insert-heading">Registration</h1>
                <form action="register" method="POST">
                    <div class="insert-form__group">
                        <label for="insert-form__input" class="insert-form__lable">Full Name</label>
                        <input type="text" name="full_name" class="insert-form__input" placeholder="Enter name ...">
                    </div>
                    <div class="insert-form__group">
                        <label for="insert-form__input" class="insert-form__lable">Day of birth</label>
                        <input type="date" name="dob" class="insert-form__input">
                    </div>
                    <div class="insert-form__group">
                        <label for="insert-form__input" class="insert-form__lable">Address</label>
                        <input type="text" name="address" class="insert-form__input" placeholder="Enter address ...">
                    </div>
                    <div class="insert-form__group">
                        <label for="insert-form__input" class="insert-form__lable">Phone</label>
                        <input type="text" name="phone" class="insert-form__input" placeholder="Enter phone ...">
                    </div>
                    <div class="insert-form__group">
                        <label for="insert-form__input" class="insert-form__lable">Email</label>
                        <input type="email" name="email" class="insert-form__input" placeholder="Enter email ...">
                    </div>
                    <div class="insert-form__group">
                        <label for="insert-form__input" class="insert-form__lable">Password</label>
                        <input type="password" name="password" class="insert-form__input" placeholder="Enter password ...">
                    </div>
                    <p>Gender</p>
                    <div class="insert-form__group">
                        <input type="radio" name="gender" class="insert-form__radio" id="insert-form__radio">
                        <label for="insert-form__radio" class="insert-form__check">Male</label>
                    </div>
                    <div class="insert-form__group">
                        <input type="radio" name="gender" class="insert-form__radio" id="insert-form__radio1">
                        <label for="insert-form__radio1" class="insert-form__check">Female</label>
                    </div>
                    <button type="submit" class="insert-form__submit">Insert</button>
                </form>
            </div>
            <div class="insert-img">
                <img src="././image/course-1-5.png" alt="">
            </div>
        </div>
    </body>
</html>
