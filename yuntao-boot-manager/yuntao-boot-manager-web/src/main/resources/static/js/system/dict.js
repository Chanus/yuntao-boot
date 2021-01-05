var reload, action_path = ctx + 'system/dict/';
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
            {field : 'id', title : 'ID', width : '6%', unresize : true, align : 'center', fixed : 'left' },
            {field: 'dictCode', title: '字典集代码', width: '10%', unresize: true, align: 'center'},
            {field: 'dictName', title: '字典集名称', width: '10%', unresize: true, align: 'center'},
            {field : 'validStatus', title : '状态', width : '8%', unresize : true, align : 'center', templet : function(d) {
                if (d.validStatus === '0')
                    return '<span class="layui-badge layui-bg-gray">已停用</span>';
                else if (d.validStatus === '1')
                    return '<span class="layui-badge layui-bg-custom-lightgreen">已启用</span>';
                else
                    return d.validStatus;
            }},
            {field: 'remark', title: '备注', unresize: true, align: 'center'},
            {fixed: 'right', title: '操作', width: '20%', unresize: true, align: 'center', toolbar: '#toolbar'}
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
                dictCode: $('#dictCode').val(),
                dictName: encodeURI($('#dictName').val()),
                v: new Date().getTime()
            }
        });
    };

    // 搜索
    $('#search').on('click', function () {
        reload();
    });

    // 添加
    $('#add').on('click', function () {
        popup.open(600, 500, '<i class="layui-icon layui-icon-add-circle"></i>添加数据字典集', action_path + 'add');
    });

    // 重载系统字典
    $('#reload').on('click', function () {
        $.ajax({
            type: 'post',
            url: action_path + 'reload',
            dataType: 'json',
            success: function (data) {
                if (data.code === 0) {
                    layer.msg(data.msg, {icon: 1, time: 1000});
                } else {
                    layer.msg(data.msg, {icon: 2, anim: 6, time: 2000});
                }
            },
            error: function () {
                layer.msg('请求异常，操作失败', {icon: 2, anim: 6, time: 2000});
            }
        });
    });

    // 监听工具条
    table.on('tool(datas)', function (obj) {
        var data = obj.data; // 获得当前行数据
        var layEvent = obj.event; // 获得lay-event对应的值
        // var tr = obj.tr; // 获得当前行tr的DOM对象
        if (layEvent === 'update') {// 编辑
            popup.open(600, 500, '<i class="layui-icon layui-icon-edit"></i>编辑数据字典集', action_path + 'update?id=' + data.id);
        } else if (layEvent === 'del') {// 删除
            operations.del({ids: [data.id]}, action_path + 'delete');
        } else if (layEvent === 'dictItem') {// 字典项
            popup.openLarge('<i class="layui-icon layui-icon-set"></i>字典集【' + data.dictCode + '】字典项', action_path + 'item/main?dictCode=' + data.dictCode);
        }
    });

    // 增删改
    operations.config({path: action_path});
});