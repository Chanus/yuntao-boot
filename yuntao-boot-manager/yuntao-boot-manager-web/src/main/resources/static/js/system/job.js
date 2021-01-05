var reload, action_path = ctx + 'system/job/';
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
            {field: 'jobName', title: '任务名称', width: '8%', unresize: true, align: 'center'},
            {field: 'jobGroup', title: '任务组', width: '8%', unresize: true, align: 'center'},
            {field: 'jobClassName', title: '执行类', width: '15%', unresize: true, align: 'center'},
            {field: 'jobData', title: '属性配置', width: '15%', unresize: true, align: 'center'},
            {field : 'validStatus', title : '状态', width : '8%', unresize : true, align : 'center', templet : function(d) {
                if (d.validStatus === '0')
                    return '<span class="layui-badge layui-bg-gray">已停止</span>';
                else if (d.validStatus === '1')
                    return '<span class="layui-badge layui-bg-custom-lightgreen">已启动</span>';
                else if (d.validStatus === '2')
                    return '<span class="layui-badge layui-bg-orange">已暂停</span>';
            }},
            {field: 'remark', title: '备注', unresize: true, align: 'center'},
            {fixed: 'right', title: '操作', width: '25%', unresize: true, align: 'center', toolbar: '#toolbar'}
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
        popup.open(600, 630, '<i class="layui-icon layui-icon-add-circle"></i>添加定时任务', action_path + 'add');
    });

    // 监听工具条
    table.on('tool(datas)', function (obj) {
        var data = obj.data; // 获得当前行数据
        var layEvent = obj.event; // 获得lay-event对应的值
        // var tr = obj.tr; // 获得当前行tr的DOM对象
        if (layEvent === 'update') {// 编辑
            popup.open(600, 630, '<i class="layui-icon layui-icon-edit"></i>编辑定时任务', action_path + 'update?id=' + data.id);
        } else if (layEvent === 'del') {// 删除
            operations.del({ids: [data.id]}, action_path + 'delete');
        } else if (layEvent === 'configure') {// 配置触发器
            popup.openLarge('<i class="layui-icon layui-icon-set"></i>定时任务【' + data.jobName + '】触发器', action_path + 'trigger/main?jobId=' + data.id);
        } else if (layEvent === 'start') {// 启动定时任务
            operations.confirm({
                url: action_path + 'start',
                data: {id: data.id},
                tips: '确定启动该定时任务吗？'
            });
        } else if (layEvent === 'pause') {// 暂停定时任务
            operations.confirm({
                url: action_path + 'pause',
                data: {id: data.id},
                tips: '确定暂停该定时任务吗？'
            });
        } else if (layEvent === 'resume') {// 恢复定时任务
            operations.confirm({
                url: action_path + 'resume',
                data: {id: data.id},
                tips: '确定恢复该定时任务吗？'
            });
        } else if (layEvent === 'stop') {// 停止定时任务
            operations.confirm({
                url: action_path + 'stop',
                data: {id: data.id},
                tips: '确定停止该定时任务吗？'
            });
        } else if (layEvent === 'trigger') {// 立即执行定时任务
            operations.confirm({
                url: action_path + 'trigger',
                data: {id: data.id},
                tips: '确定立即执行该定时任务吗？'
            });
        }
    });

    // 增删改
    operations.config({path: action_path});
});