<%--
  Created by IntelliJ IDEA.
  User: youzhengjie666
  Date: 2020/12/28
  Time: 22:33
  To change this template use File | Settings | File Templates.
--%>
<html class="x-admin-sm">
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
<!-- <link rel="stylesheet" href="./css/theme5.css"> -->
<script src="${pageContext.request.contextPath}/lib/layui/layui.js" charset="utf-8"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/xadmin.js"></script>
<script src="http://cdn.bootcss.com/jquery/2.2.4/jquery.js"></script>
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
        width: 1430px;
        height: 420px;
        float: left;
        margin-left: 200px;
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
    #title1{
        font-size: 20px;
    }
    p{
        font-size: 16px;
    }
    #ping{
        font-size: 18px;
    }
    #ta2{
        border:0;
        border: 5px;
        background-color:rgba(241,241,241,98);
        width: 355px;
        height: 100px;
        padding: 10px;
        resize: none;
    }
    #ta3{
        border:0;
        border: 5px;
        background-color:rgba(241,241,241,98);
        width: 355px;
        height: 100px;
        padding: 10px;
        resize: none;
    }
    #commentContent{
        font-size: 12px;
    }
    #commentTime{
        font-size: 12px;
        color: #808080;

    }
    #replyTime{
        font-size: 12px;
        color: #808080;
    }
    #replyContent{
        font-size: 16px;
    }

    .cid{
        color: #CB945E;

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



<%--<h4><a href="${pageContext.request.contextPath}/toAddAdmin">新增管理员</a> </h4>--%>
<%--<br/>--%>






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


<div id="tb">

<%--   <li class="list-group-item"><h3>${discuss.discussTitle}</h3></li>--%>
<%--        <li class="list-group-item"><h3>${discuss.discusscontent}</h3></li>--%>
<%--        <li class="list-group-item"><h3>评论</h3></li>--%>

    <div class="panel panel-default">
        <!-- Default panel contents -->
        <div id="title1" class="panel-heading">标题：${discuss.discussTitle}</div>
        <div class="panel-body">
            <p>
                ${discuss.discusscontent}
                <br/>
                    <br/>
                文章发布于：${discuss.discusstime} &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <span id="ping"><button class="btn btn-primary btn-sm" data-toggle="modal" data-target="#myModal8" value="${discuss.discussid}"  onclick="setdiscussid(this)">评论</button></span>
<%--                    <button class="btn btn-primary btn-sm" data-toggle="modal" data-target="#myModal8">修改</button>--%>
            </p>
        </div>

<%--        评论/回复--%>
        <c:if test="${comments!=null&&comments.size()>0}">

            <ul class="list-group">

                    <c:forEach items="${comments}" var="comment">
                        <li class="list-group-item">

                        <div class="media">
                            <a class="pull-left" href="#">
                                <img class="media-object" src="${pageContext.request.contextPath}/userImage/${comment.id}"
                                     alt="Media Object">
                            </a>
                            <div class="media-body">
                                <h4  class="media-heading"><span ><a href="#"  class="cid">${comment.id}</a> </span> <span id="commentContent">：${comment.commentContent}</span></h4>
                                  <span id="commentTime">${fn:substring(comment.commentTime, 0,19 )}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                <span id="reply1"><a href="#" data-toggle="modal" data-target="#myModal9" onclick="setcomid('${comment.commentID}','${comment.id}')">回复</a> </span>
<%--                                下面是回复--%>


                                <c:if test="${comment.replys!=null&&comment.replys.size()>0}">

                                    <c:forEach items="${comment.replys}" var="reply">

                                        <div class="media">
                                            <a class="pull-left" href="#">
                                                <img class="media-object" src="${pageContext.request.contextPath}/userImage/${reply.id}"
                                                     alt="Media Object">
                                            </a>
                                            <div class="media-body">
                                                <h4 class="media-heading"><span><a href="#"  class="cid">${reply.rid}</a></span>回复<span><a href="#"  class="cid">@${reply.pid}</a></span><span id="replyContent">：${reply.replyContent}</span></h4>
                                                <span id="replyTime">${fn:substring(reply.replyTime, 0,19 )}</span>
                                            </div>
                                        </div>

                                    </c:forEach>


                                </c:if>




                            </div>

                        </div>

                        </li>

                    </c:forEach>


            </ul>




        </c:if>









<%--    评论结束--%>


</div>

<%--    回复--%>
    <div class="modal fade" id="myModal9" tabindex="-1" role="dialog" aria-labelledby="myModalLabel9" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabel9">回复评论</h4>
                </div>
                <form method="post" action="${pageContext.request.contextPath}/reply">
                    <div class="modal-body">
                        <input type="hidden" name="discussID" value="${discussID}">
                        <input type="hidden" name="commentID" id="comid">
                        <input type="hidden" name="pid" id="pid">
                        <textarea id="ta3" name="replyContent" placeholder="请输入回复内容"></textarea>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <button type="submit" class="btn btn-primary">回复</button>
                    </div>
                </form>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>











<div class="modal fade" id="myModal8" tabindex="-1" role="dialog" aria-labelledby="myModalLabel8" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel8">发布评论</h4>
            </div>
            <form method="post" action="${pageContext.request.contextPath}/addComment">
                <div class="modal-body">
                    <input type="hidden" name="discussID" id="discussid1"><br/>
                    <textarea id="ta2" name="commentContent" placeholder="请输入评论内容"></textarea>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="submit" class="btn btn-primary">发送评论</button>
                </div>
            </form>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>



</body>


<script type="text/javascript">

    function setdiscussid(ele) {

        document.getElementById('discussid1').value=ele.value;

    }


    function setcomid(commid,pid) {

        document.getElementById('comid').value=commid;
        document.getElementById('pid').value=pid;
    }



</script>



</html>
