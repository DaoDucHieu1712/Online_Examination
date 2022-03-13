<%-- 
    Document   : feedback
    Created on : Mar 5, 2022, 8:41:20 AM
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

            *{
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

            .sidebar {
                position: fixed;
                top: 85px;
                left: 0;
                background-color: white;
                height: 100vh;
                width: 250px;
                overflow-y: scroll;
                z-index: 1;
            }
            .sidebar::-webkit-scrollbar {
                width: 10px;
            }
            .sidebar::-webkit-scrollbar-thumb {
                background-color: #0eb582;
            }
            .sidebar::-webkit-scrollbar-track {
                background-color: #eee;
            }
            .sidebar__heading {
                color: #0eb582;
                font-size: 2.1rem;
                font-weight: bold;
                text-transform: uppercase;
                margin: 50px 0px 50px 10px;
                position: relative;
            }
            .sidebar__heading::before {
                content: "";
                position: absolute;
                width: 50px;
                height: 5px;
                background-color: #0eb582;
                bottom: 0;
                border-radius: 3px;
            }
            .sidebar__items {
                font-weight: bold;
                font-size: 1.6rem;
                margin-bottom: 25px;
                text-align: center;
                transition: 0.25s linear;
            }
            .sidebar__items:hover {
                margin-left: 25px;
            }
            .sidebar__items a {
                color: #555;
            }
            .sidebar__items i {
                margin-left: 7px;
                color: #0eb582;
            }

            /*# sourceMappingURL=dashboard.css.map */
            button,
            select,
            input,
            textarea {
                font-family: "Poppins", sans-serif;
                resize: none;
            }

            .section {
                margin: 150px auto;
                display: flex;
                align-items: center;
                justify-content: space-between;
                width: 1200px;
                padding: 30px;
            }
            .section__img {
                width: 50%;
            }
            .section__detail {
                padding: 15px;
                border: 2px solid #0eb582;
                width: 50%;
                height: 100%;
            }
            .section__heading {
                font-size: 2rem;
                color: #0eb582;
                font-weight: bold;
                padding-bottom: 3px;
                text-transform: uppercase;
                margin-bottom: 35px;
                position: relative;
            }
            .section__heading::before {
                content: "";
                position: absolute;
                background-color: #0eb582;
                width: 40px;
                height: 5px;
                bottom: 0;
                border-radius: 1rem;
            }
            .section-form {
                margin: 20px 0;
            }
            .section_lable {
                display: block;
                margin-bottom: 6px;
                font-size: 1.4rem;
                color: #555;
            }
            .section__input,
            .section .section__textarea {
                border: none;
                outline: none;
                border: 1px solid #0eb582;
                padding: 8px;
                width: 100%;
                transition: 0.25s linear;
            }
            .section__input:focus,
            .section .section__textarea:focus {
                background-color: #0eb582;
                color: white;
            }
            .section__input:focus::-webkit-input-placeholder,
            .section .section__textarea:focus::-webkit-input-placeholder {
                color: white;
            }
            .section__submit {
                cursor: pointer;
                border: none;
                outline: none;
                padding: 10px 15px;
                border: 1px solid #0eb582;
                transition: 0.25s linear;
            }
            .section__submit:hover {
                background-color: #0eb582;
                color: white;
            }

            /*# sourceMappingURL=feedback.css.map */

        </style>
    </head>
    <body>
        <header class="header">
            <div class="header__dashboard">
                <i class="fa-solid fa-bars header__bar"></i>
                <a href="../auth/dashboard" class="header__logo"><i class="fa-solid fa-graduation-cap"></i></i>ExamOnline</a>
            </div>
            <ul class="header__list">
                <li class="header__items"><a href="../auth/home">Home</a></li>
                <li class="header__items"><a href="../auth/homr">About</a></li>
                <li class="header__items"><a href="../exam/schedules">Exam Schedules</a></li>
                <li class="header__items"><a href="feedback">Feedback</a></li>
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
                        <li class="header__dropdown-items"><a href="../auth/infomation"><i class="fa-solid fa-user-check"></i>infomation</a></li>
                        <li class="header__dropdown-items"><a href="../auth/changepassword"><i class="fa-solid fa-lock"></i>change password</a></li>
                        <li class="header__dropdown-items"><a href="../logout"><i class="fa-solid fa-right-from-bracket"></i>Logout</a>
                        </li>
                    </ul>
            </div>
        </header>
        <div class="section">
            <div class="section__img">
                <img src="http://127.0.0.1:5500/image/image/contact-img.png" alt="">
            </div>
            <div class="section__detail">
                <h2 class="section__heading">Feedback</h2>
                <form action="insert" method="POST">
                    <div class="section-form">
                        <label class="section_lable">Title</label>
                        <input type="text" class="section__input" name="title" placeholder="title ....">
                    </div>
                    <div class="section-form">
                        <label class="section_lable">Massage</label>
                        <textarea class="section__textarea" cols="50" name="massage" rows="7" placeholder="massage ...."></textarea>
                    </div>
                    <button type="submit" class="section__submit">Send Massage</button>
                </form>
            </div>
        </div>

        <script>
            function show_dropdown() {
                document.querySelector('.header__dropdown').classList.toggle('droppdown-ishow');
            }
        </script>
    </body>
</html>
