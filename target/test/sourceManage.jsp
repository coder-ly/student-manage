
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
    <table class="layui-table" id="sourceTable" lay-filter="useruv"></table>
</div>
<!--增加学生弹窗-->
<div class="sourceform" id="addSource" hidden="hidden">
    <br>
    <form class="layui-form layui-form-pane" id="studentform">
        <div class="layui-form-item">
            <label class="layui-form-label">课程号</label>
            <div class="layui-input-inline">
                <input type="text" name="id" required lay-verify="required" autocomplete="off" class="layui-input">
            </div>
            <label class="layui-form-label">课程名</label>
            <div class="layui-input-inline">
                <input type="text" name="name" required lay-verify="required" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">讲师</label>
            <div class="layui-input-inline">
                <select lay-verify="required" name="teacher_id"  class="teacherSelect">
                    <option value="">请选择</option>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">上课地址</label>
            <div class="layui-input-inline">
                <input type="text" name="address" required lay-verify="required" autocomplete="off" class="layui-input">
            </div>
            <label class="layui-form-label">学分</label>
            <div class="layui-input-inline">
                <input type="text" name="credit" required lay-verify="required|number" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item" style="text-align: center;">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit lay-filter="addSource">保存</button>
                <button type="button" class="layui-btn layui-btn-danger" id="btn-add-close">关闭</button>
            </div>
        </div>
    </form>
</div>
<%--编辑学生弹窗--%>
<div class="editSourceForm" id="editSource" hidden="hidden">
    <br>
    <form class="layui-form layui-form-pane" id="sourceForm" lay-filter="editform">
        <div class="layui-form-item">
            <label class="layui-form-label">课程号</label>
            <div class="layui-input-inline">
                <input type="text" name="id" required lay-verify="required" autocomplete="off" class="layui-input">
            </div>
            <label class="layui-form-label">课程名</label>
            <div class="layui-input-inline">
                <input type="text" name="name" required lay-verify="required" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">讲师</label>
            <div class="layui-input-inline">
                <select lay-verify="required" name="teacher_id"  class="teacherSelect">
                    <option value="">请选择</option>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">上课地址</label>
            <div class="layui-input-inline">
                <input type="text" name="address" required lay-verify="required" autocomplete="off" class="layui-input">
            </div>
            <label class="layui-form-label">学分</label>
            <div class="layui-input-inline">
                <input type="text" name="credit" required lay-verify="required|number" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item" style="text-align: center;">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit lay-filter="editSource">保存</button>
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
    <input type="text" name="id" id="sourceName" placeholder="请输入课程名" autocomplete="off" class="layui-input" style="display:inline-block;width:200px;">
    <button class="layui-btn" lay-submit="" lay-event="search"><i class="layui-icon">&#xe615;</i></button>
</script>
<script>
    $(function () {
        //表格渲染
        layui.use(['table', 'form', 'layer'], function () {
            const table = layui.table,
                form = layui.form,
                layer = layui.layer;
            const sourceTable = table.render({
                elem: '#sourceTable'
                , url: '/source/tableSource'
                , cellMinWidth: 80
                ,height:500
                , toolbar:'#toolbar'
                , cols: [[
                    { field: 'id', title: '课程号', sort: true }
                    , { field: 'name', title: '课程名', align: 'center' }
                    , { field: 'tname', title: '讲师', align: 'center' }
                    , { field: 'address', title: '上课地点', align: 'center' }
                    , { field: 'credit', title: '学分', align: 'center' }
                    , { field:'one',title: '操作', align: 'center', fixed: 'right', toolbar: '#bar',width:150 }
                ]]
                ,page:true
                ,limits: [5, 10, 15]
                ,limit: 5,
                done:function (res,curr,count) {
                    if("${sessionScope.student.name}"!=""){
                        $(".layui-table").find("[data-field='one']").css("display","none");
                        $("#add").css("display","none");
                    }

                }
            });
            //添加下拉框渲染
            $.ajax({
                url:"/teacher/selectAllTeacher",
                method:"get",
                dataType:"json",
                success:function (data) {
                    const list=data.data;
                    for(let k in list){
                        $(".teacherSelect").append("<option value='"+list[k].tid+"'>"+list[k].tname+"</option>");
                    }
                    form.render();
                }
            })
            //监听工具栏
            table.on('toolbar(useruv)', function (obj) {
                switch (obj.event) {
                    //添加
                    case 'add':
                        layer.open({
                            type: 1,
                            area: ['650px', '300px'],
                            shadeClose: true,
                            closeBtn: 1, //显示关闭按钮
                            title: '添加课程',
                            content: $("#addSource"),
                        });
                        break;
                    //刷新表格
                    case 'refresh':
                        sourceTable.reload();
                        break;
                    //根据学号查找
                    case 'search':
                        if($("#sourceName").val()==""){
                            sourceTable.reload();
                        }else{
                            table.reload('sourceTable', {
                                url: '/source/selectSourceByName?name='+$("#sourceName").val()
                            });
                        }
                }
            });
            //监听表格行内工具栏
            table.on('tool(useruv)', function (obj) {
                var data = obj.data;
                if (obj.event === 'del') {
                    layer.confirm('真的删除行么', function (index) {
                        $.ajax({
                            url: "/source/deleteSource",
                            method: "GET",
                            data:{"id":data.id},
                            success: function (data) {
                                const tip = data.code == 100 ? "删除成功！" : "删除失败！";
                                obj.del();
                                layer.msg(tip);
                                sourceTable.reload();
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
                        area: ['650px', '300px'],
                        shadeClose: true,
                        closeBtn: 1, //显示关闭按钮
                        title: '编辑学生信息',
                        content: $("#editSource"),
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
            form.on('submit(addSource)', function (data) {
                $.ajax({
                    url: "/source/addSource",
                    method: "post",
                    data: data.field,
                    dataType: "json",
                    success: function (data) {
                        layer.msg(data.msg);
                        if (data.code == 100) {
                            sourceTable.reload();
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
            form.on('submit(editSource)', function (data) {
                $.ajax({
                    url: "/source/editSource",
                    method: "post",
                    data: data.field,
                    dataType: "json",
                    success: function (data) {
                        layer.msg(data.msg);
                        if (data.code == 100) {
                            sourceTable.reload();
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
