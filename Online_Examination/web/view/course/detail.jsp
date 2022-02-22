<%-- 
    Document   : detail
    Created on : Feb 22, 2022, 10:44:11 PM
    Author     : ADMIN
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;700&display=swap" rel="stylesheet">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </head>
    <body>
        <jsp:include page="../../view/component/header.jsp"></jsp:include>
            <h3 class="m-5" style="text-align: center; color: greenyellow"> Detail Course</h3>
            <div class="container-fluid mt-4">
                <div class="row">
                    <div class="col-4"></div>
                    <div class="col-4" style="background-color: #0eb582; padding: 10px;border-radius: 5px;color: white">
                        <p class="textp"> ID : ${requestScope.course.id}</p><br>
                    <p class="textp">Name Subject : ${requestScope.course.name}</p> <br>
                    <p class="textp">Courses Detail : ${requestScope.course.display_name}</p> <br>
                    <p class="textp">Department : ${requestScope.course.department.name}</p> <br>
                    <div class="form-group text-center"><br>
                        <a class="btn btn-primary" href="list">Home</a>
                    </div>
                </div>
                <div class="col-4"></div>
            </div>
        </div>
        <jsp:include page="../../view/component/footer.jsp"></jsp:include>
    </body>
</html>
