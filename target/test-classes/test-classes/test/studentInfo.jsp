
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="./static/css/font.css">
    <link href="./static/layui/css/xadmin.css" rel="stylesheet">
    <link href="./static/layui/css/layui.css" rel="stylesheet" />
    <script type="text/javascript" src="./static/js/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="./static/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="./static/js/xadmin.js"></script>
    <style>
        .wareform {
            margin-top: 30px;
            margin-left: 80px;
            width: 320px;
            height: 250px;
        }
    </style>
</head>
<body class="layui-anim layui-anim-up">
<div class="editStudentForm" id="editStudent">
    <br>
    <form class="layui-form layui-form-pane" id="editStudentForm" lay-filter="editform">
        <div class="layui-form-item">
            <label class="layui-form-label">学号</label>
            <div class="layui-input-inline">
                <input type="text" id="id" name="id" required lay-verify="required" autocomplete="off" class="layui-input" readonly>
            </div>
            <label class="layui-form-label">密码</label>
            <div class="layui-input-inline">
                <input type="text" id="password" name="password" required lay-verify="required" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">姓名</label>
            <div class="layui-input-inline">
                <input type="text" id="name" name="name" required lay-verify="required" autocomplete="off" class="layui-input">
            </div>
            <label class="layui-form-label">电话</label>
            <div class="layui-input-inline">
                <input type="text" id="tel" name="tel" required lay-verify="required|phone|number" autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">年级</label>
            <div class="layui-input-inline">
                <input type="text" id="grade" name="grade" required lay-verify="required|number" autocomplete="off" class="layui-input">
            </div>
            <label class="layui-form-label">院系</label>
            <div class="layui-input-inline">
                <input type="text" id="dept" name="dept" required lay-verify="required" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">专业</label>
            <div class="layui-input-inline">
                <input type="text" id="major" name="major" required lay-verify="required" autocomplete="off" class="layui-input">
            </div>
            <label class="layui-form-label">班级</label>
            <div class="layui-input-inline">
                <input type="text" id="of_class" name="of_class" required lay-verify="required" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">性别</label>
            <div class="layui-input-block">
                <input name="sex" title="男" id="man" type="radio" checked="" value="男">
                <input name="sex" title="女" id="woman" type="radio" value="女">
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit lay-filter="editStudent">保存</button>
            </div>
        </div>
    </form>
</div>
<script>
    $(function () {
        layui.use(['form','layer'],function () {
            const form = layui.form,
                layer = layui.layer;
            $("#id").val("${sessionScope.student.id}");
            $("#password").val("${sessionScope.student.password}");
            $("#name").val("${sessionScope.student.name}");
            $

        })
    })
</script>
</body>
</html>
