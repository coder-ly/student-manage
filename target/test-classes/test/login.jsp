<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>登录学生信息管理系统</title>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta http-equiv="Cache-Control" content="no-siteapp" />

    <link href="./static/layui/css/layui.css" rel="stylesheet" />
    <link href="./static/layui/css/xadmin.css" rel="stylesheet">
</head>
<body class="login-bg">

<div class="login layui-anim layui-anim-up">
    <div class="message">欢迎登录学生信息管理系统</div>
    <div id="darkbannerwrap"></div>
    <div class="layui-form">
        <hr class="hr15">
        <input name="id" id="loginName" placeholder="用户名" type="text" lay-verify="required" class="layui-input">
        <hr class="hr15">
        <input id="password" name="password" lay-verify="required" placeholder="密码" type="password" class="layui-input">
        <hr class="hr15">
        <input value="登录" lay-submit lay-filter="login" style="width:100%;" type="submit">
        <hr class="hr20">
    </div>
</div>
<script type="text/javascript" src="./static/js/jquery-1.10.2.min.js"></script>
<script src="./static/layui/layui.js" charset="utf-8"></script>
<script src="./static/js/xadmin.js"></script>
<script>
    $(function () {
        layui.use('form', function () {
            const form = layui.form;
            form.on('submit(login)',function (data) {
                const formData = data.field;
                if(formData.id == "admin" && formData.password == "admin") {
                    $.ajax({
                        url:"/student/clearSession",
                        method:"get",
                        success:function (data) {
                            window.location.href = "Main.jsp";
                        }
                    })

                }else {
                    $.ajax({
                        url:"/student/checkUser",
                        data:formData,
                        method:"post",
                        async:true,
                        success:function (result) {
                            console.log(result);
                            if(result){
                                layer.msg("登录成功");
                                window.location.href = "Main.jsp";
                            }else {
                                layer.msg("登录失败");
                            }
                        },
                        error:function () {
                                layer.msg("登录失败");
                        }
                    })
                }
            })
        });
    })
</script>
</body>
</html>