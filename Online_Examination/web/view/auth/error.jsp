<%-- 
    Document   : error
    Created on : Mar 5, 2022, 11:29:06 AM
    Author     : ADMIN
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }

            html {
                font-family: 'Poppins', sans-serif;
            }

            .access_denied {
                width: 100%;
                margin: 0 auto;
                position: relative;
            }

            .access_denied img {
                display: block;
                height: 100vh;
                object-fit: cover;
                margin: 0 auto;
            }

            .link {
                position: absolute;
                bottom: 100px;
                left: 48%;
                text-decoration: none;
                font-size: 16px;
                color: #292929;
                text-transform: uppercase;
                padding: 10px 12px;
                border: 2px solid #0eb582;
                transition: .25s linear;
                font-weight: bold;
            }

            .link:hover {
                background-color: #0eb582;
                color: white;
            }
        </style>
    </head>
    <body>
        <div class="access_denied">
            <img src="https://ih1.redbubble.net/image.1046954134.7254/flat,750x,075,f-pad,750x1000,f8f8f8.jpg" alt="">
            <c:if test="${sessionScope.account.group.id == 2 || sessionScope.account eq null}">
                <a href="auth/home" class="link">Return Home</a>
            </c:if>
            <c:if test="${sessionScope.account.group.id == 1 || sessionScope.account eq null}">
                <a href="auth/dashboard" class="link">Return Dashboard</a>
            </c:if>
        </div>
    </body>
</html>
