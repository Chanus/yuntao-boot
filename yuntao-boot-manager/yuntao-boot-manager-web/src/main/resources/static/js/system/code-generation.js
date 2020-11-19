var reload, action_path = ctx + 'system/code/';
layui.config({
    base: '../../js/'
}).use(['table', 'popup', 'form', 'operations'], function () {
    var $ = layui.jquery, table = layui.table, layer = layui.layer, popup = layui.popup, form = layui.form,
        operations = layui.operations;

    // 渲染表格
    table.render({
        elem: '#datas',
        id: 'd',
        url: action_path + 'list',
        method: 'post',
        cols: [[
            {field: 'tableName', title: '表名称', width: '15%', unresize: true, align: 'center'},
            {field: 'tableType', title: '表类型', width: '8%', unresize: true, align: 'center'},
            {field: 'engine', title: '数据库引擎', width: '8%', unresize: true, align: 'center'},
            {field: 'autoIncrement', title: '主键自增长值', width: '8%', unresize: true, align: 'center'},
            {field: 'createTime', title: '创建时间', width: '12%', unresize: true, align: 'center'},
            {field: 'tableCollation', title: '字符序', width: '10%', unresize: true, align: 'center'},
            {field: 'tableComment', title: '备注', unresize: true, align: 'center'},
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
                tableName: $('#tableName').val(),
                v: new Date().getTime()
            }
        });
    };

    // 搜索
    $('#search').on('click', function () {
        reload();
    });

    // 监听工具条
    table.on('tool(datas)', function (obj) {
        var data = obj.data; // 获得当前行数据
        var layEvent = obj.event; // 获得lay-event对应的值
        // var tr = obj.tr; // 获得当前行tr的DOM对象
        if (layEvent === 'column') {// 表字典
            popup.open(700, 600, '<i class="layui-icon layui-icon-about"></i>【' + data.tableName + '】表字典', action_path + 'table-column?tableSchema=' + data.tableSchema + '&tableName=' + data.tableName);
        } else if (layEvent === 'generate') {// 代码生成
            popup.open(600, 700, '<i class="layui-icon layui-icon-fonts-code"></i>代码生成', action_path + 'generate?tableSchema=' + data.tableSchema + '&tableName=' + data.tableName);
        }
    });

    // 确认生成代码时触发
    form.on('submit(generate)', function (data) {
        location.href = action_path + 'generate-download?tableSchema=' + data.field.tableSchema +
            '&tableName=' + data.field.tableName +
            '&author=' + data.field.author +
            '&since=' + data.field.since +
            '&multi=' + data.field.multi +
            '&serverPackage=' + data.field.serverPackage +
            '&controllerPackage=' + data.field.controllerPackage +
            '&tablePrefix=' + data.field.tablePrefix +
            '&autoRemovePrefix=' + data.field.autoRemovePrefix +
            '&pathName=' + data.field.pathName +
            '&moduleId=' + data.field.moduleId +
            '&overrideInsert=' + (data.field.overrideInsert || '0') +
            '&overrideUpdate=' + (data.field.overrideUpdate || '0') +
            '&overrideDelete=' + (data.field.overrideDelete || '0');
        return false;
    });
});