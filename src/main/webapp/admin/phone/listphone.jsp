<%--
  Created by IntelliJ IDEA.
  User: kinga
  Date: 12/24/2021
  Time: 8:14 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.example.javawcdpracticaltest.entity.Phone" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    request.setCharacterEncoding("utf-8");
    ArrayList<Phone> list = (ArrayList<Phone>) request.getAttribute("list");
    if (list == null) {
        list = new ArrayList<Phone>();
    }
%>
<!doctype html>
<html lang="en">
<head>
    <jsp:include page="/admin/include/header.jsp">
        <jsp:param name="title" value="My admin page"/>
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
            if (list.size() > 0) {
        %>

        <table class="table">
            <thead>
            <tr>
                <th scope="col">#</th>
                <th scope="col">Name</th>
                <th scope="col">Brand</th>
                <th scope="col">Price</th>
                <th scope="col">Description</th>
            </tr>
            </thead>
            <tbody>
            <%
                for (int i = 0; i < list.size(); i++) {
            %>
            <tr>
                <th scope="row"><%=list.get(i).getId()%>
                </th>
                <td><%=list.get(i).getName()%>
                </td>
                <td><%=list.get(i).getBrand()%>
                </td>
                <td><%=list.get(i).getPrice()%>
                </td>
                <td><%=list.get(i).getDescription()%>
                </td>
            </tr>
            <%
                }
            %>
            </tbody>
        </table>

        <%
        } else {
        %>

        <p class="text-center font-weight-bold">No records found, go add new phone</p>

        <%
            }
        %>
    </div>
</div>

<jsp:include page="/admin/include/scripts.jsp"/>

</body>
</html>
