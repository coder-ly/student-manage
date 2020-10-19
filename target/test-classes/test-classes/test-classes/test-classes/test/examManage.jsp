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
    <table class="layui-table" id="gradeTable" lay-filter="useruv"></table>
</div>
<!--增加选课弹窗-->
<div class="sourceform" id="addSource" hidden="hidden">
    <br>
    <form class="layui-form layui-form-pane" id="studentform">
        <div class="layui-form-item">
            <label class="layui-form-label">学号</label>
            <div class="layui-input-inline">
                <select lay-verify="required" name="student_id"  class="studentSelect" lay-filter="stu">
                    <option value="">请选择</option>
                </select>
            </div>
            <label class="layui-form-label">课程</label>
            <div class="layui-input-inline">
                <select lay-verify="required" name="source_id"  id="selectSource" lay-filter="course">
                    <option value="">请选择</option>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">成绩</label>
            <div class="layui-input-inline">
                <input type="text" id="grade" name="grade" required lay-verify="required|number" autocomplete="off" class="layui-input">
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
            <label class="layui-form-label">课程</label>
            <div class="layui-input-inline">
                <select lay-verify="required" name="source_id"  class="editSourceSelect" lay-filter="course">
                    <option value="">请选择</option>
                </select>
            </div>
            <label class="layui-form-label">成绩</label>
            <div class="layui-input-inline">
                <input type="text" id="exam" name="grade" required lay-verify="required|number" autocomplete="off" class="layui-input" >
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
    <input type="text" name="id" id="studentId" placeholder="请输入学号" autocomplete="off" class="layui-input" style="display:inline-block;width:200px;">
    <button class="layui-btn" lay-submit="" lay-event="search"><i class="layui-icon">&#xe615;</i></button>
</script>
<script>
    $(function () {
        //表格渲染
        layui.use(['table', 'form', 'layer'], function () {
            const table = layui.table,
                form = layui.form,
                layer = layui.layer;
            const gradeTable = table.render({
                elem: '#gradeTable'
                , url: '/grade/tableGrade'
                , cellMinWidth: 80
                ,height:500
                , toolbar:'#toolbar'
                , cols: [[
                    { field: 'student_id', title: '学号', sort: true }
                    , { field: 'name', title: '课程名', align: 'center' }
                    , { field: 'tname', title: '讲师', align: 'center' }
                    , { field: 'credit', title: '学分', align: 'center' }
                    ,, { field: 'grade', title: '考试成绩', align: 'center' }
                    , { field:'one',title: '操作', align: 'center', fixed: 'right', toolbar: '#bar',width:150 }
                ]]
                ,page:true
                ,limits: [5, 10, 15]
                ,limit: 5
                ,done:function (res,curr,count){
                    if("${sessionScope.student.name}"!=""){
                        $(".layui-table").find("[data-field='one']").css("display","none");
                        $("#add").css("display","none");
                    }

            }
        });
            //添加下拉框渲染
            $.ajax({
                url:"/student/selectStudent",
                method:"get",
                dataType:"json",
                success:function (data) {
                    const list=data.data;
                    for(let k in list){
                        $(".studentSelect").append("<option value='"+list[k].id+"'>"+list[k].id+"</option>");
                    }
                    form.render();
                }
            })
            //二级联动选择课程
            form.on('select(stu)', function(data){
                const value=data.value;
                $.ajax({
                    type: 'get',
                    url: "/source/selectSourceByStudent?student_id="+value,
                    success:function(e){
                        console.log(e.data);
                        //empty() 方法从被选元素移除所有内容
                        $("#selectSource").empty();
                        let html = "<option value='0'>请选择</option>";
                        $(e.data).each(function (v, k) {
                            html += "<option value='" + k.id + "'>" + k.name + "</option>";
                        });
                        //把遍历的数据放到select表里面
                        $("#selectSource").append(html);
                        //从新刷新了一下下拉框
                        form.render();      //重新渲染
                    }
                });
            });
            //监听工具栏
            table.on('toolbar(useruv)', function (obj) {
                switch (obj.event) {
                    //添加
                    case 'add':
                        layer.open({
                            type: 1,
                            area: ['650px', '200px'],
                            shadeClose: true,
                            closeBtn: 1, //显示关闭按钮
                            title: '添加课程',
                            content: $("#addSource"),
                        });
                        break;
                    //刷新表格
                    case 'refresh':
                        gradeTable.reload();
                        break;
                    //根据学号查找
                    case 'search':
                        if($("#studentId").val()==""){
                            gradeTable.reload();
                        }else{
                            table.reload('gradeTable', {
                                url: '/grade/selectGradeByStudent?student_id='+$("#studentId").val()
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
                            url: "/grade/deleteGrade",
                            method: "GET",
                            data:{
                                "source_id":data.source_id,
                                "student_id":data.student_id
                            },
                            success: function (data) {
                                const tip = data.code == 100 ? "删除成功！" : "删除失败！";
                                obj.del();
                                layer.msg(tip);
                                gradeTable.reload();
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
                        title: '编辑选课信息',
                        content: $("#editSource"),
                    });
                    $("#exam").val(obj.data.grade);
                    $.ajax({
                        type: 'get',
                        url: "/source/selectSourceByStudent?student_id="+data.student_id,
                        success:function(e){
                            console.log(e.data);
                            //empty() 方法从被选元素移除所有内容
                            $(".editSourceSelect").empty();
                            $(".editSourceSelect").append("<option value='" + data.source_id + "'>" + data.name + "</option>");
                            let html = "";
                            $(e.data).each(function (v, k) {
                                html += "<option value='" + k.id + "'>" + k.name + "</option>";
                            });
                            //把遍历的数据放到select表里面
                            $(".editSourceSelect").append(html);
                            //从新刷新了一下下拉框
                            form.render('select'); //重新渲染
                        }
                    });
                    form.on('submit(editSource)', function (list) {
                        console.log(obj.data.student_id);
                        console.log(list.field.source_id);
                        $.ajax({
                            url: "/grade/updateGrade",
                            data:{
                                "source_id":list.field.source_id,
                                "student_id":obj.data.student_id,
                                "olderSource":obj.data.source_id,
                                "exam":$("#exam").val()
                            },
                            method: "post",
                            dataType: "json",
                            success: function (data) {
                                layer.msg(data.msg);
                                if (data.code == 100) {
                                    gradeTable.reload();
                                    layer.closeAll();
                                    layer.msg(data.msg);
                                    form.render('select');
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
                    url: "/grade/addGrade",
                    method: "post",
                    data: data.field,
                    dataType: "json",
                    success: function (data) {
                        layer.msg(data.msg);
                        if (data.code == 100) {
                            gradeTable.reload();
                            layer.closeAll();
                            form.render();
                        }
                    },
                    error: function () {
                        layer.msg("添加失败！");
                    }
                });
                return false;
            });
            //监听修改提交

        });
    })
</script>
</body>

</html>