<%-- 
    Document   : update
    Created on : Feb 23, 2022, 7:43:00 AM
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
            <h3 class="m-5 text-center" style="color: aquamarine"> UPDATE COURSE </h3>
            <div class="container-fluid">
                <div class="row">
                    <div class="col-4"></div>
                    <div class="col-4 p-5" style="background: aquamarine;border-radius: 5px;">
                        <form action="update" method="POST">
                            <div class="mb-3"  style="width: 320px;margin: auto">
                                <label for="exampleFormControlInput1" class="form-label">ID</label><br>
                            ${course.id}
                            <input type="hidden" name="id" class="form-control" id="exampleFormControlInput1" value="${course.id}">
                        </div>
                        <div class="mb-3"  style="width: 320px;margin: auto">
                            <label for="exampleFormControlInput1" class="form-label">Subject Name</label>
                            <input type="text" name="name" class="form-control" id="exampleFormControlInput1" value="${course.name}">
                        </div>
                        <div class="mb-3"  style="width: 320px;margin: auto">
                            <label for="exampleFormControlInput1" class="form-label">Courses Detail</label>
                            <input type="text" name="display_name" class="form-control" id="exampleFormControlInput1" value="${course.display_name}">
                        </div>
                        <div class="form-group" style="width: 320px;margin: auto">
                            <label>Department</label>
                            <select class="form-control" name="did">
                                <c:forEach items="${requestScope.list_department}" var="department"> 
                                    <option 
                                        <c:if test="${department.id eq course.department.id}">
                                            selected="selected"
                                        </c:if>
                                        value="${department.id}">${department.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="form-group text-center mt-4">
                            <button class="btn btn-success" type="submit">Update</button>
                        </div>
                    </form>
                </div>
                <div class="col-4"></div>
            </div>
        </div>
        <jsp:include page="../../view/component/footer.jsp"></jsp:include>

    </body>
</html>
