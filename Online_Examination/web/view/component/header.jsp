<%-- 
    Document   : header
    Created on : Feb 15, 2022, 5:20:24 AM
    Author     : ADMIN
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </head>
    <body>
        <header>
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <a class="navbar-brand" href="#"><i class="fas fa-graduation-cap"></i>OnlineExam</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item active">
                            <a class="nav-link" href="#">Trang chủ <span class="sr-only">(current)</span></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Giới thiệu</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Course</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Lịch thi</a>
                        </li>
                    </ul>
                    <c:if test="${account == null}">
                        <a href="view/auth/login.jsp" class="btn btn-outline-success">Đăng nhập</a>
                    </c:if>
                    <c:if test="${account != null}">
                        <div class="btn-group">
                            <button type="button" class="btn btn-outline-danger">Welcome ${sessionScope.account.full_name}</button>
                        <button type="button" class="btn btn-danger dropdown-toggle dropdown-toggle-split" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <span class="sr-only">Toggle Dropdown</span>
                        </button>
                        <div class="dropdown-menu" style="background-color: darkslategray">
                            <a class="dropdown-item" style="color: whitesmoke" href="#info">Thông tin cá nhân</a>
                            <a class="dropdown-item" style="color: whitesmoke" href="#updateAuth">Đổi mật khẩu</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" style="color: whitesmoke" href="logout">Đăng xuất</a>
                        </div>
                    </div>
                </c:if>
            </div>
        </nav>
    </header>
</body>
</html>
