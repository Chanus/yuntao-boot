/**
 * 通用的增删改方法
 * @description     基于 layer 封装的模块
 * @name            operations.js
 * @author          Chanus
 * @date            20200801
 * @version         1.0.0
 */
;
layui.define(['form', 'table'], function (exports) {
    var $ = layui.jquery,
        form = layui.form,
        table = layui.table,
        p0 = $('.layui-show', window.parent.document),
        p;
    if (p0 && p0.children()[p0.length - 1]) {
        p = p0.children()[p0.length - 1].contentWindow;
    }

    /**
     * 默认配置信息
     */
    var defaults = {
        windowLevel: 1,// 窗口层级，1为主页面，2为弹出层页面
        path: '',// 请求基础路径
        id: 'id',// 数据模型的主键属性名
        addUrl: 'add',// 添加数据的请求地址
        commonAddFunc: function () {// 添加数据成功后执行的公共方法
            operations.parentWindow.reload();
        },
        addFunc: null,// 添加数据成功后执行的方法
        addAgainFunc: null,// 添加下一个数据成功后执行的方法
        delUrl: 'delete',// 删除数据的请求地址
        delFunc: null,// 删除数据成功后执行的方法
        updateUrl: 'update',// 更新数据的请求地址
        updatePwdUrl: 'password',// 修改密码的请求地址
        updateFunc: null,// 更新数据成功后执行的方法
        confirmUrl: ''// 询问请求的请求地址
    }

    var operations = {
        /**
         * 设置配置信息
         */
        config: function (options) {
            operations.settigs = $.extend(defaults, options);
            operations.parentWindow = operations.settigs.windowLevel === 2 ? $('.layui-layer-content', window.parent.document).children()[0].contentWindow : p;
        },

        /**
         * 执行添加
         */
        doAdd: function (url, fields, callback) {
            var loading = layer.load(2, {shade: [0.2, '#000']});// 0.2透明度的白色背景
            $.post(url, fields, function (data) {
                callback(data, loading);
            });
        },

        /**
         * 添加
         * @param type          操作类型，add或addAgain，必需
         * @param url           请求地址，需要在使用时指定，必需
         * @param fields        表单数据，必需
         * @param func          在关闭弹窗前要执行的公共操作，可选
         * @param addFunc       add在关闭弹窗前要执行的操作，可选
         * @param addAgainFunc  addAgain在关闭弹窗前要执行的操作，可选
         */
        add: function (type, url, fields, func, addFunc, addAgainFunc) {
            this.doAdd(url, fields, function (e, l) {
                layer.close(l);
                if (e.code === 0) {
                    layer.msg(e.msg, {icon: 1, time: 1000}, function () {
                        // 执行func
                        if (func && typeof func === 'function')
                            func(fields, e);
                        if (type === 'add') {
                            if (addFunc && typeof addFunc === 'function')
                                addFunc(fields, e);
                            parent.layer.close(parent.layer.getFrameIndex(window.name));
                        } else if (type === 'addAgain') {
                            if (addAgainFunc && typeof addAgainFunc === 'function')
                                addAgainFunc(fields, e);
                            $('.layui-form')[0].reset();
                        }
                    });
                } else {
                    layer.msg(e.msg, {icon: 2, anim: 6, time: 2000});
                }
            });
        },

        /**
         * 删除记录，支持批量删除
         * @param obj   删除一条记录：{参数:值}组合，如{id1:value1,id2:value2}，也可以直接传参数值，则相当于{id:value}，必需
         *              批量删除记录：{参数:字典}，如{ids:value[]}，必需
         * @param url   请求url，必需
         * @param func  删除成功后执行的函数，可选
         */
        del: function (obj, url, func) {
            layer.confirm('确定删除记录？', {icon: 3, title: '提示'}, function (index) {
                if (obj) {
                    // 拼接url
                    if (typeof obj === 'object') {
                        url += '?';
                        for (var key in obj) {
                            url += key + '=' + obj[key] + '&';
                        }
                    } else {
                        url += '?id=' + obj;
                    }
                    $.ajax({
                        type: 'post',
                        url: url,
                        dataType: 'json',
                        success: function (data) {
                            if (data.code === 0) {
                                layer.msg(data.msg, {time: 1000}, function () {
                                    if ($('.layui-laypage-btn')[0])
                                        $('.layui-laypage-btn')[0].click();

                                    if (func && typeof func === 'function')
                                        func(obj, data);
                                });
                            } else {
                                layer.msg(data.msg, {icon: 2, anim: 6, time: 2000});
                            }
                        },
                        error: function () {
                            layer.msg('请求异常，删除失败', {icon: 2, anim: 6, time: 2000});
                        }
                    });
                } else {
                    layer.msg('请选择要删除的记录！', {icon: 0, anim: 6, time: 2000});
                }
                layer.close(index);
            });
        },

        /**
         * 编辑
         * @param url       请求地址，需要在使用时指定，必需
         * @param fields    表单数据，必需
         * @param func      在关闭弹窗前要执行的操作，可选
         */
        update: function (url, fields, func) {
            var loading = layer.load(2, {shade: [0.2, '#000']});// 0.2透明度的白色背景
            $.post(url, fields, function (data) {
                layer.close(loading);
                if (data.code === 0) {
                    layer.msg(data.msg, {icon: 1, time: 1000}, function () {
                        // 执行func
                        if (func && typeof func === 'function')
                            func(fields, data);
                        // 刷新父页面表格数据并关闭弹出层
                        var layuiLaypageBtnClass = operations.parentWindow ? $('.layui-laypage-btn', operations.parentWindow.document)[0] : false;
                        if (layuiLaypageBtnClass)
                            layuiLaypageBtnClass.click();
                        parent.layer.close(parent.layer.getFrameIndex(window.name));
                    });
                } else {
                    layer.msg(data.msg, {icon: 2, anim: 6, time: 2000});
                }
            });
        },

        /**
         * 确认操作
         * @param confirm {{url, data, tips, success, afterRefresh}}
         */
        confirm: function (confirm) {
            layer.confirm(confirm.tips, {icon: 3, title: '提示'}, function (index) {
                layer.close(index);
                var loading = layer.load(2, {shade: [0.2, '#000']});// 0.2透明度的白色背景
                $.ajax({
                    type: 'post',
                    url: confirm.url,
                    data: confirm.data || {},
                    dataType: 'json',
                    success: function (data) {
                        layer.close(loading);
                        if (data.code === 0) {
                            layer.msg(data.msg, {icon: 1, time: 1000}, function () {
                                // 执行操作成功后的函数
                                if (confirm.success && typeof confirm.success === 'function') {
                                    confirm.success(data);
                                } else {
                                    // 刷新页面表格数据
                                    if ($('.layui-laypage-btn')[0])
                                        $('.layui-laypage-btn')[0].click();
                                    // 执行刷新数据后的函数
                                    if (confirm.afterRefresh && typeof confirm.afterRefresh === 'function') {
                                        confirm.afterRefresh(data);
                                    }
                                }
                            });
                        } else {
                            layer.msg(data.msg, {icon: 2, anim: 6, time: 2000});
                        }
                    },
                    error: function () {
                        layer.msg('请求异常，操作失败', {icon: 2, anim: 6, time: 2000}, function () {
                            layer.close(loading);
                        });
                    }
                });
            });
        }
    };

    // 确认添加时触发
    form.on('submit(add)', function (data) {
        operations.add('add', operations.settigs.path + operations.settigs.addUrl, data.field, operations.settigs.commonAddFunc, operations.settigs.addFunc);
        return false;
    });

    // 确认保存并添加下一个时触发
    form.on('submit(addAgain)', function (data) {
        operations.add('addAgain', operations.settigs.path + operations.settigs.addUrl, data.field, operations.settigs.commonAddFunc, null, operations.settigs.addAgainFunc);
        return false;
    });

    // 批量删除时触发
    $('#delete').on('click', function () {
        var checkStatus = table.checkStatus('d'), data = checkStatus.data;
        if (data.length === 0) {
            layer.msg('请选择要删除的记录', {icon: 2, anim: 6, time: 2000});
            return;
        }
        var ids = [];
        for (var i = 0; i < data.length; i++) {
            ids.push(data[i][operations.settigs.id]);
        }
        operations.del({ids: ids}, operations.settigs.path + operations.settigs.delUrl, operations.settigs.delFunc);
    });

    // 确认编辑时触发
    form.on('submit(update)', function (data) {
        operations.update(operations.settigs.path + operations.settigs.updateUrl, data.field, operations.settigs.updateFunc);
        return false;
    });

    // 确认编辑密码时触发
    form.on('submit(updatePwd)', function (data) {
        operations.update(operations.settigs.path + operations.settigs.updatePwdUrl, data.field, operations.settigs.updateFunc);
        return false;
    });

    // 点击取消按钮时触发，关闭弹出层
    $('#cancel').on('click', function () {
        parent.layer.close(parent.layer.getFrameIndex(window.name));
    });

    exports('operations', operations);
});