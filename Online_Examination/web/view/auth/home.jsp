<%-- 
    Document   : home
    Created on : Mar 4, 2022, 10:40:32 AM
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

            a {
                color: #555;
            }

            .header {
                color: #555;
                display: flex;
                align-items: center;
                justify-content: space-between;
                padding: 25px;
                font-size: 1.6rem;
                font-weight: bold;
                box-shadow: 0 0 3px 4px #eee;
            }
            .header__logo {
                font-size: 2.2rem;
            }
            .header__bar {
                margin-right: 50px;
                font-size: 2rem;
                background-color: #ccc;
                border-radius: 50%;
                padding: 10px 11px;
                cursor: pointer;
                transition: 0.25s linear;
            }
            .header__bar:hover {
                transform: rotate(180deg);
            }
            .header__list {
                display: flex;
            }
            .header__items {
                margin: 0 15px;
                transition: 0.25s linear;
            }
            .header__items:hover {
                font-size: 1.5rem;
            }
            .header__items a:hover {
                color: #0eb582;
            }
            .header__account {
                position: relative;
                padding-right: 100px;
            }
            .header__account i {
                cursor: pointer;
            }
            .header__dropdown {
                position: absolute;
                width: 250px;
                left: -20px;
                top: 40px;
                border-radius: 1rem;
                padding: 10px;
                background-color: rgba(14, 181, 130, 0.5);
                opacity: 0;
                visibility: hidden;
                transition: 0.25s linear;
            }
            .header__dropdown-items {
                padding: 8px;
                margin-bottom: 8px;
                transition: 0.25s linear;
                font-size: 1.3rem;
            }
            .header__dropdown-items:hover {
                background-color: rgba(14, 181, 130, 0.9);
            }
            .header__dropdown-items i {
                margin-right: 8px;
            }

            .is-show {
                opacity: 1;
                visibility: visible;
            }

            /*# sourceMappingURL=home.css.map */

        </style>
    </head>
    <body>
        <header class="header">
            <div class="header__home">
                <i class="fa-solid fa-bars header__bar"></i>
                <a href="home" class="header__logo"><i class="fa-solid fa-user-graduate header__icon"></i>Exam.</a>
            </div>
            <ul class="header__list">
                <li class="header__items"><a href="home">Home</a></li>
                <li class="header__items"><a href="about">About</a></li>
                <li class="header__items"><a href="../exam/schedules">Exam Schedules</a></li>
                <li class="header__items"><a href="../feedback/insert">Feedback</a></li>
            </ul>
            <div class="header__account">
                <c:if test="${sessionScope.account eq null}"> 
                    <a href="../login" class="header__user"><i
                            class="fa-solid fa-user header__account-icon"></i></a> 
                    </c:if>
                    <c:if test="${sessionScope.account ne null}">
                    <span class="header__name">${sessionScope.account.full_name} <i onclick="show_dropdown()"
                                                                                    class="fa-solid fa-caret-down"></i></span>
                    </c:if>
                <ul class="header__dropdown">
                    <li class="header__dropdown-items"><a href="infomation"><i class="fa-solid fa-user-check"></i>infomation</a></li>
                    <li class="header__dropdown-items"><a href="changepassword"><i class="fa-solid fa-lock"></i>change password</a></li>
                    <li class="header__dropdown-items"><a href="../logout"><i class="fa-solid fa-right-from-bracket"></i>Logout</a></li>
                </ul>
            </div>
        </header>   

        <script>
            function show_dropdown() {
                document.querySelector('.header__dropdown').classList.toggle('is-show');
            }
        </script>
    </body>
</html>
