var reload, action_path = ctx + 'system/sub/';
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
            {field: 'operatorNo', title: '子账号', width: '10%', unresize: true, align: 'center'},
            {field: 'operatorName', title: '子账号名称', width: '10%', unresize: true, align: 'center'},
            {field: 'masterNo', title: '主账号', width: '10%', unresize: true, align: 'center'},
            {field: 'roleName', title: '主账号角色', width: '10%', unresize: true, align: 'center'},
            {field: 'validStatus', title: '状态', width: '10%', unresize: true, align: 'center', templet: function (d) {
                if (d.validStatus === '0')
                    return '<span class="layui-badge layui-bg-gray">已停用</span>';
                else if (d.validStatus === '1')
                    return '<span class="layui-badge layui-bg-custom-lightgreen">已启用</span>';
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
                masterNo: $('#masterNo').val() === undefined ? null : $('#masterNo').val(),
                subNo: $('#subNo').val(),
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
        popup.open(600, 700, '<i class="layui-icon layui-icon-add-circle"></i>添加子账号', action_path + 'add');
    });

    // 监听工具条
    table.on('tool(datas)', function (obj) {
        var data = obj.data; // 获得当前行数据
        var layEvent = obj.event; // 获得lay-event对应的值
        // var tr = obj.tr; // 获得当前行tr的DOM对象
        if (layEvent === 'update') {// 编辑
            popup.open(600, 650, '<i class="layui-icon layui-icon-edit"></i>编辑子账号', action_path + 'update?id=' + data.id);
        } else if (layEvent === 'password') {// 修改密码
            popup.open(600, 300, '<i class="layui-icon layui-icon-edit"></i>修改密码', action_path + 'password?subNo=' + data.operatorNo);
        } else if (layEvent === 'del') {// 删除
            operations.del({ids: [data.id]}, action_path + 'delete');
        }
    });

    // 全选/全不选所有模块权限
    $(document).on('click', '#selectAll', function () {
        if (this.checked) {
            $('input[type="checkbox"]').each(function () {
                this.checked = true;
            });
        } else {
            $('input[type="checkbox"]').each(function () {
                this.checked = false;
            });
        }
    });

    // 全选/全不选单个模块权限
    $(document).on('click', 'input[id^="module_"]', function () {
        var module_id = this.id.split('_')[1];
        var module_power_id = 'module_power_' + module_id;
        if (this.checked) {
            $('input[id^="' + module_power_id + '"]').each(function () {
                this.checked = true;
            });
        } else {
            $('input[id^="' + module_power_id + '"]').each(function () {
                this.checked = false;
            });
        }
    });

    // 授权
    $(document).on('click', '#grant', function () {
        var loading = layer.load(2, {shade: [0.2, '#000']});//0.2透明度的白色背景
        // 遍历所有选择的模块功能
        var modulePowers = [];
        $('input[id^="module_power_"]:checkbox').each(function () {
            if ($(this).prop('checked')) {
                modulePowers.push($(this).val());
            }
        });
        var subNo = $('#subNo').val();
        $.ajax({
            type: 'post',
            url: action_path + 'configure?subNo=' + subNo + '&modulePowers=' + modulePowers,
            dataType: 'json',
            success: function (data) {
                layer.close(loading);
                if (data.code === 0) {
                    layer.msg(data.msg, {icon: 1, time: 1000});
                } else {
                    layer.msg(data.msg, {icon: 2, anim: 6, time: 1000});
                }
            },
            error: function () {
                layer.close(loading);
                layer.msg('请求异常，授权失败', {icon: 2, anim: 6, time: 1000});
            }
        });
        return false;
    });

    // 增删改
    operations.config({path: action_path});
});