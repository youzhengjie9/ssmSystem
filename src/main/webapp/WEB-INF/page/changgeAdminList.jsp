<%--
  Created by IntelliJ IDEA.
  User: youzhengjie666
  Date: 2020/12/11
  Time: 22:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>changgeAdminList</title>
</head>
<body>
<h3>修改Admin</h3><br/>
<form method="post" action="${pageContext.request.contextPath}/changgeAdmin">
    帐号：<input type="text" name="id" value="${id}"><br/>
    密码：<input type="password" name="password"><br/>
    权限：<select name="authority.authoid">
      <c:forEach items="${authorities}" var="authority">
          <option value="${authority.authoid}">${authority.authoName}</option>
      </c:forEach>
        </select>
    <br/>
    <input type="submit" value="确认修改">
</form>


</body>
</html>
