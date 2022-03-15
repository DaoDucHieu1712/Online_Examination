<%-- 
    Document   : account
    Created on : Mar 13, 2022, 3:06:31 AM
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
                color: #0eb582;
                margin-right: 10px;
            }

            /*# sourceMappingURL=dashboard.css.map */
            button,
            input,
            select,
            textarea {
                font-family: "Poppins", sans-serif;
            }

            .section {
                width: 1000px;
                min-height: 600px;
                background-color: white;
                margin: 150px auto;
                box-shadow: 0 0 3px 4px rgba(0, 0, 0, 0.212);
                padding: 50px;
                transform: translateX(100px);
                border-radius: 2rem;
                padding: 50px;
            }
            .section__desc {
                max-width: 65px;
                white-space: nowrap;
                overflow: hidden;
                text-overflow: ellipsis;
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
                font-size: 1.2rem;
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
                font-size: 1.1rem;
                font-weight: bold;
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

            /*# sourceMappingURL=result-account.css.map */

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
                <li class="header__items"><a href="../exam/schedules">Exam Schedules</a></li>
                <li class="header__items"><a href="../feedback/insert">Feedback</a></li>
            </ul>
            <div class="header__account">
                <c:if test="${sessionScope.account eq null }">
                    <a href="../login" class="header__user"><i
                            class="fa-solid fa-user header__account-icon"></i></a> 
                    </c:if>
                    <c:if test="${sessionScope.account ne null}">
                    <span class="header__name" style="margin-right: 120px;">${sessionScope.account.full_name}<i onclick="show_dropdown()"
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

        <div class="sidebar">
            <img src="http://127.0.0.1:5500/image/image/teacher-5.png" alt="">
            <span>${sessionScope.account.full_name}</span>
            <a href="account?aid=${sessionScope.account.id}"><i class="fa-solid fa-square-poll-vertical"></i>Result</a>
        </div>

        <div class="section">
            <div class="section__search">
                <form action="account" method="GET">
                    <input type="text" name="name_search" value="${name_search}" class="section__input" placeholder="search ...">
                    <input type="text" name="aid" value="${aid}" hidden>
                    <button type="submit" class="section__submit">Search</button>
                </form>
            </div>
            <div class="section__table">
                <table>
                    <thead>
                        <tr>
                            <th>Student Name</th>
                            <th>Name Exam</th>
                            <th>Course Name</th>
                            <th>Score</th>
                            <th>Status</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${list_result}" var="r">
                            <tr>
                                <td>
                                    ${r.account.full_name}
                                </td>
                                <td>
                                    ${r.exam.name_exam}
                                </td>
                                <td>
                                    ${r.exam.course.name}
                                </td>
                                <td>
                                    ${r.score}
                                </td>
                                <td>
                                    ${r.status}
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <c:if test="${maxPage > 1}">
                    <div id="pagination" class="pagger"></div>
                </c:if>
            </div>
            <script>
                function show_dropdown() {
                    document.querySelector('.header__dropdown').classList.toggle('droppdown-ishow');
                }

                function generateByCourse(div, pageIndex, maxPage, gap, cid) {
                    var container = document.getElementById(div);
                    //                    if (pageIndex - gap > 1)
                    container.innerHTML += '<a href="account?aid=' + cid + '&pageIndex=1">First</a>';
                    for (var i = pageIndex - gap; i < pageIndex; i++) {
                        if (i > 0)
                            container.innerHTML += '<a href="account?aid=' + cid + '&pageIndex=' + i + '">' + i + '</a>';
                    }
                    container.innerHTML += '<span>' + pageIndex + '</span>';
                    for (var i = pageIndex + 1; i <= pageIndex + gap; i++) {
                        if (i <= maxPage)
                            container.innerHTML += '<a href="account?aid=' + cid + '&pageIndex=' + i + '">' + i + '</a>';
                    }
                    //                    if (maxPage + gap < maxPage)
                    container.innerHTML += '<a href="account?aid=' + cid + '&pageIndex=' + maxPage + '">Last</a>';
                }
                generate('pagination', ${pageIndex}, ${maxPage}, 2);
            </script>
    </body>
</html>
