<%--
  Created by IntelliJ IDEA.
  User: youzhengjie666
  Date: 2020/12/11
  Time: 22:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--<!-- 最新版本的 Bootstrap 核心 CSS 文件 -->--%>
<%--<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">--%>
<%--<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->--%>
<%--<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>--%>
<!-- 新 Bootstrap 核心 CSS 文件 -->
<link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">

<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<html>
<head>
    <title>DeptList</title>
</head>
<body>
<h3>部门信息&nbsp;&nbsp;&nbsp;<a href="${pageContext.request.contextPath}/toList">返回主界面</a></h3>
<br/>

<!-- 按钮触发模态框 -->
<button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">新增部门</button>
<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">模态框（Modal）标题</h4>
            </div>
            <form method="post" action="${pageContext.request.contextPath}/addDept">
            <div class="modal-body">


                    部门编号：<input type="text" name="deptid"><br/>
                    部门名称: <input type="text" name="deptName"><br/>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="submit" class="btn btn-primary">确认添加</button>
            </div>
            </form>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>



<table  class="table table-hover">
    <tr>
        <td>部门id</td>
        <td>部门名称</td>
        <td>操作</td>
    </tr>
    <c:forEach items="${depts}" var="dept">
        <tr>
            <td>${dept.deptid}</td>
            <td>${dept.deptName}</td>
            <td><a href="${pageContext.request.contextPath}/tochangeDept/${dept.deptid}/${dept.deptName}">修改</a>
                &nbsp;&nbsp;|
                <a href="${pageContext.request.contextPath}/delDept/${dept.deptid}" id="del">删除</a>
            </td>
        </tr>
    </c:forEach>
</table>





</body>
</html>
