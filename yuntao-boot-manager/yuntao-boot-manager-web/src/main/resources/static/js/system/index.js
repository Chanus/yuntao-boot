layui.config({
    base: '../lib/layuiadmin/', // 静态资源所在路径
    version: '1.0.0.1' // 版本号
}).extend({
    index: 'lib/index', // 主入口模块
    popup: '../../../js/popup' // 弹出框模块
}).use(['index', 'layer', 'popup', 'form'], function () {
    var $ = layui.jquery, layer = layui.layer, popup = layui.popup, form = layui.form;
    var singleLocationLogin = $('#singleLocationLogin').val();

    // 系统时间
    setInterval(function () {
        var t = getBJTime();
        $('#currentTime').html(t.Y + '-' + t.M + '-' + t.D + ' ' + t.H + ':' + t.I + ':' + t.S);
    }, 1000);

    // 刷新权限
    $('#reloadAuthority').on('click', function () {
        var loading = layer.load(0, {shade: [0.2, '#000']});//0.2透明度的白色背景
        $.post(ctx + 'index/reload-authority', function (data) {
            layer.close(loading);
            if (data.code === 0) {
                layer.msg(data.msg, {icon: 1, time: 1000});
            } else {
                layer.msg(data.msg, {icon: 2, anim: 6, time: 2000});
            }
        });
        return false;
    });

    // 检验用户是否在其他在地方登录
    setInterval(function () {
        if (singleLocationLogin !== '1')
            return;

        $.post(ctx + 'check-login', function (data) {
            if (data.code !== 0) {
                layer.msg(data.msg, {icon: 0, anim: 6, time: 2000}, function () {
                    window.parent.location.href = '../login';
                });
            }
        });
    }, 3000);
});