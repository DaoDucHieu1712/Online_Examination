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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;700&display=swap" rel="stylesheet">
        <link href="././css/course-list.css" rel="stylesheet" type="text/css"/>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script>
            function doUpdate(id) {
                window.location.href = "update?id=" + id
            }

            function doDelete(id) {
                var a = confirm('Do you wnat to delete ? ')
                if (a === true) {
                    window.location.href = "delete?id=" + id
                }
            }
            function detail(id) {
                window.location.href = "detail?id=" + id
            }
        </script>
    </head>
    <body>
        <jsp:include page="../../view/component/header.jsp"></jsp:include>
            <h3 class="m-5" style="text-align: center; color: greenyellow"> COURSE </h3>
            <!--Thanh search-->
            <div class="row">
                <div class="col-9"></div>
                <div class="col-2" style="margin-left: 60px">
                    <form action="listCourse">
                        <div class="mb-3"  style="width: 230px;margin: auto;display: flex;">
                            <input type="text" name="display_name" value="${param.display_name}" class="form-control" id="exampleFormControlInput1" placeholder="seach">
                        <button class="btn btn-success" style="margin-left: 3px" type="submit">Search</button>
                    </div>
                </form>
            </div>
        </div>
        <!--Table-->
        <div class="row m-3">
            <div class="col-3 sidebar">
                <a class="btn btn-info" href="insert">Insert Course</a>
            </div>
            <div class="col-9"> 
                <table class="table table-success table-striped">
                    <thead>
                        <tr>
                            <td>ID</td>
                            <td>Subject</td>
                            <td>Course Detail</td>
                            <td>Department</td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${requestScope.list_course}" var="c">
                            <tr>
                                <td>${c.id}</td>
                                <td>${c.name}</td>
                                <td>${c.display_name}</td>
                                <td>${c.department.name}</td>
                                <td><input type="button" class="btn btn-outline-primary" onclick="detail(${c.id})" value="Detail" /></td>
                                <td><input type="button" class="btn btn-outline-success" onclick="doUpdate(${c.id})" value="Update" /></td>
                                <td><input type="button" class="btn btn-outline-danger" onclick="doDelete(${c.id})" value="Delete" /></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
        <jsp:include page="../../view/component/footer.jsp"></jsp:include>
    </body>
</html>
