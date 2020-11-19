var reload, action_path = ctx + 'system/modulepower/';
layui.config({
    base: '../../js/'
}).use(['table', 'popup', 'form', 'operations'], function () {
    var $ = layui.jquery, table = layui.table, layer = layui.layer, popup = layui.popup, form = layui.form, operations = layui.operations;

    // 渲染表格
    table.render({
        elem: '#datas',
        id: 'd',
        url: action_path + 'list',
        method: 'post',
        cols: [[
            {type: 'checkbox', width: 60, fixed: 'left'},
            {field: 'moduleCode', title: '模块代码', width: '10%', unresize: true, align: 'center'},
            {field: 'moduleName', title: '模块名称', width: '20%', unresize: true, align: 'center'},
            {field: 'powerItem', title: '权限代码', width: '15%', unresize: true, align: 'center'},
            {field: 'aliasName', title: '权限名称', width: '15%', unresize: true, align: 'center'},
            {fixed: 'right', title: '操作', unresize: true, align: 'center', toolbar: '#toolbar'}
        ]],
        page: true,
        limits: [10, 15, 20, 25],
        limit: 20,
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
                moduleCode: moduleCode,
                powerItem: powerItem,
                v: new Date().getTime()
            }
        });
    };

    // 搜索
    $('#search').on('click', function () {
        reload();
    });

    // 监听选择一级模块
    var moduleParentId;
    form.on('select(moduleParentId)', function (data) {
        moduleParentId = data.value;
        if (moduleParentId) {
            $('#moduleCode option:gt(0)').remove();
            $.post({
                url: ctx + 'system/module/modules',
                data: {moduleParentId: moduleParentId},
                dataType: 'json',
                success: function (data) {
                    var selectHtml = '';
                    $.each(data, function (n, value) {
                        selectHtml += '<option value="' + value.moduleCode + '">' + value.moduleName + '</option>';
                    });
                    $('#moduleCode').append(selectHtml);
                    form.render();
                }
            });
        } else {
            $('#moduleCode option:gt(0)').remove();
            form.render();
        }
    });

    // 监听选择二级模块
    var moduleCode;
    form.on('select(moduleCode)', function (data) {
        moduleCode = data.value;
    });

    // 监听权限项下拉列表
    var powerItem, powerName;
    form.on('select(powerItem)', function (data) {
        powerItem = data.value;
        powerName = data.elem[data.elem.selectedIndex].text;
    });

    // 添加
    $('#add').on('click', function () {
        if (!moduleCode) {
            layer.msg('请选择模块', {icon: 2, anim: 6, time: 1000});
            return false;
        }
        if (!powerItem) {
            layer.msg('请选择权限项', {icon: 2, anim: 6, time: 1000});
            return false;
        }

        var loading = layer.load(2, {shade: [0.2, '#000']});//0.2透明度的白色背景
        $.post(action_path + 'add', {
            moduleCode: moduleCode,
            powerItem: powerItem,
            aliasName: powerName
        }, function (data) {
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
        if (layEvent === 'update') {// 编辑
            popup.open(500, 300, '<i class="layui-icon layui-icon-edit"></i>编辑模块权限项', action_path + 'update?mpId=' + data.mpId);
        } else if (layEvent === 'del') {// 删除
            operations.del({ids: [data.mpId]}, action_path + 'delete');
        } else if (layEvent === 'configure') {// 配置模块权限项请求URL
            popup.open(800, 500, '<i class="layui-icon layui-icon-set-fill"></i>配置【' + data.moduleName + '-' + data.aliasName + '】请求URL', action_path + 'method-main?mpId=' + data.mpId);
        }
    });

    // 增删改
    var p0 = $('.layui-show', window.parent.document), p = p0.children()[p0.length - 1].contentWindow;
    operations.id = 'mpId';
    operations.updateUrl = action_path + 'update';
    operations.delUrl = action_path + 'delete';
});