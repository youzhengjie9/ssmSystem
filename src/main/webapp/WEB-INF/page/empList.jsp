<%--
  Created by IntelliJ IDEA.
  User: youzhengjie666
  Date: 2020/12/13
  Time: 16:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<html>
<head>
    <title>empList</title>
</head>
<body>
<h3>员工信息&nbsp;&nbsp;&nbsp;<a href="${pageContext.request.contextPath}/toList">返回主界面</a></h3>
<br/>
<h4><a href="${pageContext.request.contextPath}/toAddEmp">新增员工</a> </h4>
<br/>
<table  class="table table-hover">
    <tr>
        <td>员工编号</td>
        <td>员工名字</td>
        <td>所在部门</td>
        <td>操作</td>
    </tr>
    <c:forEach items="${emps}" var="emp">
        <tr>
            <td>${emp.empid}</td>
            <td>${emp.empName}</td>
            <td>${emp.dept.deptName}</td>
            <td><a href="${pageContext.request.contextPath}/tochangeEmp/${emp.empid}">修改</a>
                &nbsp;&nbsp;|
                <a href="${pageContext.request.contextPath}/delEmp/${emp.empid}" id="del">删除</a>
            </td>
        </tr>

    </c:forEach>





</table>







</body>
</html>
