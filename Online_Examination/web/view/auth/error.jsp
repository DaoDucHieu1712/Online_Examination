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
    </head>
    <body>
        <h1>Error 404</h1>
        <c:if test="${sessionScope.account.group.id == 2 || sessionScope.account eq null}">
            <a href="auth/home">Return home</a>
        </c:if>
        <c:if test="${sessionScope.account.group.id == 1}">
            <a href="auth/dashboard">Return home</a>
        </c:if>
    </body>
</html>
