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

    var operations = {
        /**
         * 执行添加
         */
        doAdd: function (url, fields, callback) {
            var loading = layer.load(2, {shade: [0.2, '#000']});//0.2透明度的白色背景
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
                            func(e);
                        if (type === 'add') {
                            if (addFunc && typeof addFunc === 'function')
                                addFunc(e);
                            parent.layer.close(parent.layer.getFrameIndex(window.name));
                        } else if (type === 'addAgain') {
                            if (addAgainFunc && typeof addAgainFunc === 'function')
                                addAgainFunc(e);
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
                                        func(data);
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
            var loading = layer.load(2, {shade: [0.2, '#000']});//0.2透明度的白色背景
            $.post(url, fields, function (data) {
                layer.close(loading);
                if (data.code === 0) {
                    layer.msg(data.msg, {icon: 1, time: 1000}, function () {
                        // 执行func
                        if (func && typeof func === 'function')
                            func(data);
                        // 刷新父页面表格数据并关闭弹出层
                        var layuiLaypageBtnClass = p ? $('.layui-laypage-btn', p.document)[0] : false;
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
         * 更新记录状态
         * @param url   请求地址，需要在使用时指定，必需
         * @param obj   请求参数对象{id: id, status: status}
         *  id      记录主键，必需
         *  status  记录状态，必需
         * @param tips  提示信息，可选
         * @param func  更新记录状态操作后执行的方法，可选
         */
        updateStatus: function updateStatus(url, obj, tips, func) {
            layer.confirm(tips || '确定更新记录状态？', {icon: 3, title: '提示'}, function (index) {
                if (obj) {
                    var loading = layer.load(2, {shade: [0.2, '#000']});//0.2透明度的白色背景
                    $.post(url, obj, function (data) {
                        layer.close(loading);
                        if (data.code === 0) {
                            layer.msg(data.msg, {icon: 1, time: 1000}, function () {
                                // 执行func
                                if (func && typeof func === 'function')
                                    func(data);
                                // 刷新页面表格数据
                                if ($('.layui-laypage-btn')[0])
                                    $('.layui-laypage-btn')[0].click();
                            });
                        } else {
                            layer.msg(data.msg, {icon: 2, anim: 6, time: 2000});
                        }
                    });
                } else {
                    layer.msg('请选择要操作的记录！', {icon: 0, anim: 6, time: 2000});
                }
            });
        },

        /**
         * 确认操作
         * @param url       请求url，必需
         * @param params    请求参数, {key1: value1, key2: value2...}格式，必需，可以为 null
         * @param confirm   询问提示，必需
         * @param func      操作成功后执行的函数，可选
         */
        operate: function (url, params, confirm, func) {
            layer.confirm(confirm, {icon: 3, title: '提示'}, function (index) {
                params = params ? params : {};
                $.ajax({
                    type: 'post',
                    url: url,
                    data: params,
                    dataType: 'json',
                    success: function (data) {
                        if (data.code === 0) {
                            layer.msg(data.msg, {time: 1000}, function () {
                                if ($('.layui-laypage-btn')[0])
                                    $('.layui-laypage-btn')[0].click();

                                if (func && typeof func === 'function')
                                    func(data);
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
    };

    // 确认添加时触发
    form.on('submit(add)', function (data) {
        operations.add('add', operations.addUrl, data.field, operations.commonAddFunc, operations.addFunc);
        return false;
    });

    // 确认保存并添加下一个时触发
    form.on('submit(addAgain)', function (data) {
        operations.add('addAgain', operations.addUrl, data.field, operations.commonAddFunc, null, operations.addAgainFunc);
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
            ids.push(data[i][operations.id]);
        }
        operations.del({ids: ids}, operations.delUrl, operations.delFunc);
    });

    // 确认编辑时触发
    form.on('submit(update)', function (data) {
        operations.update(operations.updateUrl, data.field, operations.updateFunc);
        return false;
    });

    // 确认编辑密码时触发
    form.on('submit(updatePwd)', function (data) {
        operations.update(operations.updatePwdUrl, data.field, operations.updateFunc);
        return false;
    });

    // 点击取消按钮时触发，关闭弹出层
    $('#cancel').on('click', function () {
        parent.layer.close(parent.layer.getFrameIndex(window.name));
    });

    exports('operations', operations);
});