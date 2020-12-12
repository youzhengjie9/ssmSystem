<%--
  Created by IntelliJ IDEA.
  User: youzhengjie666
  Date: 2020/12/12
  Time: 15:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>addDept</title>
</head>
<body>
   <form method="post" action="${pageContext.request.contextPath}/addDept">
       部门编号：<input type="text" name="deptid"><br/>
       部门名称: <input type="text" name="deptName"><br/>
       <input type="submit" value="确认添加">
   </form>


</body>
</html>
