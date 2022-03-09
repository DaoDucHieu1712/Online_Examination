<%-- 
    Document   : changePassword
    Created on : Mar 1, 2022, 8:12:51 PM
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
            .header__dropdown-items {
                padding: 10px;
                font-size: 1.4rem;
                transition: 0.25s linear;
            }
            .header__dropdown-items:hover {
                background-color: rgba(14, 181, 130, 0.9);
            }

            /*# sourceMappingURL=dashboard.css.map */


            button,
            select,
            input,
            textarea {
                font-family: "Poppins", sans-serif;
                resize: none;
            }

            .sidebar {
                position: fixed;
                top: 82px;
                left: 0;
                padding: 30px 0 100px 0;
                width: 300px;
                height: 100vh;
                background-color: rgba(14, 181, 130, 0.1);
            }
            .sidebar img {
                width: 70%;
                display: block;
                margin: 0 auto;
                padding: 15px;
                border: 2px solid #0eb582;
                border-radius: 1rem;
            }
            .sidebar span {
                display: block;
                text-align: center;
                font-size: 2.5rem;
                font-weight: bold;
                margin-top: 35px;
                color: #0eb582;
            }
            .sidebar a {
                font-size: 1.6rem;
                display: block;
                text-align: center;
                margin-top: 35px;
                padding: 10px;
                color: #0eb582;
            }
            .sidebar a i {
                margin-right: 10px;
                color: #0eb582;
            }

            .section {
                width: 1000px;
                min-height: 600px;
                margin: 130px auto 130px auto;
                transform: translateX(100px);
                background-color: rgba(14, 181, 130, 0.1);
                border-radius: 1rem;
                display: flex;
                justify-content: space-between;
                padding: 30px;
            }
            .section__heading {
                color: #0eb582;
                font-size: 2rem;
                font-weight: bold;
                text-transform: uppercase;
                position: relative;
                padding-bottom: 3px;
                margin-bottom: 45px;
            }
            .section__heading::before {
                content: "";
                position: absolute;
                bottom: 0;
                width: 30px;
                height: 5px;
                background-color: #0eb582;
            }
            .section__info {
                width: 50%;
            }
            .section__img {
                width: 50%;
            }
            .section__img img {
                width: 100%;
                height: 100%;
                object-fit: cover;
            }
            .section__form {
                margin: 15px 0 15px 0;
            }
            .section__lable {
                display: block;
                margin-bottom: 10px;
            }
            .section__input {
                width: 300px;
                outline: none;
                border: none;
                padding: 10px;
                background-color: rgba(153, 153, 153, 0.153);
                border-radius: 1rem;
                border: 2px solid rgba(153, 153, 153, 0.153);
                transition: 0.25s linear;
            }
            .section__input:focus {
                border: 2px solid #0eb582;
                box-shadow: 0 0 3px 3px rgba(14, 181, 130, 0.3);
            }
            .section__submit {
                cursor: pointer;
                margin-top: 10px;
                border: none;
                outline: none;
                padding: 10px 15px;
                background-color: #0eb582;
                border-radius: 1rem;
                box-shadow: 2px 2px 0 0 rgba(0, 0, 0, 0.856);
            }
            .section__submit:active {
                transform: translateY(3px);
                box-shadow: 1px 1px 0 0 rgba(0, 0, 0, 0.856);
            }

            /*# sourceMappingURL=changePw.css.map */

        </style>
    </head>
    <body>
        <header class="header">
            <div class="header__dashboard">
                <i class="fa-solid fa-bars header__bar"></i>
                <a href="../dashboard" class="header__logo"><i class="fa-solid fa-user-graduate header__icon"></i>Dashboard</a>
            </div>
            <ul class="header__list">
                <li class="header__items"><a href="list">Student</a></li>
                <li class="header__items"><a href="../course/list">Course</a></li>
                <li class="header__items"><a href="../question/list">Question</a></li>
                <li class="header__items"><a href="../exam/list">Exam</a></li>
                <li class="header__items"><a href="../feedback/list">Feedback</a></li>
            </ul>
            <div class="header__account">
                <c:if test="${sessionScope.account eq null}">
                    <a href="#account"  class="header__user"><i
                            class="fa-solid fa-user header__account-icon"></i></a> 
                    </c:if>
                    <c:if test="${sessionScope.account ne null}">
                    <span class="header__name">${sessionScope.account.full_name}<i onclick="show_dropdown()"
                                                                                   class="fa-solid fa-caret-down"></i></span>
                    </c:if>
                <ul class="header__dropdown">
                    <li class="header__dropdown-items"><a href="infomation"><i class="fa-solid fa-user-check"></i>infomation</a></li>
                    <li class="header__dropdown-items"><a href="changepassword"><i class="fa-solid fa-lock"></i>change password</a></li>
                    <li class="header__dropdown-items"><a href="../logout"><i class="fa-solid fa-right-from-bracket"></i>Logout</a>
                    </li>
                </ul>
            </div>
        </header>
        <div class="sidebar">
            <img src="http://127.0.0.1:5500/image/image/teacher-5.png" alt="">
            <span>${sessionScope.account.full_name}</span>
            <a href="#"><i class="fa-solid fa-square-poll-vertical"></i>Result</a>
        </div>
        <div class="section">
            <div class="section_info">
                <h2 style="color: tomato">${requestScope.notify}</h2>
                <h2 class="section__heading">Change Password</h2>
                <form action="changepassword" method="POST">
                    <div class="section__form">
                        <label for="section__input" class="section__lable">Email</label>
                        <input type="text" id="section__input" name="email" class="section__input" placeholder="Enter email ...">
                    </div>
                    <div class="section__form">
                        <label for="section__input" class="section__lable">Old Password</label>
                        <input type="password" id="section__input" name="old_pw" class="section__input" placeholder="Enter old password ...">
                    </div>
                    <div class="section__form">
                        <label for="section__input" class="section__lable">New Password</label>
                        <input type="password" id="section__input" name="new_pw" class="section__input" placeholder="Enter new password ...">
                    </div>
                    <div class="section__form">
                        <label for="section__input" class="section__lable">Comfirm Password</label>
                        <input type="password" id="section__input"  name="cf_pw" class="section__input" placeholder="Enter confirm password ...">
                    </div>
                    <button type="submit" class="section__submit">Change</button>
                </form>
            </div>
            <div class="section_image">
                <img src="http://127.0.0.1:5500/image/image/course-1-4.png" alt="">
            </div>
        </div>
        <script>
            function show_dropdown() {
                document.querySelector('.header__dropdown').classList.toggle('droppdown-ishow');
            }
        </script>
    </body>
</html>
