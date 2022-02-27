<%-- 
    Document   : list
    Created on : Feb 22, 2022, 10:20:36 PM
    Author     : ADMIN
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>JSP Page</title>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
        <link rel="stylesheet" type="text/css" href="././css/dashboard.css">
        <link rel="stylesheet" type="text/css" href="././css/course-list.css">
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
            <h2 class="sidebar__heading">Department</h2>
            <ul class="sidebar__list">
                <c:forEach items="${list_department}" var="d">
                    <li class="sidebar__items"><a href="#">${d.name}<i class="fa-solid fa-caret-right"></i></a></li>
                        </c:forEach>
            </ul>
        </div>

        <div class="section">
            <div class="section__search">
                <form action="#">
                    <input type="text" name="" class="section__input" placeholder="search ...">
                    <button type="submit" class="section__submit">Search</button>
                </form>
            </div>
            <div class="section__table">
                <table>
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Course Name</th>
                            <th>Department</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${list_course}" var="c">
                            <tr>
                                <td>${c.id}</td>
                                <td>${c.name}</td>
                                <td>${c.display_name}</td>
                                <td>${c.department.name}</td>
                                <td>
                                    <a href="detail?id=${c.id}"><i class="fa fa-file section__icon"></i></a>
                                    <a href="update?id=${c.id}"><i class="fa fa-edit section__icon"></i></a>
                                    <a href="delete?id=${c.id}"><i class="fa fa-trash section__icon"></i></a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <span class="section__insert">Click here is <a href="insert">Insert</a></span>
                <!--<div id="pagination" class="pagger"></div>-->
            </div>

        </div>
        <script src="././js/dashboard.js" type="text/javascript"></script> 
    </body>
</html>
