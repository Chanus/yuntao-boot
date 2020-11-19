var treeObj, reload, renderRoleModulePower, action_path = ctx + 'system/role/';
layui.config({
    base: '../../js/'
}).use(['table', 'popup', 'form', 'operations', 'laytpl'], function () {
    var $ = layui.jquery, table = layui.table, layer = layui.layer, popup = layui.popup, form = layui.form,
        operations = layui.operations, laytpl = layui.laytpl;

    // 渲染表格
    table.render({
        elem: '#datas',
        id: 'd',
        url: action_path + 'list',
        method: 'post',
        cols: [[
            {type: 'checkbox', width: 60, fixed: 'left'},
            {field: 'roleId', title: '角色ID', width: '12%', unresize: true, align: 'center'},
            {field: 'roleCode', title: '角色代码', width: '12%', unresize: true, align: 'center'},
            {field: 'roleName', title: '角色名称', width: '12%', unresize: true, align: 'center'},
            {field: 'validStatus', title: '状态', width: '10%', unresize: true, align: 'center', templet: function (d) {
                if (d.validStatus === '0')
                    return '<span class="layui-badge layui-bg-gray">已停用</span>';
                else if (d.validStatus === '1')
                    return '<span class="layui-badge layui-bg-custom-lightgreen">已启用</span>';
            }},
            {field: 'loginFlag', title: '登录系统', width: '10%', unresize: true, align: 'center', templet: function (d) {
                if (d.loginFlag === '0')
                    return '<span class="layui-badge layui-bg-gray">不能登录</span>';
                else if (d.loginFlag === '1')
                    return '<span class="layui-badge layui-bg-custom-lightgreen">可以登录</span>';
            }},
            {field: 'hasOperator', title: '具有操作员', width: '10%', unresize: true, align: 'center', templet: function (d) {
                if (d.hasOperator === '0')
                    return '<span class="layui-badge layui-bg-gray">不可以</span>';
                else if (d.hasOperator === '1')
                    return '<span class="layui-badge layui-bg-custom-lightgreen">可以</span>';
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
                v: new Date().getTime()
            }
        });
    };

    // 添加
    $('#add').on('click', function () {
        popup.open(600, 630, '<i class="layui-icon layui-icon-add-circle"></i>添加角色', action_path + 'add');
    });

    // 监听工具条
    table.on('tool(datas)', function (obj) {
        var data = obj.data; // 获得当前行数据
        var layEvent = obj.event; // 获得lay-event对应的值
        // var tr = obj.tr; // 获得当前行tr的DOM对象
        if (layEvent === 'update') {// 编辑
            popup.open(600, 650, '<i class="layui-icon layui-icon-edit"></i>编辑角色', action_path + 'update?id=' + data.id);
        } else if (layEvent === 'del') {// 删除
            operations.del({ids: [data.id]}, action_path + 'delete', init);
        }
    });

    // 增删改
    var p0 = $('.layui-show', window.parent.document), p = p0.children()[p0.length - 1].contentWindow;
    operations.id = 'id';
    operations.addUrl = action_path + 'add';
    // 确认添加时触发
    form.on('submit(add)', function (data) {
        operations.add('add', operations.addUrl, data.field, function () {
            // 若添加角色，则刷新角色列表树
            p.init();
            // 刷新父页面表格数据
            p.reload();
        });
        return false;
    });
    // 确认保存并添加下一个时触发
    form.on('submit(addAgain)', function (data) {
        operations.add('addAgain', operations.addUrl, data.field, function () {
            // 若添加角色，则刷新角色列表树
            p.init();
            // 刷新父页面表格数据
            p.reload();
        });
        return false;
    });
    operations.updateUrl = action_path + 'update';
    operations.updateFunc = function () {
        // 若编辑角色，则刷新角色列表树
        p.init();
    };
    operations.delUrl = action_path + 'delete';
    operations.delFunc = function () {
        // 若删除角色，则刷新角色列表树
        p.init();
    };

    // 渲染角色菜单权限列表
    renderRoleModulePower = function (roleCode) {
        var loading = layer.load(0, {shade: [0.2, '#000']});//0.2透明度的白色背景
        $.post(action_path + 'list-role-module-power', {roleCode: roleCode}, function (data) {
            var view = $('#roleModulePowerContent');
            if (data && data.length > 0) {
                data.currentRoleCode = roleCode;
                var gettpl = $('#roleModulePowerTpl').html();
                laytpl(gettpl).render(data, function (html) {
                    view.html(html);
                });
            } else {
                view.html('<tr class="text-c"><td colspan="4">没有权限</td></tr>');
            }
            layer.close(loading);
        });
        return false;
    }

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
        var roleCode = treeObj.getSelectedNodes()[0].roleCode;
        $.ajax({
            type: 'post',
            url: action_path + 'grant?roleCode=' + roleCode + '&modulePowers=' + modulePowers,
            dataType: 'json',
            success: function (data) {
                layer.close(loading);
                if (data.code === 0) {
                    layer.msg(data.msg, {icon: 1, time: 1000});
                } else {
                    renderRoleModulePower(roleCode);
                    layer.msg(data.msg, {icon: 2, anim: 6, time: 1000});
                }
            },
            error: function () {
                layer.close(loading);
                renderRoleModulePower(roleCode);
                layer.msg('请求异常，授权失败', {icon: 2, anim: 6, time: 1000});
            }
        });
        return false;
    });
});

// zTree配置
var setting = {
    async: {
        enable: true,
        url: action_path + 'tree'
    },
    callback: {
        onAsyncSuccess: function () {// 异步加载完成后默认选中根节点
            treeObj = $.fn.zTree.getZTreeObj('roles');
            var selNode = treeObj.getNodeByParam('level', '0');
            treeObj.selectNode(selNode);
        },
        onClick: function (event, treeId, treeNode) {
            if (treeNode.level === 0) {// 点击根节点重新加载角色列表
                $('#power-list').css('display', 'none');
                $('#role-list').css('display', '');
                reload();
            } else {// 点击角色节点刷新角色模块权限
                $('#role-list').css('display', 'none');
                $('#power-list').css('display', '');
                $('#roleName').html(treeNode.name);
                renderRoleModulePower(treeNode.roleCode);
            }
        }
    },
    data: {
        simpleData: {
            enable: true
        }
    },
    view: {
        dblClickExpand: false,
        selectedMulti: false
    }
};

// 加载角色列表树，当前选中的节点是根节点时才刷新树
function init() {
    var nodes = treeObj.getSelectedNodes();
    if (nodes[0].level === 0)
        $.fn.zTree.init($('#roles'), setting);
}

// 加载角色列表树
function loadTree() {
    $.fn.zTree.init($('#roles'), setting);
}