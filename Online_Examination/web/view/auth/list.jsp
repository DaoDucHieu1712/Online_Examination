<%-- 
    Document   : list
    Created on : Mar 5, 2022, 10:15:48 AM
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
                margin-right: 150px;
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
            .header__dropdown-items{
                padding: 10px;
                font-size: 1.4rem;
                transition: 0.25s linear;
            }
            .header__dropdown-items:hover {
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
            input,
            textarea,
            select {
                font-family: "Poppins", sans-serif;
            }

            .section {
                margin: 150px auto;
                width: 1000px;
                min-height: 600px;
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
                font-size: 1rem;
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

            /*# sourceMappingURL=list-course.css.map */

            /*# sourceMappingURL=account-list.css.map */

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
                    <li class="header__dropdown-items"><a href="../logout"><i class="fa-solid fa-right-from-bracket"></i>Logout</a>
                    </li>
                </ul>
            </div>
        </header>
        <div class="section">
            <div class="section__search">
                <form action="list" method="GET">
                    <input type="text" name="name_search" value="${requestScope.name_search}" class="section__input" placeholder="search ...">
                    <button type="submit" class="section__submit">Search</button>
                </form>
            </div>
            <div class="section__table">
                <table>
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Full Name</th>
                            <th>Gender</th>
                            <th>Day of birth</th>
                            <th>Address</th>
                            <th>Phone</th>
                            <th>Email</th>
                            <th>Detail</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${list_student}" var="t">
                            <tr>
                                <td>${t.id}</td>
                                <td>${t.full_name}</td>
                                <td>${t.gender ? "Male":"Female"}</td>
                                <td>${t.dob}</td>
                                <td>${t.address}</td>
                                <td>${t.phone}</td>
                                <td>${t.email}</td>
                                <td>
                                    <a href="detail?id=${t.id}"><i class="fa fa-file section__icon"></i></a>
                                    <!--<a onclick="do_delete(${t.id})"><i class="fa fa-trash section__icon"></i></a>-->
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <c:if test="${maxPage > 1}">

                    <div id="pagination" class="pagger"></div>
                </c:if>
            </div>
        </div>
        <script>

            function show_dropdown() {
                document.querySelector('.header__dropdown').classList.toggle('droppdown-ishow');
            }

            function generate(div, pageIndex, maxPage, gap) {
                var container = document.getElementById(div);
//                    if (pageIndex - gap > 1)
                container.innerHTML += '<a href="list?pageIndex=1">First</a>';
                for (var i = pageIndex - gap; i < pageIndex; i++) {
                    if (i > 0)
                        container.innerHTML += '<a href="list?pageIndex=' + i + '">' + i + '</a>';
                }
                container.innerHTML += '<span>' + pageIndex + '</span>';
                for (var i = pageIndex + 1; i <= pageIndex + gap; i++) {
                    if (i <= maxPage)
                        container.innerHTML += '<a href="list?pageIndex=' + i + '">' + i + '</a>';
                }
//                    if (maxPage + gap < maxPage)
                container.innerHTML += '<a href="list?pageIndex=' + maxPage + '">Last</a>';
            }

            function generateBySearchName(div, pageIndex, maxPage, gap, name_search) {
                var container = document.getElementById(div);
//                    if (pageIndex - gap > 1)
                container.innerHTML += '<a href="list?name_search=' + name_search + '&pageIndex=1">First</a>';
                for (var i = pageIndex - gap; i < pageIndex; i++) {
                    if (i > 0)
                        container.innerHTML += '<a href="list?name_search=' + name_search + '&pageIndex=' + i + '">' + i + '</a>';
                }
                container.innerHTML += '<span>' + pageIndex + '</span>';
                for (var i = pageIndex + 1; i <= pageIndex + gap; i++) {
                    if (i <= maxPage)
                        container.innerHTML += '<a href="list?name_search=' + name_search + '&pageIndex=' + i + '">' + i + '</a>';
                }
//                    if (maxPage + gap < maxPage)
                container.innerHTML += '<a href="list?name_search=' + name_search + '&pageIndex=' + maxPage + '">Last</a>';
            }

            if (${name_search.length()} === 0) {
                generate('pagination', ${pageIndex}, ${maxPage}, 2);
            } else {
                generateBySearchName('pagination',${pageIndex},${maxPage}, 2, '${name_search}');
            }

        </script>
    </body>
</html>
