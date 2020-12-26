<%--
  Created by IntelliJ IDEA.
  User: youzhengjie666
  Date: 2020/12/26
  Time: 13:24
  To change this template use File | Settings | File Templates.
--%>
<html class="x-admin-sm">
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 新 Bootstrap 核心 CSS 文件 -->
<link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">

<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>

<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/font.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/xadmin.css">
<script src="${pageContext.request.contextPath}/lib/layui/layui.js" charset="utf-8"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/xadmin.js"></script>

<head>
    <title>adminList</title>
</head>

<body >

<style>
    ul li a{
        text-decoration: none;
    }

    .left-nav{
        margin-top: 20px;
    }
    #tb{
        width: 1500px;
        height: 420px;
        float: left;
        margin-left: 200px;
        /*background-color: red;*/
    }
    .left-nav{
        width: 200px;
        height: 650px;
        position: absolute;
        /*background-color: #00F7DE;*/
    }
    #touxiang{
        border-radius: 50%;

    }


    #pageHelpers{
        width: 450px;
        height: 50px;
        float: right;
    }

    #p1{
        color: cornflowerblue;
    }
    #p2{
        color: cornflowerblue;
    }
    #p3{
        color: cornflowerblue;
    }


</style>

<nav class="navbar navbar-inverse">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="${pageContext.request.contextPath}/toList">xx人力管理系统</a>
        </div>

        <ul class="nav navbar-nav navbar-right">
            <li><img id="touxiang" src="${pageContext.request.contextPath}/imgServlet"></li>
            <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">${user} <span class="caret"></span></a>
                <ul class="dropdown-menu">
                    <li><a data-toggle="modal" data-target="#myModal3" >个人中心</a></li>
                    <li><a href="${pageContext.request.contextPath}/logout">退出登录</a></li>
                </ul>
            </li>
        </ul>
    </div><!-- /.navbar-collapse -->

</nav>


<%--  model--%>
<!-- 个人中心模态框 -->
<div class="modal fade" id="myModal3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel3" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel3">个人中心</h4>
            </div>
            <%--            <form method="post" action="${pageContext.request.contextPath}/">--%>
            <div class="modal-body">
                <form method="post" action="${pageContext.request.contextPath}/upload" enctype="multipart/form-data">
                    上传头像:<input type="file" name="multipartFile">
                    <br/>
                    <input type="submit" value="上传">
                </form>




            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <%--                    <button type="submit" class="btn btn-primary"></button>--%>
            </div>

            <%--            </form>--%>

        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>




<!-- 左侧菜单开始 -->
<div class="left-nav">
    <div id="side-nav">
        <ul id="nav">
            <li>
                <a href="javascript:;">
                    <i class="iconfont left-nav-li" lay-tips="管理员管理">&#xe726;</i>
                    <cite>管理员管理</cite>
                    <i class="iconfont nav_right">&#xe697;</i></a>
                <ul class="sub-menu">
                    <li>
                        <a href="${pageContext.request.contextPath}/adminList/1">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>管理员列表</cite></a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/showDept">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>部门管理</cite></a>
                    </li>
                    <li>

                        <a href="${pageContext.request.contextPath}/toEmpList">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>员工管理</cite></a>
                    </li>



                    <%--                     签到  开始--%>

                    <li>
                        <a href="${pageContext.request.contextPath}/toPublishList">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>发布签到</cite></a>
                    </li>
                    <%--                      签到   结束    --%>




                    <li>
                        <a href=" ${pageContext.request.contextPath}/toLogList/1">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>日志操作</cite></a>
                    </li>
                </ul>


            </li>

            <%--          公司考勤开始   --%>
            <li>
                <a href="javascript:;">
                    <i class="iconfont left-nav-li" lay-tips="公司考勤">&#xe726;</i>
                    <cite>公司考勤</cite>
                    <i class="iconfont nav_right">&#xe697;</i></a>
                <ul class="sub-menu">
                    <li>
                        <a href="${pageContext.request.contextPath}/toSignList">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>我的签到</cite></a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/toLuckDraw">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>员工抽奖</cite></a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/todownload">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>公司资料</cite></a>
                    </li>
                </ul>


            </li>
            <%--    公司考勤结束--%>




        </ul>

    </div>
</div>
<!-- <div class="x-slide_left"></div> -->
<!-- 左侧菜单结束 -->

<div class="page-content-bg"></div>
<style id="theme_style"></style>


<!-- 上传资料模态框 -->
<div class="modal fade" id="myModal6" tabindex="-1" role="dialog" aria-labelledby="myModalLabel6" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel6">个人中心</h4>
            </div>
            <form method="post" action="${pageContext.request.contextPath}/uploadFile" enctype="multipart/form-data">
            <div class="modal-body">
                请选择您要上传的文件:<input type="file" name="multipartFile">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="submit" class="btn btn-primary">上传</button>
            </div>

                </form>

        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>


<div id="tb">

    <button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal6">上传资料</button>

    <table class="table table-hover">
        <tr>
            <td>文件名</td>
            <td>操作</td>
        </tr>
        <c:forEach items="${fileNames}" var="filename">
            <tr>
                <td>${filename}</td>
                <td><a href="${pageContext.request.contextPath}/download?filename=${filename}" class="btn btn-primary btn-sm">下载</a>
                </td>
            </tr>
        </c:forEach>
    </table>

<%--    <div><h3>当前是第<span id="p1">${pageInfo.pageNum}</span>页,一共有<span id="p2">${pageInfo.pages}</span>页,<span id="p3">${pageInfo.total}</span>条记录</h3></div>--%>



<%--    <div id="pageHelpers">--%>
<%--        &lt;%&ndash;    分页&ndash;%&gt;--%>
<%--        <nav aria-label="Page navigation">--%>
<%--            <ul class="pagination">--%>
<%--                <li>--%>
<%--                    <c:if test="${pageInfo.hasPreviousPage}">--%>
<%--                        <a href="${pageContext.request.contextPath}/adminList/${pageInfo.pageNum-1}" aria-label="Previous">--%>
<%--                            <span aria-hidden="true">&laquo;</span>--%>
<%--                        </a>--%>
<%--                    </c:if>--%>
<%--                    <c:if test="${!pageInfo.hasPreviousPage}">--%>
<%--                        <a href="#" aria-label="Previous" onclick="nopre()">--%>
<%--                            <span aria-hidden="true">&laquo;</span>--%>
<%--                        </a>--%>
<%--                    </c:if>--%>
<%--                </li>--%>
<%--                &lt;%&ndash;              pageInfo.navigatepageNums : 其实就是pageHelper帮你分好了的导航栏数字&ndash;%&gt;--%>
<%--                <c:forEach items="${pageInfo.navigatepageNums}" var="page">--%>

<%--                    <c:if test="${page!=pageInfo.pageNum}">--%>
<%--                        <li><a href="${pageContext.request.contextPath}/adminList/${page}">${page}</a> </li>--%>
<%--                    </c:if>--%>

<%--                    &lt;%&ndash;                        当遍历导航栏页号时，页号等于我们当前点击的页号一致就高亮&ndash;%&gt;--%>
<%--                    <c:if test="${page==pageInfo.pageNum}">--%>
<%--                        <li class="active"><a href="${pageContext.request.contextPath}/adminList/${page}">${page}</a></li>--%>
<%--                    </c:if>--%>

<%--                </c:forEach>--%>


<%--                <li>--%>

<%--                    <c:if test="${pageInfo.hasNextPage}">--%>


<%--                        <a href="${pageContext.request.contextPath}/adminList/${pageInfo.pageNum+1}" aria-label="Next">--%>
<%--                            <span aria-hidden="true">&raquo;</span>--%>
<%--                        </a>--%>
<%--                    </c:if>--%>
<%--                    <c:if test="${!pageInfo.hasNextPage}">--%>
<%--                        <a href="#" aria-label="Previous" onclick="noNext()">--%>
<%--                            <span aria-hidden="true">&laquo;</span>--%>
<%--                        </a>--%>
<%--                    </c:if>--%>

<%--                </li>--%>

<%--            </ul>--%>
<%--        </nav>--%>
<%--    </div>--%>



</div>



</body>
</html>
