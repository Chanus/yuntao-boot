var reload, action_path = ctx + 'system/job/trigger/';
layui.config({
    base: '../../../js/'
}).use(['table', 'popup', 'form', 'operations'], function () {
    var $ = layui.jquery, table = layui.table, layer = layui.layer, popup = layui.popup, form = layui.form, operations = layui.operations;
    var jobId = $('#jobId').val();

    // 渲染表格
    table.render({
        elem: '#datas',
        id: 'd',
        url: action_path + 'list',
        where: {
            jobId: jobId
        },
        method: 'post',
        cols: [[
            {type: 'checkbox', width: 60, fixed: 'left'},
            {field: 'triggerName', title: '触发器名称', width: '12%', unresize: true, align: 'center'},
            {field: 'triggerGroup', title: '触发器组', width: '12%', unresize: true, align: 'center'},
            {field: 'triggerCron', title: 'Cron表达式', width: '15%', unresize: true, align: 'center'},
            {field: 'triggerStartTimeStr', title: '开始时间', width: '18%', unresize: true, align: 'center'},
            {field: 'triggerEndTimeStr', title: '结束时间', width: '18%', unresize: true, align: 'center'},
            {field: 'triggerData', title: '属性配置', width: '15%', unresize: true, align: 'center'},
            {field: 'priority', title: '优先级', width: '8%', unresize: true, align: 'center'},
            {field : 'validStatus', title : '状态', width : '10%', unresize : true, align : 'center', templet : function(d) {
                if (d.validStatus === '0')
                    return '<span class="layui-badge layui-bg-gray">已停用</span>';
                else if (d.validStatus === '1')
                    return '<span class="layui-badge layui-bg-custom-lightgreen">已启用</span>';
            }},
            {field: 'remark', title: '备注', width : '20%', unresize: true, align: 'center'},
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
                jobId: jobId,
                v: new Date().getTime()
            }
        });
    };

    // 添加
    $('#add').on('click', function () {
        popup.open(600, 600, '<i class="layui-icon layui-icon-add-circle"></i>添加触发器', action_path + 'add?jobId=' + jobId);
    });

    // 监听工具条
    table.on('tool(datas)', function (obj) {
        var data = obj.data; // 获得当前行数据
        var layEvent = obj.event; // 获得lay-event对应的值
        // var tr = obj.tr; // 获得当前行tr的DOM对象
        if (layEvent === 'update') {// 编辑
            popup.open(600, 600, '<i class="layui-icon layui-icon-edit"></i>编辑触发器', action_path + 'update?id=' + data.id);
        } else if (layEvent === 'del') {// 删除
            operations.del({ids: [data.id]}, action_path + 'delete');
        }
    });

    // 增删改
    operations.config({
        windowLevel: 2,
        path: action_path,
        updateFunc: function () {
            operations.parentWindow.reload();
        }
    });
});