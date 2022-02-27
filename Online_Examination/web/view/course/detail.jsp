<%-- 
    Document   : detail
    Created on : Feb 22, 2022, 10:44:11 PM
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
        <link rel="stylesheet"  href="././css/dashboard.css">
        <link rel="stylesheet"  href="././css/detail-course.css">
    </head>
    <body>

        <header class="header">
            <div class="header__dashboard">
                <i class="fa-solid fa-bars header__bar"></i>
                <a href="#home" class="header__logo"><i class="fa-solid fa-user-graduate header__icon"></i>Dashboard</a>
            </div>
            <ul class="header__list">
                <li class="header__items"><a href="#">Student</a></li>
                <li class="header__items"><a href="#">Course</a></li>
                <li class="header__items"><a href="#">Question</a></li>
                <li class="header__items"><a href="#">Exam</a></li>
                <li class="header__items"><a href="#">Feedback</a></li>
            </ul>
            <div class="header__account">
                <a href="#account" onclick="show_dropdown()" class="header__user"><i
                        class="fa-solid fa-user header__account-icon"></i></a>
                <ul class="header__dropdown">
                    <li class="header__dropdown-items"><a href="#"><i class="fa-solid fa-user-check"></i>infomation</a></li>
                    <li class="header__dropdown-items"><a href="#"><i class="fa-solid fa-lock"></i>change password</a></li>
                    <li class="header__dropdown-items"><a href="#"><i class="fa-solid fa-right-from-bracket"></i>Logout</>
                    </li>
                </ul>
            </div>
        </header>
        <div class="sidebar sidebar-show">
            <h2 class="sidebar__heading">Course Manager</h2>
            <ul class="sidebar__list">
                <li class="sidebar__items"><a href="#">FRF192<i class="fa-solid fa-caret-right"></i></a></li>
                <li class="sidebar__items"><a href="#">PFP192<i class="fa-solid fa-caret-right"></i></a></li>
                <li class="sidebar__items"><a href="#">PRJ301<i class="fa-solid fa-caret-right"></i></a></li>
                <li class="sidebar__items"><a href="#">PRO192<i class="fa-solid fa-caret-right"></i></a></li>
            </ul>
        </div>

        <div class="section">
            <div class="section__detail">
                <h2 class="section__heading">Course</h2>
                <div class="section-form">
                    <label class="section_lable">ID</label>
                    <input type="text" class="section__input" value="${requestScope.course.id}" disabled>
                </div>
                <div class="section-form">
                    <label class="section_lable">Name</label>
                    <input type="text" class="section__input" value="${requestScope.course.name}" disabled>
                </div>
                <div class="section-form">
                    <label class="section_lable">Course Name</label>
                    <input type="text" class="section__input" value="${requestScope.course.display_name}" disabled>
                </div>
                <div class="section-form">
                    <label class="section_lable">Department</label>
                    <input type="text" class="section__input" value="${requestScope.course.department.name}" disabled>
                </div>
                <a class="section__link" href="#home">List Course</a>
            </div>
            <div class="section__img">
                <img src="image/course-1-1.png" alt="">
            </div>
        </div>
        <script src="././js/dashboard.js"></script>
    </body>
</html>
