var reload, action_path = ctx + 'system/whiteip/';
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
            {field: 'id', title: 'ID', width: '8%', unresize: true, align: 'center'},
            {field: 'whiteIp', title: '白名单IP', width: '27%', unresize: true, align: 'center'},
            {field: 'loginNo', title: '登录账号', width: '27%', unresize: true, align: 'center'},
            {field: 'validStatus', title: '状态', width: '8%', unresize: true, align: 'center', templet: function (d) {
                if (d.validStatus === '0')
                    return '<span class="layui-badge layui-bg-gray">已停用</span>';
                else if (d.validStatus === '1')
                    return '<span class="layui-badge layui-bg-custom-lightgreen">已启用</span>';
            }},
            {field: 'fixedStatus', title: '固定IP', width: '8%', unresize: true, align: 'center', templet: function (d) {
                if (d.fixedStatus === '0')
                    return '<span class="layui-badge layui-bg-gray">不固定</span>';
                else if (d.fixedStatus === '1')
                    return '<span class="layui-badge layui-bg-custom-lightgreen">固定</span>';
            }},
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
                v: new Date().getTime()
            }
        });
    };

    // 添加
    $('#add').on('click', function () {
        popup.open(600, 720, '<i class="layui-icon layui-icon-add-circle"></i>添加IP白名单', action_path + 'add');
    });

    // 监听工具条
    table.on('tool(datas)', function (obj) {
        var data = obj.data; // 获得当前行数据
        var layEvent = obj.event; // 获得lay-event对应的值
        // var tr = obj.tr; // 获得当前行tr的DOM对象
        if (layEvent === 'update') {// 编辑
            popup.open(600, 720, '<i class="layui-icon layui-icon-edit"></i>编辑IP白名单', action_path + 'update?id=' + data.id);
        } else if (layEvent === 'del') {// 删除
            operations.del({ids: [data.id]}, action_path + 'delete');
        }
    });

    // 增删改
    var p0 = $('.layui-show', window.parent.document), p = p0.children()[p0.length - 1].contentWindow;
    operations.id = 'id';
    operations.addUrl = action_path + 'add';
    operations.commonAddFunc = function () {
        p.reload();
    };
    operations.updateUrl = action_path + 'update';
    operations.delUrl = action_path + 'delete';
});