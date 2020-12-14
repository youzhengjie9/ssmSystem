<%--
  Created by IntelliJ IDEA.
  User: youzhengjie666
  Date: 2020/12/14
  Time: 18:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>changeRemark</title>
</head>
<body>
<h3>添加/修改备注&nbsp;&nbsp;<a href="${pageContext.request.contextPath}/toList">返回主界面</a></h3><br/>
<form method="post" action="${pageContext.request.contextPath}/changeRemark">
    <input type="hidden" name="logid" value="${logid}">
    <input type="text" name="remark" value="${remark}">
    <br/>
    <input type="submit" value="提交">
</form>


</body>
</html>
