<%--
  Created by IntelliJ IDEA.
  User: youzhengjie666
  Date: 2020/12/9
  Time: 21:41
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
<!-- <link rel="stylesheet" href="./css/theme5.css"> -->
<script src="${pageContext.request.contextPath}/lib/layui/layui.js" charset="utf-8"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/xadmin.js"></script>

<head>
    <title>adminList</title>
</head>
<%--<script>--%>
<%--    function x() {--%>
<%--        alert("关闭浏览器")--%>
<%--    }--%>
<%--</script>--%>

<%--<script>--%>

<%--    document.getElementById('del').onclick=function () {--%>

<%--        let b = confirm("您是否确定删除该管理员？");--%>
<%--        if(b==true){--%>
<%--            alert("删除成功！")--%>
<%--        }else {--%>
<%--            document.getElementById('del').href=${pageContext.request.contextPath}/adminList--%>
<%--            alert("删除失败")--%>
<%--        }--%>

<%--    }--%>


<%--</script>--%>
<body >
<%--<h3>管理员列表&nbsp;&nbsp;&nbsp;<a href="${pageContext.request.contextPath}/toList">返回主界面</a></h3>--%>
<%--<br/>--%>
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

        <!-- Collect the nav links, forms, and other content for toggling -->
<%--        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">--%>
<%--            <ul class="nav navbar-nav">--%>
<%--                <li class="active"><a href="${pageContext.request.contextPath}/adminList">管理员信息 <span class="sr-only">(current)</span></a></li>--%>
<%--                <li><a href="${pageContext.request.contextPath}/showDept">部门信息</a></li>--%>
<%--                <li><a href="${pageContext.request.contextPath}/toEmpList">员工信息</a></li>--%>
<%--                <li><a href=" ${pageContext.request.contextPath}/toLogList">查看日志</a></li>--%>
                <%--                <li class="dropdown">--%>
                <%--                    <a href="${pageContext.request.contextPath}/toEmpList" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">员工信息 <span class="caret"></span></a>--%>
                <%--                    <ul class="dropdown-menu">--%>
                <%--                        <li><a href="#">Action</a></li>--%>
                <%--                        <li><a href="#">Another action</a></li>--%>
                <%--                        <li><a href="#">Something else here</a></li>--%>
                <%--&lt;%&ndash;                        <li role="separator" class="divider"></li>&ndash;%&gt;--%>
                <%--&lt;%&ndash;                        <li><a href="#">Separated link</a></li>&ndash;%&gt;--%>
                <%--&lt;%&ndash;                        <li role="separator" class="divider"></li>&ndash;%&gt;--%>
                <%--&lt;%&ndash;                        <li><a href="#">One more separated link</a></li>&ndash;%&gt;--%>
                <%--                    </ul>--%>
                <%--                </li>--%>
<%--            </ul>--%>
            <%--            <form class="navbar-form navbar-left">--%>
            <%--                <div class="form-group">--%>
            <%--                    <input type="text" class="form-control" placeholder="Search">--%>
            <%--                </div>--%>
            <%--                <button type="submit" class="btn btn-default">Submit</button>--%>
            <%--            </form>--%>
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


<!-- 新增管理员模态框 -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">新增管理员</h4>
            </div>
            <form method="post" action="${pageContext.request.contextPath}/AddAdmin">
                <div class="modal-body">

                    帐号：<input type="text" name="id"><br/>
                    密码：<input type="password" name="password"><br/>
                    权限：<select name="authority.authoid">
                    <c:forEach items="${authorities}" var="autho">
                        <option value="${autho.authoid}">${autho.authoName}</option>
                    </c:forEach>
                </select><br/>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="submit" class="btn btn-primary">创建</button>
                </div>
            </form>
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


<div id="tb">
    <%--   m--%>
    <button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">新增管理员</button>

    <table class="table table-hover">
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
                <td><button class="btn btn-primary btn-sm" data-toggle="modal" data-target="#myModal2"  onclick="change(${admin.id})">修改</button>
                    &nbsp;&nbsp;
<%--                    <a href="${pageContext.request.contextPath}/delAdmin/${admin.id}" id="del">删除</a>--%>
                    <a href="#" class="btn btn-danger btn-sm" onclick="isdel(this,${admin.id})">删除</a>
                </td>
            </tr>
        </c:forEach>
    </table>

        <div><h3>当前是第<span id="p1">${pageInfo.pageNum}</span>页,一共有<span id="p2">${pageInfo.pages}</span>页,<span id="p3">${pageInfo.total}</span>条记录</h3></div>



        <div id="pageHelpers">
            <%--    分页--%>
            <nav aria-label="Page navigation">
                <ul class="pagination">
                    <li>
                        <c:if test="${pageInfo.hasPreviousPage}">
                            <a href="${pageContext.request.contextPath}/adminList/${pageInfo.pageNum-1}" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </c:if>
                        <c:if test="${!pageInfo.hasPreviousPage}">
                            <a href="#" aria-label="Previous" onclick="nopre()">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </c:if>
                    </li>
                    <%--              pageInfo.navigatepageNums : 其实就是pageHelper帮你分好了的导航栏数字--%>
                    <c:forEach items="${pageInfo.navigatepageNums}" var="page">

                        <c:if test="${page!=pageInfo.pageNum}">
                            <li><a href="${pageContext.request.contextPath}/adminList/${page}">${page}</a> </li>
                        </c:if>

<%--                        当遍历导航栏页号时，页号等于我们当前点击的页号一致就高亮--%>
                        <c:if test="${page==pageInfo.pageNum}">
                            <li class="active"><a href="${pageContext.request.contextPath}/adminList/${page}">${page}</a></li>
                        </c:if>

                    </c:forEach>


                    <li>

                        <c:if test="${pageInfo.hasNextPage}">


                            <a href="${pageContext.request.contextPath}/adminList/${pageInfo.pageNum+1}" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </c:if>
                        <c:if test="${!pageInfo.hasNextPage}">
                            <a href="#" aria-label="Previous" onclick="noNext()">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </c:if>

                    </li>

                </ul>
            </nav>
        </div>



</div>




<!-- 修改管理员模态框 -->
<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel2" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel2">修改管理员</h4>
            </div>
            <form method="post" action="${pageContext.request.contextPath}/changgeAdmin">
                <div class="modal-body">

                   <input type="hidden" name="id" id="number"><br/>
                    密码：<input type="password" name="password"><br/>
                    权限：<select name="authority.authoid">
                    <c:forEach items="${authorities}" var="authority">
                        <option value="${authority.authoid}">${authority.authoName}</option>
                    </c:forEach>
                </select>
                    <br/>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="submit" class="btn btn-primary">修改</button>
                </div>
            </form>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>



，<script type="text/javascript">

    function nopre() {
        alert("哥，已经是第一页了，上不去了！")
    }

    function noNext() {
        alert("哥，已经是最后一页了，不能再下了！")
    }


    function change(data) {

        document.getElementById('number').value=data;
    }

    function isdel(et,id) {
        var isdel= confirm("您确定删除管理员："+id+"吗？");
        if(isdel==true){
            et.href="${pageContext.request.contextPath}/delAdmin/"+id;
            alert("成功删除管理员:"+id);
        }
    }




  </script>






</body>
</html>
