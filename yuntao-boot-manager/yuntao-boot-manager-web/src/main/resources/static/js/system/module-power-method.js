var reload, action_path = ctx + 'system/modulepower/';
layui.config({
    base: '../../js/'
}).use(['table', 'popup', 'form', 'operations'], function () {
    var $ = layui.jquery, table = layui.table, layer = layui.layer, popup = layui.popup, form = layui.form, operations = layui.operations;
    var mpId = $('#mpId').val();

    // 渲染表格
    table.render({
        elem: '#datas',
        id: 'd',
        url: action_path + 'method-list',
        where: {mpId: mpId},
        method: 'post',
        cols: [[
            {type: 'checkbox', width: 60, fixed: 'left'},
            {field: 'className', title: '类名', width: '40%', unresize: true, align: 'center', edit: 'text'},
            {field: 'url', title: '请求URL', width: '35%', unresize: true, align: 'center', edit: 'text'},
            {fixed: 'right', title: '操作', unresize: true, align: 'center', toolbar: '#toolbar'}
        ]],
        even: true,
        size: 'sm'
    });

    // 重新加载
    reload = function () {
        table.reload('d', {
            page: {
                curr: 1 //重新从第 1 页开始
            },
            where: {
                mpId: mpId,
                v: new Date().getTime()
            }
        });
    };

    // 监听选择类名
    var className;
    form.on('select(className)', function (data) {
        className = data.value;
        if (className) {
            $('#url option:gt(0)').remove();
            $.post({
                url: action_path + 'urls',
                data: {className: className},
                dataType: 'json',
                success: function (data) {
                    var selectHtml = '';
                    $.each(data, function (n, value) {
                        selectHtml += '<option value="' + value + '">' + value + '</option>';
                    });
                    $('#url').append(selectHtml);
                    form.render();
                }
            });
        } else {
            $('#url option:gt(0)').remove();
            form.render();
        }
    });

    // 监听选择二级模块
    var url;
    form.on('select(url)', function (data) {
        url = data.value;
    });

    // 添加
    $('#add').on('click', function () {
        if (!className) {
            layer.msg('请选择类名', {icon: 2, anim: 6, time: 1000});
            return false;
        }
        if (!url) {
            layer.msg('请选择请求URL', {icon: 2, anim: 6, time: 1000});
            return false;
        }

        var loading = layer.load(2, {shade: [0.2, '#000']});//0.2透明度的白色背景
        $.post(action_path + 'method-add', {mpId: mpId, className: className, url: url}, function (data) {
            layer.close(loading);
            if (data.code === 0) {
                layer.msg(data.msg, {icon: 1, time: 1000}, function () {
                    // 重新加载表格
                    reload();
                });
            } else {
                layer.msg(data.msg, {icon: 2, anim: 6, time: 2000});
            }
        });
        return false;
    });

    // 监听工具条
    table.on('tool(datas)', function (obj) {
        var data = obj.data; // 获得当前行数据
        var layEvent = obj.event; // 获得lay-event对应的值
        // var tr = obj.tr; // 获得当前行tr的DOM对象
        if (layEvent === 'del') {// 删除
            operations.del({ids: [data.mpmId]}, action_path + 'method-delete', function () {
                reload();
            });
        }
    });

    // 监听单元格编辑
    table.on('edit(datas)', function (obj) {
        var value = obj.value, // 得到修改后的值
            data = obj.data; // 得到所在行所有键值
        field = obj.field; // 得到字段
        $.ajax({
            type: 'post',
            url: action_path + 'method-update?mpmId=' + data.mpmId + '&' + field + '=' + value,
            dataType: 'json',
            success: function (data) {
                if (data.code === 0) {
                    layer.msg('修改成功', {icon: 1, time: 1000});
                } else {
                    layer.msg('修改失败', {icon: 2, anim: 6, time: 2000});
                }
            },
            error: function () {
                layer.msg('请求异常或没有操作权限', {icon: 2, anim: 6, time: 2000});
            }
        });
    });

    // 增删改
    operations.config({path: action_path, id: 'mpmId', delUrl: 'method-delete', delFunc: function () {
        reload();
    }});
});