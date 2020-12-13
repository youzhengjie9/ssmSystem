<%--
  Created by IntelliJ IDEA.
  User: youzhengjie666
  Date: 2020/12/13
  Time: 16:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>addEmp</title>
</head>
<body>
<form method="post" action="${pageContext.request.contextPath}/AddEmp">
    员工编号：<input type="text" name="empid"><br/>
    员工名字: <input type="text" name="empName"><br/>
    所在部门：<select name="dept.deptid">
            <c:forEach items="${depts}" var="dept">
                <option value="${dept.deptid}">${dept.deptName}</option>
            </c:forEach>

            </select>
    <input type="submit" value="确认添加">
</form>




</body>
</html>
