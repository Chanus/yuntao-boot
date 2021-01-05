var reload, action_path = ctx + 'system/dict/item/';
layui.config({
    base: '../../../js/'
}).use(['table', 'popup', 'form', 'operations'], function () {
    var $ = layui.jquery, table = layui.table, layer = layui.layer, popup = layui.popup, form = layui.form, operations = layui.operations;
    var dictCode = $('#dictCode').val();

    // 渲染表格
    table.render({
        elem: '#datas',
        id: 'd',
        url: action_path + 'list',
        where: {
            dictCode: dictCode
        },
        method: 'post',
        cols: [[
            {type: 'checkbox', width: 60, fixed: 'left'},
            {field: 'id', title: 'ID', width: '6%', unresize: true, align: 'center'},
            {field: 'itemCode', title: '代码', width: '15%', unresize: true, align: 'center'},
            {field: 'itemName', title: '名称', width: '15%', unresize: true, align: 'center'},
            {field: 'itemData', title: '值', width: '10%', unresize: true, align: 'center'},
            {field : 'validStatus', title : '状态', width : '10%', unresize : true, align : 'center', templet : function(d) {
                if (d.validStatus === '0')
                    return '<span class="layui-badge layui-bg-gray">已停用</span>';
                else if (d.validStatus === '1')
                    return '<span class="layui-badge layui-bg-custom-lightgreen">已启用</span>';
            }},
            {field: 'remark', title: '备注', unresize: true, align: 'center'},
            {field: 'priority', title: '排序', width: '10%', unresize: true, align: 'center'},
            {fixed: 'right', title: '操作', width: '15%', unresize: true, align: 'center', toolbar: '#toolbar'}
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
                dictCode: dictCode,
                v: new Date().getTime()
            }
        });
    };

    // 添加
    $('#add').on('click', function () {
        popup.open(600, 550, '<i class="layui-icon layui-icon-add-circle"></i>添加数据字典项', action_path + 'add?dictCode=' + dictCode);
    });

    // 监听工具条
    table.on('tool(datas)', function (obj) {
        var data = obj.data; // 获得当前行数据
        var layEvent = obj.event; // 获得lay-event对应的值
        // var tr = obj.tr; // 获得当前行tr的DOM对象
        if (layEvent === 'update') {// 编辑
            popup.open(600, 550, '<i class="layui-icon layui-icon-edit"></i>编辑数据字典项', action_path + 'update?id=' + data.id);
        } else if (layEvent === 'del') {// 删除
            operations.del({ids: [data.id]}, action_path + 'delete');
        }
    });

    // 增删改
    var p = $('.layui-layer-content', window.parent.document).children()[0].contentWindow;
    operations.config({
        path: action_path,
        commonAddFunc: function () {
            p.reload();
        },
        updateFunc: function () {
            p.reload();
        }
    });
});