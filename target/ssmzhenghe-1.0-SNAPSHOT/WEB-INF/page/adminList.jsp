<%--
  Created by IntelliJ IDEA.
  User: youzhengjie666
  Date: 2020/12/9
  Time: 21:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--<%@ taglib prefix="sh" uri="http://shiro.apache.org/tags" %>--%>
<html>
<head>
    <title>adminList</title>
</head>
<script>
    function x() {
        alert("关闭浏览器")
    }
</script>

<script>

    document.getElementById('del').onclick=function () {

        let b = confirm("您是否确定删除该管理员？");
        if(b==true){
            alert("删除成功！")
        }else {
            document.getElementById('del').href=${pageContext.request.contextPath}/adminList
            alert("删除失败")
        }

    }


</script>
<body onbeforeunload="x()">
<h3>管理员列表&nbsp;&nbsp;&nbsp;<a href="${pageContext.request.contextPath}/toList">返回主界面</a></h3>
<br/>
<h4><a href="${pageContext.request.contextPath}/toAddAdmin">新增管理员</a> </h4>
<br/>
<table border="1">
    <tr>
        <td>管理员id</td>
        <td>管理员权限等级</td>
        <td>管理员权限名称</td>
        <td>操作</td>
    </tr>
    <c:forEach items="${admin}" var="admin">
        <tr>
            <td>${admin.id}</td>
            <td>${admin.authority.authoid}</td>
            <td>${admin.authority.authoName}</td>
            <td><a href="${pageContext.request.contextPath}/TochanggeAdmin/${admin.id}">修改</a>
            &nbsp;&nbsp;|
                <a href="${pageContext.request.contextPath}/delAdmin/${admin.id}" id="del">删除</a>
            </td>
        </tr>
    </c:forEach>
</table>






</body>
</html>
