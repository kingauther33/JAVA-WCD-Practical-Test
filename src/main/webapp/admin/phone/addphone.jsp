<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: kinga
  Date: 12/24/2021
  Time: 8:14 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.example.javawcdpracticaltest.entity.Phone" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("utf-8");
    Phone product = (Phone) request.getAttribute("phone");
    HashMap<String, String> errors = (HashMap<String, String>) request.getAttribute("errors");
    if (product == null) {
        product = new Phone();
    }
    if (errors == null) {
        errors = new HashMap<>();
    }
%>
<!doctype html>
<html lang="en">
<head>
    <jsp:include page="/admin/include/header.jsp">
        <jsp:param name="title" value="Food form"/>
        <jsp:param name="description" value="Admin area"/>
        <jsp:param name="keywords" value="admin, page...."/>
    </jsp:include>
</head>
<body>

<div class="wrapper d-flex align-items-stretch">
    <jsp:include page="/admin/include/left-menu.jsp"/>

    <!-- Page Content  -->
    <div id="content" class="p-4 p-md-5">

        <jsp:include page="/admin/include/navbar.jsp"/>
        <%
            if (errors.size() > 0) {

        %>
        <div class="w3-panel w3-pale-red w3-border">
            <h5>Vui lòng sửa các lỗi bên dưới và thử lại!</h5>
            <ul>
                <%
                    for (Map.Entry<String, String> entry : errors.entrySet()) {
                %>
                <li><%=entry.getValue()%>
                </li>
                <%
                    }
                %>
            </ul>
        </div>
        <%
            }
        %>

        <form class="form-horizontal" action="/admin/phone/create" method="post">
            <div class="form-group">
                <label class="control-label col-sm-2" for="name">Name:</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="name" placeholder="Enter name" name="name" required>
                    <%
                        if (errors.containsKey("name")) {

                    %>
                    <div class="w3-text-red w3-margin-top w3-margin-bottom">*<%=errors.get("name")%>
                    </div>
                    <%
                        }
                    %>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-2">Brand:</label>
                <div class="col-sm-4">
                    <select class="form-select" id="brand" aria-label="Default select example" name="brand">
                        <option selected value="0">Please select one of the follow brand</option>
                        <option value="1">Apple</option>
                        <option value="2">Samsung</option>
                        <option value="3">Nokia</option>
                        <option value="4">Others</option>
                    </select>
                    <%
                        if (errors.containsKey("brand")) {

                    %>
                    <div class="w3-text-red w3-margin-top w3-margin-bottom">*<%=errors.get("brand")%>
                    </div>
                    <%
                        }
                    %>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-2" for="price">Price:</label>
                <div class="col-sm-4">
                    <input type="number" class="form-control" id="price" placeholder="Enter Price"
                           name="price" required>
                    <%
                        if (errors.containsKey("price")) {

                    %>
                    <div class="w3-text-red w3-margin-top w3-margin-bottom">*<%=errors.get("price")%>
                    </div>
                    <%
                        }
                    %>
                </div>
            </div>

            <div class="form-group">
                <label class="control-label col-sm-2" for="description">Description:</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="description" placeholder="Enter Description"
                           name="description">
                    <%
                        if (errors.containsKey("description")) {

                    %>
                    <div class="w3-text-red w3-margin-top w3-margin-bottom">*<%=errors.get("description")%>
                    </div>
                    <%
                        }
                    %>
                </div>
            </div>

            <div class="row">
                <div class="ms-3 col-sm-offset-2 col-sm-1">
                    <button type="submit" class="btn btn-primary">Submit</button>
                </div>
                <div class="col-sm-1">
                    <button type="button" id="resetButton" class="btn btn-secondary">Reset</button>
                </div>
            </div>
        </form>
    </div>
</div>

<jsp:include page="/admin/include/scripts.jsp"/>

</body>
</html>
