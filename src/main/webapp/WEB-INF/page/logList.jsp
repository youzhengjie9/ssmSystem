<%--
  Created by IntelliJ IDEA.
  User: youzhengjie666
  Date: 2020/12/14
  Time: 18:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>logList</title>
</head>
<body>
<h3>日志&nbsp;&nbsp;<a href="${pageContext.request.contextPath}/toList">返回主界面</a></h3>
<table border="1">
    <tr>
        <td>日志编号</td>
        <td>用户id</td>
        <td>操作类型</td>
        <td>内容</td>
        <td>时间</td>
        <td>备注</td>
        <td>操作</td>
    </tr>
    <c:forEach items="${logs}" var="log">
        <tr>
            <td>${log.logid}</td>
            <td>${log.id}</td>
            <td>${log.type}</td>
            <td>${log.operation}</td>
            <td>${log.date}</td>
            <td>${log.remark}</td>
<%--            <c:if test="${!log.remark.equals('')&&log.remark!=null}">--%>
                <td><a href="${pageContext.request.contextPath}/TochangeRemark?logid=${log.logid}&remark=${log.remark}">添加/修改备注</a></td>
<%--            </c:if>--%>
<%--            <c:if test="${log.remark==null||log.remark.equals('')}">--%>
<%--                <td><a href="${pageContext.request.contextPath}/TochangeRemark?logid=${log.logid}">添加/修改备注</a></td>--%>
<%--            </c:if>--%>


         </tr>
    </c:forEach>


</table>



</body>
</html>
