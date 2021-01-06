var treeObj, selectedNode, reload, action_path = ctx + 'system/organization/';
layui.config({
    base: '../../js/'
}).use(['table', 'popup', 'form', 'operations'], function () {
    var $ = layui.jquery, table = layui.table, layer = layui.layer, popup = layui.popup, form = layui.form, operations = layui.operations;

    // 渲染表格
    table.render({
        elem: '#datas',
        id: 'd',
        url: action_path + 'list',
        where: {orgParentId: 0},
        method: 'post',
        cols: [[
            {type: 'checkbox', width: 60, fixed: 'left'},
            {field: 'orgId', title: 'ID', width: '6%', unresize: true, align: 'center', fixed: 'left'},
            {field: 'orgCode', title: '代码', width: '10%', unresize: true, align: 'center'},
            {field: 'orgName', title: '名称', width: '12%', unresize: true, align: 'center'},
            {field: 'orgShortName', title: '简称', width: '10%', unresize: true, align: 'center'},
            {field: 'orgLongName', title: '全称', width: '15%', unresize: true, align: 'center'},
            {field: 'orgLocation', title: '地址', width: '15%', unresize: true, align: 'center'},
            {field: 'orgPhone', title: '联系电话', width: '12%', unresize: true, align: 'center'},
            {field: 'priority', title: '排序', width: '6%', unresize: true, align: 'center', edit: 'text'},
            {field: 'validStatus', title: '状态', width: '8%', unresize: true, align: 'center', templet: function (d) {
                if (d.validStatus === '0')
                    return '<span class="layui-badge layui-bg-gray">已停用</span>';
                else if (d.validStatus === '1')
                    return '<span class="layui-badge layui-bg-custom-lightgreen">已启用</span>';
            }},
            {fixed: 'right', title: '操作', width: '15%', unresize: true, align: 'center', toolbar: '#toolbar'}
        ]],
        page: true,
        limits: [10, 15, 20, 25],
        limit: 20,
        even: true,
        size: 'sm'
    });

    // 重新加载
    reload = function (orgParentId) {
        table.reload('d', {
            page: {
                curr: 1 //重新从第 1 页开始
            },
            where: {
                orgParentId: orgParentId,
                v: new Date().getTime()
            }
        });
    };

    // 添加
    $('#add').on('click', function () {
        var nodes = treeObj.getSelectedNodes();
        popup.open(600, 550, '<i class="layui-icon layui-icon-add-circle"></i>添加组织机构', action_path + 'add?orgParentId=' + nodes[0].id);
    });

    // 监听工具条
    table.on('tool(datas)', function (obj) {
        var data = obj.data; // 获得当前行数据
        var layEvent = obj.event; // 获得lay-event对应的值
        // var tr = obj.tr; // 获得当前行tr的DOM对象
        if (layEvent === 'update') {// 编辑
            popup.open(600, 550, '<i class="layui-icon layui-icon-edit"></i>编辑组织机构', action_path + 'update?orgId=' + data.orgId);
        } else if (layEvent === 'del') {// 删除
            operations.del({ids: [data.orgId]}, action_path + 'delete', init);
        }
    });

    // 监听单元格编辑
    table.on('edit(datas)', function (obj) {
        var value = obj.value, // 得到修改后的值
            data = obj.data; // 得到所在行所有键值
        // field = obj.field; // 得到字段
        $.ajax({
            type: 'post',
            url: action_path + 'priority?orgId=' + data.orgId + '&priority=' + value,
            dataType: 'json',
            success: function (data) {
                if (data.code === 0) {
                    layer.msg('排序修改成功', {icon: 1, time: 1000});
                } else {
                    layer.msg('排序修改失败', {icon: 2, anim: 6, time: 2000});
                }
            },
            error: function () {
                layer.msg('请求异常或没有操作权限', {icon: 2, anim: 6, time: 2000});
            }
        });
    });

    // 增删改
    operations.config({
        path: action_path,
        id: 'orgId',
        commonAddFunc: function (data) {
            // 若添加一级组织机构，则刷新组织机构列表树
            operations.parentWindow.init();
            // 刷新父页面表格数据
            operations.parentWindow.reload(data.orgParentId);
        },
        delFunc: function () {
            // 若删除一级组织机构，则刷新组织机构列表树
            operations.parentWindow.init();
        },
        updateFunc: function () {
            // 若编辑一级组织机构，则刷新组织机构列表树
            operations.parentWindow.init();
        }
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
            treeObj = $.fn.zTree.getZTreeObj('organizations');
            var selNode = selectedNode ? selectedNode : treeObj.getNodeByParam('id', 0);
            treeObj.selectNode(selNode);
        },
        onClick: function (event, treeId, treeNode) {
            selectedNode = treeObj.getSelectedNodes()[0];
            reload(treeNode.id);// 重新加载组织机构列表
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

// 加载组织机构列表树
function init() {
    $.fn.zTree.init($('#organizations'), setting);
}

// 加载组织机构列表树
function loadTree() {
    $.fn.zTree.init($('#organizations'), setting);
}