<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title></title>
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
<div class="x-body">
    <table class="layui-table" id="studentTable" lay-filter="useruv"></table>
</div>
<!--增加学生弹窗-->
<div class="studentform" id="addstudent" hidden="hidden">
    <br>
    <form class="layui-form layui-form-pane" id="studentform">
        <div class="layui-form-item">
            <label class="layui-form-label">学号</label>
            <div class="layui-input-inline">
                <input type="text" name="id" required lay-verify="required" autocomplete="off" class="layui-input">
            </div>
            <label class="layui-form-label">密码</label>
            <div class="layui-input-inline">
                <input type="text" name="password" required lay-verify="required" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">姓名</label>
            <div class="layui-input-inline">
                <input type="text" name="name" required lay-verify="required" autocomplete="off" class="layui-input">
            </div>
            <label class="layui-form-label">电话</label>
            <div class="layui-input-inline">
                <input type="text" name="tel" required lay-verify="required|phone|number" autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">年级</label>
            <div class="layui-input-inline">
                <input type="text" name="grade" required lay-verify="required|number" autocomplete="off" class="layui-input">
            </div>
            <label class="layui-form-label">院系</label>
            <div class="layui-input-inline">
                <input type="text" name="dept" required lay-verify="required" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">专业</label>
            <div class="layui-input-inline">
                <input type="text" name="major" required lay-verify="required" autocomplete="off" class="layui-input">
            </div>
            <label class="layui-form-label">班级</label>
            <div class="layui-input-inline">
                <input type="text" name="of_class" required lay-verify="required" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">性别</label>
            <div class="layui-input-block">
                <input name="sex" title="男" type="radio" checked="" value="男">
                <input name="sex" title="女" type="radio" value="女">
            </div>
        </div>
        <div class="layui-form-item" style="text-align: center;">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit lay-filter="addStudent">保存</button>
                <button type="button" class="layui-btn layui-btn-danger" id="btn-add-close">关闭</button>
            </div>
        </div>
    </form>
</div>
<%--编辑学生弹窗--%>
<div class="editStudentForm" id="editStudent" hidden="hidden">
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
        <div class="layui-form-item" style="text-align: center;">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit lay-filter="editStudent">保存</button>
                <button type="button" class="layui-btn layui-btn-danger" id="btn-edit-close">关闭</button>
            </div>
        </div>
    </form>
</div>
<script type="text/html" id="bar">
    <a class="layui-btn layui-btn-danger layui-btn-sm" lay-event="update">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-sm" lay-event="del">删除</a>
</script>
<script type="text/html" id="toolbar">
    <button class="layui-btn layui-btn-danger" lay-event="refresh"><i class="layui-icon">&#xe669</i>刷新</button>
    <button class="layui-btn" lay-event="add" id="add"><i class="layui-icon"></i>添加</button>
    <button class="layui-btn" lay-event="edit" id="editOwner"><i class="layui-icon"></i>修改个人信息</button>
    <input type="text" name="id" id="studentId" placeholder="请输入学生编号" autocomplete="off" class="layui-input" style="display:inline-block;width:200px;">
    <button class="layui-btn" lay-submit="" lay-event="search"><i class="layui-icon">&#xe615;</i></button>
</script>


<script>
    $(function () {
        //表格渲染
        layui.use(['table', 'form', 'layer'], function () {
            const table = layui.table,
                form = layui.form,
                layer = layui.layer;
            let studentTable = table.render({
                elem: '#studentTable'
                , url: '/student/tableStudent'
                , cellMinWidth: 80
                ,height:500
                , toolbar:'#toolbar'
                , cols: [[
                    { field: 'id', title: '学号', sort: true }
                    , { field: 'password', title: '密码', align: 'center' }
                    , { field: 'name', title: '姓名', align: 'center' }
                    , { field: 'sex', title: '性别', align: 'center' }
                    , { field: 'tel', title: '联系电话', align: 'center' }
                    , { field: 'grade', title: '年级', align: 'center' }
                    , { field: 'dept', title: '院系', align: 'center' }
                    , { field: 'major', title: '专业', align: 'center' }
                    ,{ field: 'of_class', title: '班级', align: 'center' }
                    , { field:'one',title: '操作', align: 'center', fixed: 'right', toolbar: '#bar',width:150 }
                ]]
                ,page:true
                ,limits: [5, 10, 15]
                ,limit: 5
                ,done:function (res,curr,count) {
                    var session='${sessionScope.student.name}';

                    if(session!=""){
                        $(".layui-table").find("[data-field='one']").css("display","none");
                        $(".layui-table").find("[data-field='password']").css("display","none");
                        $("#add").css("display","none");
                    }else{
                        $("#editOwner").css("display","none");
                    }
                }
            });

            //监听工具栏
            table.on('toolbar(useruv)', function (obj) {
                switch (obj.event) {
                    //添加
                    case 'add':
                        layer.open({
                            type: 1,
                            area: ['650px', '400px'],
                            shadeClose: true,
                            closeBtn: 1, //显示关闭按钮
                            title: '添加学生信息',
                            content: $("#addstudent"),
                        });
                        break;
                    //刷新表格
                    case 'refresh':
                        studentTable.reload();
                        break;
                    //根据学号查找
                    case 'search':
                        if($("#studentId").val()==""){
                            studentTable.reload();
                        }else{
                            table.reload('studentTable', {
                                url: '/student/searchStudent?id='+$("#studentId").val()
                            });
                        }
                        break;
                    case "edit":
                        layer.open({
                            type: 1,
                            area: ['650px', '400px'],
                            shadeClose: true,
                            closeBtn: 1, //显示关闭按钮
                            title: '编辑学生信息',
                            content: $("#editStudent"),
                        });
                        form.val('editform',{
                            "id":"${sessionScope.student.id}",
                            "password":"${sessionScope.student.password}",
                            "name":"${sessionScope.student.name}",
                            "sex":"${sessionScope.student.sex}",
                            "grade":"${sessionScope.student.grade}",
                            "tel":"${sessionScope.student.tel}",
                            "dept":"${sessionScope.student.dept}",
                            "major":"${sessionScope.student.major}",
                            "of_class":"${sessionScope.student.of_class}"
                        });
                        break;

                }
            });

            //监听表格行内工具栏
            table.on('tool(useruv)', function (obj) {
                var data = obj.data;
                if (obj.event === 'del') {
                    layer.confirm('真的删除行么', function (index) {
                        $.ajax({
                            url: "/student/deleteStudent",
                            method: "GET",
                            data:{"id":data.id},
                            success: function (data) {
                                const tip = data.code == 100 ? "删除成功！" : "删除失败！";
                                obj.del();
                                layer.msg(tip);
                            },
                            error: function () {
                                layer.msg("出错了......");
                            }
                        });
                        layer.closeAll();
                    });
                }else if(obj.event === 'update'){
                    console.log(data);
                    layer.open({
                        type: 1,
                        area: ['650px', '400px'],
                        shadeClose: true,
                        closeBtn: 1, //显示关闭按钮
                        title: '编辑学生信息',
                        content: $("#editStudent"),
                    });
                    form.val('editform',data);
                }
            });
            //窗口关闭方法集
            $("#btn-add-close").click(function () {
                layer.closeAll();
            });
            $("#btn-edit-close").click(function () {
                layer.closeAll();
            });
            //监听添加提交
            form.on('submit(addStudent)', function (data) {
                $.ajax({
                    url: "/student/addStudent",
                    method: "post",
                    data: data.field,
                    dataType: "json",
                    success: function (data) {
                        layer.msg(data.msg);
                        if (data.code == 100) {
                            studentTable.reload();
                            layer.closeAll();
                        }
                    },
                    error: function () {
                        layer.msg("添加失败！");
                    }
                });
                return false;
            });
            //监听修改提交
            form.on('submit(editStudent)', function (data) {
                $.ajax({
                    url: "/student/updateStudent",
                    method: "post",
                    data: data.field,
                    dataType: "json",
                    success: function (data) {
                        layer.msg(data.msg);
                        if (data.code == 100) {
                            studentTable.reload();
                            layer.closeAll();
                            layer.msg(data.msg);
                        }else {
                            layer.msg(data.msg);
                        }
                    },
                    error: function () {
                        layer.msg("修改失败！");
                    }
                });
                return false;
            });
        });
    })
</script>
</body>

</html>
