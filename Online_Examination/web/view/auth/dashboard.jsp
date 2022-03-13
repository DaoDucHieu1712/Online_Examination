<%-- 
    Document   : dashboard
    Created on : Mar 1, 2022, 10:18:21 PM
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
        <style>
            html {
                font-size: 62.5%;
                font-family: "Poppins", sans-serif;
            }

            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                list-style-type: none;
                text-decoration: none;
            }

            body {
                letter-spacing: 1px;
                width: 100%;
                height: 100vh;
            }

            .header {
                width: 100%;
                position: fixed;
                top: 0;
                left: 0;
                font-size: 1.8rem;
                display: flex;
                align-items: center;
                justify-content: space-between;
                padding: 20px;
                background-color: white;
                box-shadow: 0 0 3px 2px rgba(0, 0, 0, 0.233);
                z-index: 2;
            }
            .header__logo {
                font-size: 2rem;
                text-transform: uppercase;
                font-weight: bold;
                transition: 0.25 linear;
                color: #0eb582;
            }
            .header__logo:hover {
                color: #0eb582;
            }
            .header__name {
                font-size: 1.6rem;
                font-weight: bold;
            }
            .header__name i {
                margin-left: 5px;
                cursor: pointer;
            }
            .header__bar {
                font-size: 2rem;
                margin-right: 100px;
                padding: 10px 11px;
                background-color: #eee;
                border-radius: 50%;
                border: 2px solid #999;
                transition: 0.45s linear;
                cursor: pointer;
            }
            .header__bar:hover {
                transform: rotate(180deg);
                background-color: rgba(153, 153, 153, 0.562);
            }
            .header__icon {
                margin-right: 5px;
            }
            .header a {
                color: black;
            }
            .header__list {
                display: flex;
            }
            .header__items {
                margin: 0 15px;
                font-weight: bold;
            }
            .header__items a {
                transition: 0.25s linear;
            }
            .header__items a:hover {
                font-size: 1.7rem;
                color: #0eb582;
            }
            .header__user {
                margin-right: 15rem;
                transition: 0.25s linear;
            }
            .header__user:hover {
                color: #0eb582;
            }
            .header__account {
                position: relative;
            }
            .header__dropdown {
                width: 200px;
                padding: 5px;
                border-radius: 5px;
                position: absolute;
                top: 45px;
                left: 0;
                background-color: rgba(14, 181, 130, 0.7);
                opacity: 0;
                visibility: hidden;
                transition: 0.25s linear;
            }
            .header__dropdown i {
                margin-right: 11px;
            }
            .header__dropdown.droppdown-ishow {
                opacity: 1;
                visibility: visible;
            }
            .header__dropdown a {
                color: white;
            }
            .header__dropdown-items:not(:last-child) {
                padding: 10px;
                font-size: 1.4rem;
                transition: 0.25s linear;
            }
            .header__dropdown-items:not(:last-child):hover {
                background-color: rgba(14, 181, 130, 0.9);
            }
            body {
                overflow-x: hidden;
            }

            .container {
                margin: 120px auto;
            }
            .container__heading {
                text-align: center;
                font-size: 3rem;
                margin-bottom: 50px;
            }
            .container__course {
                margin: 100px 0;
            }

            .course-list {
                width: 100%;
                display: flex;
                justify-content: center;
                margin-bottom: 35px;
            }
            .course__items {
                width: 33.3333333333%;
                height: 500px;
                margin: 0 100px;
            }
            .course__items img {
                width: 100%;
                height: 100%;
                object-fit: cover;
            }

            .subject-list {
                display: flex;
                justify-content: space-evenly;
            }
            .subject__card {
                border: 2px solid #0eb582;
                padding: 25px;
                background-color: rgba(14, 181, 130, 0.1);
                color: black;
                transition: 0.3s linear;
                cursor: pointer;
            }
            .subject__card:hover {
                background-color: #0eb582;
                color: white;
            }
            .subject__name {
                text-align: center;
                font-size: 1.3rem;
                font-weight: bold;
                margin: 4px 0px;
            }
            .subject__quantity {
                text-align: center;
            }

            .footer {
                width: 100;
                font-size: 1.6rem;
                padding: 35px;
                background-color: rgba(14, 181, 130, 0.1);
            }
            .footer__list {
                display: flex;
                transform: translateX(50%);
            }
            .footer__items {
                margin: 0px 5px;
                font-size: 2rem;
            }
            .footer__credit {
                margin-top: 30px;
                padding: 7px;
                text-align: center;
                position: relative;
            }
            .footer__credit span {
                color: #0eb582;
                font-size: 1.7rem;
                font-weight: bold;
            }

            /*# sourceMappingURL=style.css.map */

        </style>
    </head>
    <body>
        <header class="header">
            <div class="header__dashboard">
                <i class="fa-solid fa-bars header__bar"></i>
                <a href="dashboard" class="header__logo"><i class="fa-solid fa-user-graduate header__icon"></i>Dashboard</a>
            </div>
            <ul class="header__list">
                <li class="header__items"><a href="list">Student</a></li>
                <li class="header__items"><a href="../course/list">Course</a></li>
                <li class="header__items"><a href="../question/list">Question</a></li>
                <li class="header__items"><a href="../exam/list">Exam</a></li>
                <li class="header__items"><a href="../feedback/list">Feedback</a></li>
                <li class="header__items"><a href="../result/list">Result</a></li>
            </ul>
            <div class="header__account">
                <c:if test="${sessionScope.account eq null}">
                    <a href="../login"  class="header__user"><i
                            class="fa-solid fa-user header__account-icon"></i></a> 
                    </c:if>
                    <c:if test="${sessionScope.account ne null}">
                    <span class="header__name">${sessionScope.account.full_name}<i onclick="show_dropdown()" class="fa-solid fa-caret-down"></i></span>
                    </c:if>
                <ul class="header__dropdown">
                    <li class="header__dropdown-items"><a href="infomation"><i class="fa-solid fa-user-check"></i>infomation</a></li>
                    <li class="header__dropdown-items"><a href="changepassword"><i class="fa-solid fa-lock"></i>change password</a></li>
                    <li class="header__dropdown-items"><a href="../logout"><i class="fa-solid fa-right-from-bracket"></i>Logout</a>
                    </li>
                </ul>
            </div>
        </header>
        <div class="container">
            <div class="container__subject">
                <h2 class="container__heading">Our Popular Subject</h2>
                <div class="subject-list">
                    <div class="subject__card">
                        <img src="http://127.0.0.1:5500/home/images/subject-icon-1.png" alt="">
                        <p class="subject__name">Graphic Design</p>
                        <p class="subject__quantity">12 module</p>
                    </div>
                    <div class="subject__card">
                        <img src="http://127.0.0.1:5500/home/images/subject-icon-2.png" alt="">
                        <p class="subject__name">Mathematics</p>
                        <p class="subject__quantity">12 module</p>
                    </div>
                    <div class="subject__card">
                        <img src="http://127.0.0.1:5500/home/images/subject-icon-3.png" alt="">
                        <p class="subject__name">Teaching</p>
                        <p class="subject__quantity">12 module</p>
                    </div>
                    <div class="subject__card">
                        <img src="http://127.0.0.1:5500/home/images/subject-icon-4.png" alt="">
                        <p class="subject__name">Developer</p>
                        <p class="subject__quantity">12 module</p>
                    </div>
                    <div class="subject__card">
                        <img src="http://127.0.0.1:5500/home/images/subject-icon-5.png" alt="">
                        <p class="subject__name">Science</p>
                        <p class="subject__quantity">12 module</p>
                    </div>
                    <div class="subject__card">
                        <img src="http://127.0.0.1:5500/home/images/subject-icon-6.png" alt="">
                        <p class="subject__name">Engineering</p>
                        <p class="subject__quantity">12 module</p>
                    </div>
                </div>
            </div>
            <div class="container__course">
                <h2 class="container__heading">Our Popular Course</h2>
                <div class="course-list">
                    <div class="course__items">
                        <img src="http://127.0.0.1:5500/home/images/course-1-1.png" alt="">
                    </div>
                    <div class="course__items">
                        <img src="http://127.0.0.1:5500/home/images/course-1-2.png" alt="">
                    </div>
                    <div class="course__items">
                        <img src="http://127.0.0.1:5500/home/images/course-1-3.png" alt="">
                    </div>
                </div>
            </div>
        </div>

        <div class="footer">
            <div class="footer__list">
                <div class="footer__items"><i class="fa-brands fa-facebook"></i></div>
                <div class="footer__items"><i class="fa-brands fa-github"></i></div>
                <div class="footer__items"><i class="fa-brands fa-twitter"></i></div>
                <div class="footer__items"><i class="fa-brands fa-youtube"></i></div>
            </div>
            <div class="footer__credit">Created By <span>Hieuddhe151352@fpt.edu.vn</span>| All Rights Reserved!</div>
        </div>
        <script>
            function show_dropdown() {
                document.querySelector('.header__dropdown').classList.toggle('droppdown-ishow');
            }
        </script>
    </body>
</html>
