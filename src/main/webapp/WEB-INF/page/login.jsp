<%--
  Created by IntelliJ IDEA.
  User: youzhengjie666
  Date: 2020/12/9
  Time: 22:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>login</title>
</head>
<body>

<form action="${pageContext.request.contextPath}/checkLogin" method="post">
    帐号:<input type="text" name="id" required><br/>
    密码:<input type="password" name="password" required><br/>
    <input type="submit" value="登陆">
</form>


</body>
</html>
