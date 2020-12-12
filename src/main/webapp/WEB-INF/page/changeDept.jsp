<%--
  Created by IntelliJ IDEA.
  User: youzhengjie666
  Date: 2020/12/12
  Time: 15:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>changeDept</title>
</head>
<body>
<h3>changeDept</h3>
    <form method="post" action="${pageContext.request.contextPath}/changeDept">
        <input type="hidden" name="deptid" value="${deptid}"><br/>
        部门名称：<input type="text" name="deptName" value="${deptName}" required><br/>
        <input type="submit" value="修改">
    </form>



</body>
</html>
