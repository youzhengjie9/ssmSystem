<%--
  Created by IntelliJ IDEA.
  User: youzhengjie666
  Date: 2020/12/12
  Time: 14:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>addAdmin</title>
</head>
<body>
<h3>addAdmin</h3>
<br/>
<form method="post" action="${pageContext.request.contextPath}/AddAdmin">
    帐号：<input type="text" name="id"><br/>
    密码：<input type="password" name="password"><br/>
    权限：<select name="authority.authoid">
    <c:forEach items="${authorities}" var="autho">
        <option value="${autho.authoid}">${autho.authoName}</option>
    </c:forEach>
        </select><br/>
    <input type="submit" value="创建">
</form>




</body>
</html>
