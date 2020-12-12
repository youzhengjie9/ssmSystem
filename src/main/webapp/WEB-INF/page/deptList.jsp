<%--
  Created by IntelliJ IDEA.
  User: youzhengjie666
  Date: 2020/12/11
  Time: 22:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>DeptList</title>
</head>
<body>
<h3>部门信息&nbsp;&nbsp;&nbsp;<a href="${pageContext.request.contextPath}/toList">返回主界面</a></h3>
<br/>
<table border="1">
    <tr>
        <td>部门id</td>
        <td>部门名称</td>
    </tr>
    <c:forEach items="${depts}" var="dept">
        <tr>
            <td>${dept.deptid}</td>
            <td>${dept.deptName}</td>
        </tr>
    </c:forEach>
</table>




</body>
</html>
