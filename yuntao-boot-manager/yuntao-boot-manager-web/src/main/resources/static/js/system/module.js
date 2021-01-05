var treeObj, reload, action_path = ctx + 'system/module/';
layui.config({
    base: '../../js/'
}).extend({
    iconPicker: '../lib/layuimodules/iconPicker' // 图标选择器模块
}).use(['table', 'popup', 'form', 'operations', 'iconPicker'], function () {
    var $ = layui.jquery, table = layui.table, layer = layui.layer, popup = layui.popup, form = layui.form,
        operations = layui.operations, iconPicker = layui.iconPicker;

    // 渲染表格
    table.render({
        elem: '#datas',
        id: 'd',
        url: action_path + 'list',
        where: {moduleParentId: 0},
        method: 'post',
        cols: [[
            {type: 'checkbox', width: 60, fixed: 'left'},
            {field: 'moduleId', title: '模块ID', width: '8%', unresize: true, align: 'center', fixed: 'left'},
            {field: 'moduleCode', title: '模块代码', width: '10%', unresize: true, align: 'center'},
            {field: 'moduleName', title: '模块名称', width: '10%', unresize: true, align: 'center'},
            {field: 'moduleUrl', title: '模块URL', width: '15%', unresize: true, align: 'center'},
            {field: 'moduleIsMenu', title: '是否菜单', width: '8%', unresize: true, align: 'center', templet: function (d) {
                if (d.moduleIsMenu === '0')
                    return '<span class="layui-badge layui-bg-gray">不是</span>';
                else if (d.moduleIsMenu === '1')
                    return '<span class="layui-badge layui-bg-custom-lightgreen">是</span>';
            }},
            {field: 'moduleForPermission', title: '设置权限', width: '8%', unresize: true, align: 'center', templet: function (d) {
                if (d.moduleForPermission === '0')
                    return '<span class="layui-badge layui-bg-gray">不需要</span>';
                else if (d.moduleForPermission === '1')
                    return '<span class="layui-badge layui-bg-custom-lightgreen">需要</span>';
            }},
            {field: 'moduleIcon', title: '模块图标', width: '15%', unresize: true, align: 'center', templet: function (d) {
                if (d.moduleIcon)
                    return '<i class="' + d.moduleIcon + '"></i>(' + d.moduleIcon + ')';
                else
                    return '';
            }},
            {field: 'moduleTarget', title: '打开位置', width: '8%', unresize: true, align: 'center', templet: function (d) {
                if (d.moduleTarget === '0')
                    return '页签';
                else if (d.moduleTarget === '1')
                    return '新页面';
                else
                    return '';
            }},
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
    reload = function (moduleParentId) {
        table.reload('d', {
            page: {
                curr: 1 //重新从第 1 页开始
            },
            where: {
                moduleParentId: moduleParentId,
                v: new Date().getTime()
            }
        });
    };

    // 添加
    $('#add').on('click', function () {
        var nodes = treeObj.getSelectedNodes();
        popup.open(650, 700, '<i class="layui-icon layui-icon-add-circle"></i>添加模块',
            action_path + 'add?moduleId=' + nodes[0].id + '&level=' + nodes[0].level);
    });

    // 监听工具条
    table.on('tool(datas)', function (obj) {
        var data = obj.data; // 获得当前行数据
        var layEvent = obj.event; // 获得lay-event对应的值
        // var tr = obj.tr; // 获得当前行tr的DOM对象
        if (layEvent === 'update') {// 编辑
            var nodes = treeObj.getSelectedNodes();
            popup.open(650, 700, '<i class="layui-icon layui-icon-edit"></i>编辑模块',
                action_path + 'update?moduleId=' + data.moduleId + '&level=' + nodes[0].level);
        } else if (layEvent === 'del') {// 删除
            operations.del({ids: [data.moduleId]}, action_path + 'delete', init);
        } else if (layEvent === 'up' || layEvent === 'down') {// 调整优先级
            var msg = layEvent === 'up' ? '确定提升优先级吗？' : '确定降低优先级吗？';
            operations.confirm({
                url: action_path + 'priority',
                data: {moduleId: data.moduleId, direction: layEvent},
                tips: msg,
                afterRefresh: function () {
                    init();
                }
            });
        } else if (layEvent === 'transfer') {// 模块迁移
            layer.prompt({
                title: '请输入要迁移到的模块ID'
            }, function(value, index){
                $.ajax({
                    type: 'post',
                    url: action_path + 'transfer',
                    data: {moduleId: data.moduleId, moduleParentId: value},
                    dataType: 'json',
                    success: function (data) {
                        if (data.code === 0) {
                            layer.msg(data.msg, {icon: 1, time: 1000}, function () {
                                $('.layui-laypage-btn')[0].click();
                                init();
                            });
                        } else {
                            layer.msg(data.msg, {icon: 2, anim: 6, time: 2000});
                        }
                    },
                    error: function () {
                        layer.msg('请求异常，操作失败', {icon: 2, anim: 6, time: 2000});
                    }
                });
                layer.close(index);
            });
        }
    });

    iconPicker.render({
        // 选择器，推荐使用input
        elem: '#iconPicker',
        // 数据类型：layuiIcon/layuiIconUnicode/awesomeIcon/allClass
        type: 'allClass',
        // 是否开启搜索：true/false
        search: true,
        // 是否开启分页
        page: true,
        // 每页显示数量，默认12
        limit: 12,
        // 点击回调
        click: function (data) {
            if (data.icon.indexOf('layui-icon-') === 0) {
                $('#moduleIcon').val('layui-icon ' + data.icon);
            } else if (data.icon.indexOf('fa-') === 0) {
                $('#moduleIcon').val('fa ' + data.icon + ' fa-fw');
            }
        }
    });

    // 增删改
    operations.config({
        path: action_path,
        id: 'moduleId',
        commonAddFunc: function () {
            // 若添加一级模块，则刷新模块列表树
            p.init();
            // 刷新父页面表格数据
            p.reload(data.field.moduleParentId);
        },
        delFunc: function () {
            // 若删除一级模块，则刷新模块列表树
            p.init();
        },
        updateFunc: function () {
            // 若编辑一级模块，则刷新模块列表树
            p.init();
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
            treeObj = $.fn.zTree.getZTreeObj('modules');
            var selNode = treeObj.getNodeByParam('id', 0);
            treeObj.selectNode(selNode);
        },
        onClick: function (event, treeId, treeNode) {
            reload(treeNode.id);// 重新加载模块列表
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

// 加载模块列表树，当前选中的节点是根节点时才刷新树
function init() {
    var nodes = treeObj.getSelectedNodes();
    if (nodes[0].id === 0)
        $.fn.zTree.init($('#modules'), setting);
}

// 加载模块列表树
function loadTree() {
    $.fn.zTree.init($('#modules'), setting);
}