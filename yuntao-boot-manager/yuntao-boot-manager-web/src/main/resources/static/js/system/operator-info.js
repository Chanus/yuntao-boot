var action_path = ctx + 'index/user/';
layui.config({
    base: '../../js/'
}).use(['layer', 'popup', 'form', 'upload'], function () {
    var $ = layui.jquery, layer = layui.layer, popup = layui.popup, form = layui.form, upload = layui.upload;

    // 上传头像
    upload.render({
        elem: '.userFaceBtn',
        url: action_path + 'headimage',
        method: 'post',
        accept: 'images',
        auto: true,
        field: 'file',
        size: 20,// 限制20kb
        done: function (res) {
            if (res.code === 0) {
                layer.msg(res.msg, {icon: 1, time: 1000}, function () {
                    $('#userFace').attr('src', (ctx + '') === '/' ? res.data : (ctx + res.data));
                });
            } else {
                layer.msg(res.msg, {icon: 2, anim: 6, time: 2000});
            }
        },
        error: function () {
            layer.msg('请求异常，上传失败', {icon: 0, anim: 6, time: 2000});
        }
    });

    // 点击确认修改个人资料
    form.on('submit(update)', function (data) {
        $.post(action_path + 'operator-info', data.field, function (data) {
            if (data.code === 0) {
                layer.msg(data.msg, {icon: 1, time: 1000}, function () {
                    window.location.reload();
                });
            } else {
                layer.msg(data.msg, {icon: 2, anim: 6, time: 2000});
            }
        });
        return false;
    });

    // 点击确认修改个人密码
    form.on('submit(updatePwd)', function (data) {
        $.post(action_path + 'update-own-password', data.field, function (data) {
            if (data.code === 0) {
                layer.msg(data.msg, {icon: 1, time: 1000}, function () {
                    window.location.reload();
                });
            } else {
                layer.msg(data.msg, {icon: 2, anim: 6, time: 2000});
            }
        });
        return false;
    });
});