<%--
  Created by IntelliJ IDEA.
  User: youzhengjie666
  Date: 2020/12/14
  Time: 18:20
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
    <title>logList</title>
</head>
<body>
<%--<h3>日志&nbsp;&nbsp;<a href="${pageContext.request.contextPath}/toList">返回主界面</a></h3>--%>
<style>
    ul li a{
        text-decoration: none;
    }

    .left-nav{
        margin-top: 20px;
    }
    #tb{
        width: 1300px;
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
<%--                <li><a href="${pageContext.request.contextPath}/adminList">管理员信息 <span class="sr-only">(current)</span></a></li>--%>
<%--                <li><a href="${pageContext.request.contextPath}/showDept">部门信息</a></li>--%>
<%--                <li><a href="${pageContext.request.contextPath}/toEmpList">员工信息</a></li>--%>
<%--                <li class="active"><a href=" ${pageContext.request.contextPath}/toLogList">查看日志</a></li>--%>
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
                <li><img src="${pageContext.request.contextPath}/imgServlet"></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">${user}<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><button data-toggle="modal" data-target="#myModal3" >个人中心</button></li>
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
                        <%--                        <a onclick="xadmin.add_tab('管理员列表','admin-list.html')">--%>
                        <a href="${pageContext.request.contextPath}/adminList">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>管理员列表</cite></a>
                    </li>

                    <%--                    <li><a href="${pageContext.request.contextPath}/showDept">部门信息</a></li>--%>
                    <%--                    <li><a href="${pageContext.request.contextPath}/toEmpList">员工信息</a></li>--%>
                    <%--                    <li><a href=" ${pageContext.request.contextPath}/toLogList">查看日志</a></li>--%>

                    <li>
                        <%--                        <a onclick="xadmin.add_tab('角色管理','admin-role.html')">--%>
                        <a href="${pageContext.request.contextPath}/showDept">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>部门管理</cite></a>
                    </li>
                    <li>
                        <%--                        <a onclick="xadmin.add_tab('权限管理','admin-rule.html')">--%>
                        <a href="${pageContext.request.contextPath}/toEmpList">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>员工管理</cite></a>
                    </li>
                    <li>
                        <%--                        <a onclick="xadmin.add_tab('管理员列表','admin-list.html')">--%>
                        <a href=" ${pageContext.request.contextPath}/toLogList">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>日志操作</cite></a>
                    </li>
                </ul>
            </li>




        </ul>
    </div>
</div>
<!-- <div class="x-slide_left"></div> -->
<!-- 左侧菜单结束 -->



<div id="tb">

    <table  class="table table-hover">
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
<%--                <td><a href="${pageContext.request.contextPath}/TochangeRemark?logid=${log.logid}&remark=${log.remark}">添加/修改备注</a></td>--%>
                <!-- 按钮触发模态框 -->
               <td><button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal" value="${log.logid}" onclick="addRemark(this)">添加/修改备注</button></td>


            </tr>
        </c:forEach>


    </table>
</div>



<!-- 日志备注模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">添加/修改备注</h4>
            </div>
            <form method="post" action="${pageContext.request.contextPath}/changeRemark">
                <div class="modal-body">
                    <input type="hidden" name="logid" id="logid" value="">
                   新备注： <input type="text" name="remark" id="remark" value="">
                    <br/>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="submit" class="btn btn-primary">确认备注</button>
                </div>
            </form>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>


<script>
    function addRemark(ele) {
        document.getElementById('logid').value=ele.value;
        // document.getElementById('remark').value=remark;
        /**
         * 有bug 。。如果备注是英文时无法传值，连function也进不来
         */

        // alert(remark);
        // if(typeof ele.value == "undefined"){
        //     document.getElementById('remark').value="";
        // }else{
        //     document.getElementById('remark').value=remark+"";
        // }


    }


</script>



</body>
</html>
