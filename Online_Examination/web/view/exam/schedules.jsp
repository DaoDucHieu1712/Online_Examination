<%-- 
    Document   : schedules
    Created on : Mar 8, 2022, 10:32:18 AM
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
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                background-color: white;
                color: #555;
                display: flex;
                align-items: center;
                justify-content: space-between;
                padding: 25px;
                font-size: 1.6rem;
                font-weight: bold;
                box-shadow: 0 0 3px 4px #eee;
                z-index: 100000;
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

            .sidebar {
                position: fixed;
                top: 90px;
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

            /*# sourceMappingURL=home.css.map */
            button,
            input,
            textarea,
            select {
                font-family: "Poppins", sans-serif;
            }

            .section {
                margin: 150px auto;
                width: 1000px;
                height: 600px;
                background-color: white;
                box-shadow: 0 0 3px 6px rgba(0, 0, 0, 0.151);
                border-radius: 2rem;
                padding: 50px;
            }

            .section__icon {
                margin: 0 3px;
            }

            .section__insert {
                display: inline-block;
                margin-top: 35px;
                font-size: 1.3rem;
            }

            .section__insert a {
                font-size: 1.5rem;
                color: #0eb582;
                font-weight: bold;
                text-transform: uppercase;
            }

            .section__search {
                display: flex;
                justify-content: flex-end;
                margin-bottom: 40px;
            }

            .section__input {
                outline: none;
                border: none;
                background-color: rgba(153, 153, 153, 0.178);
                padding: 10px;
                margin-right: 5px;
                border-radius: 1rem;
                border: 2px solid #999;
            }

            .section__input:focus {
                border-color: #0eb582;
                box-shadow: 0 0 3px 3px rgba(14, 181, 130, 0.3);
            }

            .section__submit {
                font-weight: bold;
                color: white;
                border: none;
                outline: none;
                background-color: rgba(14, 181, 130, 0.9);
                padding: 10px;
                border-radius: 1rem;
                border: 2px solid #0eb582;
                box-shadow: 2px 2px 0 0 rgba(0, 0, 0, 0.767);
            }

            .section__submit:active {
                box-shadow: 1px 1px 0 0 rgba(0, 0, 0, 0.767);
                transform: translateY(3px);
            }

            .section__table table {
                margin-top: 35px 0 35px 0;
                width: 100%;
                border-collapse: collapse;
            }

            .section__table table thead {
                text-transform: uppercase;
                font-size: 1.4rem;
            }

            .section__table table thead tr {
                color: white;
                background-color: #0eb582;
                border-top-left-radius: 1rem;
                border-top-right-radius: 1rem;
            }

            .section__table table thead tr th {
                text-align: center;
                padding: 15px;
            }

            .section__table table thead tr th:first-child {
                border-top-left-radius: 1.5rem;
            }

            .section__table table thead tr th:last-child {
                border-top-right-radius: 1.5rem;
            }

            .section__table table tbody {
                font-size: 1.3rem;
            }

            .section__table table tbody tr:nth-child(even) {
                background-color: rgba(204, 204, 204, 0.295);
            }

            .section__table table tbody tr:last-child {
                border-bottom: 4px solid #0eb582;
            }

            .section__table table tbody td {
                text-align: center;
                padding: 15px;
                border-bottom: 1px solid #999;
            }

            .section__table table tbody td a {
                color: #555;
            }

            .section__link {
                padding: 5px 8px;
                color: #555;
                border-radius: 5px;
                border: 2px solid #0eb582;
                font-weight: bold;
                transition: 0.25s linear;
            }
            .section__link:hover {
                background-color: #0eb582;
                color: white;
            }

            .pagger {
                margin-top: 35px;
                font-size: 1.6rem;
                margin-left: 375px;
                margin-right: auto;
                padding-bottom: 25px;
            }

            .pagger a {
                margin-left: 5px;
                padding: 3px;
                border: 1px solid #ccc;
                border-radius: 2px;
                color: #555;
                transition: 0.25s linear;
            }

            .pagger a:hover {
                background-color: rgba(14, 181, 130, 0.66);
                color: white;
                font-weight: bold;
                border-color: #0eb582;
                box-shadow: 0 0 2px 0 #0eb582;
            }

            .pagger span {
                margin-left: 5px;
                width: 25px;
                height: 25px;
                padding: 3px;
                border: 1px solid #ccc;
                color: #555;
                background-color: rgba(14, 181, 130, 0.66);
                color: white;
                font-weight: bold;
                border-color: #0eb582;
                box-shadow: 0 0 2px 0 #0eb582;
            }

            /*# sourceMappingURL=list-course.css.map */

            /*# sourceMappingURL=schedules.css.map */

        </style>
    </head>
    <body>
        <header class="header">
            <div class="header__home">
                <i class="fa-solid fa-bars header__bar"></i>
                <a href="../auth/home" class="header__logo"><i class="fa-solid fa-user-graduate header__icon"></i>Exam.</a>
            </div>
            <ul class="header__list">
                <li class="header__items"><a href="../auth/home">Home</a></li>
                <li class="header__items"><a href="../auth/home">About</a></li>
                <li class="header__items"><a href="schedules">Exam Schedules</a></li>
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
                    <li class="header__dropdown-items"><a href="../auth/infomation"><i class="fa-solid fa-user-check"></i>infomation</a></li>
                    <li class="header__dropdown-items"><a href="../auth/changepassword"><i class="fa-solid fa-lock"></i>change password</a></li>
                    <li class="header__dropdown-items"><a href="../logout"><i class="fa-solid fa-right-from-bracket"></i>Logout</a>
                    </li>
                </ul>
            </div>
        </header>

<!--        <div class="sidebar sidebar-show">
            <h2 class="sidebar__heading">Course</h2>
            <ul class="sidebar__list">
                <c:forEach items="${list_course}" var="c">
                    <li class="sidebar__items"><a href="schedules?cid=${c.id}">${c.name}<i class="fa-solid fa-caret-right"></i></a></li>
                        </c:forEach>
            </ul>
        </div>-->

        <div class="section">
            <div class="section__search">
                <form action="schedules" method="GET">
                    <input type="text" name="name_search" value="${name_search}" class="section__input" placeholder="search ...">
                    <button type="submit" class="section__submit">Search</button>
                </form>
            </div>
            <div class="section__table">
                <table>
                    <thead>
                        <tr>
                            <!--<th>ID</th>-->
                            <th>Name Exam</th>
                            <th>Time</th>
                            <th>Quantity</th>
                            <th>Course Name</th>
                            <th>Start</th>
                            <th>Finish</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${list_exam}" var="e">
                                <tr>
                                    <!--<td>1</td>-->
                                    <td>${e.name_exam}</td>
                                    <td>${e.time}</td>
                                    <td>${e.quantity_quiz}</td>
                                    <td>${e.course.name}</td>
                                    <td>${e.date_start}</td>
                                    <td>${e.date_end}</td>
                                    <td>
                                        <a  class="section__link" href="startExam?exam=${e.id}&course=${e.course.id}&time=${e.time}&quantity=${e.quantity_quiz}">Do exam</a>
                                    </td>
                                </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
        <script>
            function show_dropdown() {
                document.querySelector('.header__dropdown').classList.toggle('is-show');
            }
        </script>
    </body>
</html>
