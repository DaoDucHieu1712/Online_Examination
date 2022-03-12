<%-- 
    Document   : detail
    Created on : Mar 1, 2022, 10:34:45 PM
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
            .section {
                width: 1100px;
                min-height: 600px;
                padding: 30px;
                box-shadow: 0 0 5px 2px rgba(0, 0, 0, 0.349);
                background-color: white;
                margin: 150px auto;
                border-radius: 1rem;
                transform: translateX(100px);
            }
            .section__heading {
                font-size: 2rem;
                color: #0eb582;
                font-weight: bold;
                padding-bottom: 3px;
                position: relative;
            }
            .section__heading::before {
                content: "";
                position: absolute;
                width: 35px;
                height: 5px;
                border-radius: 2px;
                background-color: #0eb582;
                bottom: 0;
            }
            .section__id {
                color: #0eb582;
                font-size: 1.6rem;
                padding-left: 50px;
                margin-top: 35px;
                position: relative;
            }
            .section__id::before {
                content: "";
                position: absolute;
                width: 40px;
                height: 2px;
                top: 50%;
                left: 0;
                transform: translateY(-50%);
                background-color: #0eb582;
            }
            .section__quiz {
                margin-top: 30px;
                margin-left: 20px;
                font-size: 1.5rem;
                line-height: 20px;
            }
            .section__form {
                margin-top: 30px;
                font-size: 1.4rem;
                margin-left: 50px;
                padding-bottom: 10px;
                border-bottom: 2px solid #999;
            }
            .section__lable {
                margin: 10px 20px 10px 20px;
                display: block;
                padding-left: 50px;
                margin-bottom: 20px;
                font-weight: bold;
                position: relative;
            }
            .section__lable::before {
                content: "";
                position: absolute;
                top: 50%;
                left: 0;
                transform: translateY(-50%);
                width: 15px;
                height: 15px;
                background-color: #0eb582;
                border-radius: 50%;
                box-shadow: 0 0 0px 5px rgba(14, 181, 130, 0.5);
            }
            .section__solution {
                margin-top: 10px;
                margin-left: 50px;
                font-size: 1.5rem;
                font-weight: bold;
            }
            .section__solution span {
                font-size: 1.8rem;
                color: #0eb582;
                margin-left: 20px;
            }
            .section__course {
                margin-top: 15px;
                margin-left: 50px;
                font-size: 1.5rem;
                font-weight: bold;
            }
            .section__course span {
                font-size: 1.8rem;
                color: #0eb582;
                margin-left: 20px;
            }

            /*# sourceMappingURL=question.css.map */

        </style>
    </head>
    <body>
        <header class="header">
            <div class="header__dashboard">
                <i class="fa-solid fa-bars header__bar"></i>
                <a href="../auth/dashboard" class="header__logo"><i class="fa-solid fa-user-graduate header__icon"></i>Dashboard</a>
            </div>
            <ul class="header__list">
                <li class="header__items"><a href="../auth/list">Student</a></li>
                <li class="header__items"><a href="../course/list">Course</a></li>
                <li class="header__items"><a href="list">Question</a></li>
                <li class="header__items"><a href="../exam/list">Exam</a></li>
                <li class="header__items"><a href="../result/list">Result</a></li>
            </ul>
            <div class="header__account">
                <c:if test="${sessionScope.account eq null}">
                    <a href="../login"  class="header__user"><i
                            class="fa-solid fa-user header__account-icon"></i></a>
                    </c:if>
                    <c:if test="${sessionScope.account ne null}">
                    <span class="header__name">${sessionScope.account.full_name} <i onclick="show_dropdown()" class="fa-solid fa-caret-down"></i></span>
                    </c:if>
                <ul class="header__dropdown">
                    <li class="header__dropdown-items"><a href="../auth/infomation"><i class="fa-solid fa-user-check"></i>infomation</a></li>
                    <li class="header__dropdown-items"><a href="../auth/changepassword"><i class="fa-solid fa-lock"></i>change password</a></li>
                    <li class="header__dropdown-items"><a href="../logout"><i class="fa-solid fa-right-from-bracket"></i>Logout</>
                    </li>
                </ul>
            </div>
        </header>
        <div class="sidebar sidebar-show">
            <h2 class="sidebar__heading">Question</h2>
            <ul class="sidebar__list">
                <c:forEach items="${requestScope.list_course}" var="c">
                    <li class="sidebar__items"><a href="course?cid=${c.id}">${c.name}<i class="fa-solid fa-caret-right"></i></a></li>
                        </c:forEach>
            </ul>
        </div>

        <div class="section">
            <h1 class="section__heading">Question Detail</h1>
            <h2 class="section__id">ID : ${question.id}</h2>
            <div class="section__quiz">
                <p class="section_desc">${question.quiz}</p>
            </div>
            <div class="section__form">
                <div class="section__option">
                    <p class="section__lable">${question.op1}</p>
                </div>
                <div class="section__option">
                    <p class="section__lable">${question.op2}</p>
                </div>
                <div class="section__option">
                    <p class="section__lable">${question.op3}</p>
                </div>
                <div class="section__option">
                    <p class="section__lable">${question.op4}</p>
                </div>
            </div>
            <div class="section__solution">
                <p>Solution: <span>${question.solutionStr}</span></p>
            </div>
            <div class="section__course">
                <p>Course Name: <span>${question.course.name}</span></p>
            </div>
        </div>

        <script>
            function show_dropdown() {
                document.querySelector('.header__dropdown').classList.toggle('droppdown-ishow');
            }
        </script>
    </body>
</html>
