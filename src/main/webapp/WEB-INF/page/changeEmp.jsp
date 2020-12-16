<%--
  Created by IntelliJ IDEA.
  User: youzhengjie666
  Date: 2020/12/13
  Time: 19:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>changeEmp</title>
</head>
<body>
<h3>修改员工信息</h3><br/>
<form method="post" action="${pageContext.request.contextPath}/changeEmp">
    <input type="hidden" name="empid" value="${empid}"><br/>
    员工名字：<input type="text" name="empName" value="${empName}" required><br/>
    部门名称：&nbsp;<select name="dept.deptid">
            <c:forEach items="${depts}" var="dept">
                <option value="${dept.deptid}">${dept.deptName}</option>
            </c:forEach>

            </select>
    <input type="submit" value="修改">
</form>





</body>
</html>
