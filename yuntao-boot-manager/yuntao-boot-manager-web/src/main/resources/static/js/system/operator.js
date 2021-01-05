var treeObj, reload, action_path = ctx + 'system/operator/';
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
            {field: 'operatorNo', title: '账号', width: '12%', unresize: true, align: 'center'},
            {field: 'operatorName', title: '名称', width: '10%', unresize: true, align: 'center'},
            {field: 'roleName', title: '角色', width: '10%', unresize: true, align: 'center'},
            {field: 'validStatus', title: '状态', width: '10%', unresize: true, align: 'center', templet: function (d) {
                if (d.validStatus === '0')
                    return '<span class="layui-badge layui-bg-gray">已停用</span>';
                else if (d.validStatus === '1')
                    return '<span class="layui-badge layui-bg-custom-lightgreen">已启用</span>';
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
    reload = function (roleCode) {
        table.reload('d', {
            page: {
                curr: 1 //重新从第 1 页开始
            },
            where: {
                operatorRoleCode: roleCode === '-1' ? null : roleCode,
                operatorNo: $('#operatorNo').val(),
                v: new Date().getTime()
            }
        });
    };

    // 搜索
    $('#search').on('click', function () {
        reload(treeObj.getSelectedNodes()[0].roleCode);
    });

    // 添加
    $('#add').on('click', function () {
        var nodes = treeObj.getSelectedNodes();
        popup.open(600, 680, '<i class="layui-icon layui-icon-add-circle"></i>添加操作员', action_path + 'add?operatorRoleCode=' + nodes[0].roleCode);
    });

    // 监听工具条
    table.on('tool(datas)', function (obj) {
        var data = obj.data; // 获得当前行数据
        var layEvent = obj.event; // 获得lay-event对应的值
        // var tr = obj.tr; // 获得当前行tr的DOM对象
        if (layEvent === 'update') {// 编辑
            popup.open(600, 600, '<i class="layui-icon layui-icon-edit"></i>编辑操作员', action_path + 'update?id=' + data.id);
        } else if (layEvent === 'password') {// 修改密码
            popup.open(600, 300, '<i class="layui-icon layui-icon-edit"></i>修改密码', action_path + 'password?operatorNo=' + data.operatorNo);
        } else if (layEvent === 'del') {// 删除
            operations.del({ids: [data.id]}, action_path + 'delete');
        }
    });

    // 增删改
    operations.config({path: action_path});
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
            if (treeNode.level === 0) {// 点击根节点隐藏添加按钮
                $('#operator-list').css('display', '');
                $('#add').css('display', 'none');
                // 点击节点重新加载操作员列表
                reload('-1');
            } else if (treeNode.hasOperator === '0') {// 点击不允许添加操作员的角色节点，隐藏操作员列表
                $('#operator-list').css('display', 'none');
            } else {// 点击允许添加操作员的角色节点显示添加按钮
                $('#operator-list').css('display', '');
                $('#add').css('display', '');
                // 点击节点重新加载操作员列表
                reload(treeNode.roleCode);
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

// 加载角色列表树
function loadTree() {
    $.fn.zTree.init($('#roles'), setting);
}