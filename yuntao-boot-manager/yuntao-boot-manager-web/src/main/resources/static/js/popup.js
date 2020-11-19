/**
 * 自定义弹出层组件，用于弹出窗口
 * @description 基于layer封装的模块
 * @name        popup.js
 * @author      Chanus
 * @date        20171128
 * @version     0.3.0
 */
;
layui.define(['layer'], function (exports) {
    var $ = layui.jquery, layer = parent.layui.layer === undefined ? layui.layer : parent.layui.layer;

    var popup = {
        /**
         * 打开iframe层
         * @param width     弹出框宽度，必需
         * @param height    弹出框高度，必需
         * @param title     弹出框标题，必需
         * @param url       弹出框URL，必需
         * @param full      最大化标识（true|false），不必需
         */
        open: function (width, height, title, url, full) {
            width = (width && width < $(window).width()) ? width : $(window).width();
            height = (height && height < $(window).height()) ? height : $(window).height();
            title = title || false;
            url = url || '404.html';

            var layerIndex = layer.open({
                type: 2,// iframe层
                title: title,// 标题
                area: [width + 'px', height + 'px'],// 宽高
                //offset: [ '0', '' ],// 坐标，默认：垂直水平居中
                closeBtn: 1,// 关闭按钮，1和2两种选择
                shade: [0.2, '#000'],// 遮罩，0.2透明度的黑色背景
                shadeClose: false,// 是否点击遮罩关闭，默认：false
                maxmin: true,// 最大最小化，默认：false
                fixed: true,// 固定，默认：true
                resize: true,// 是否允许拉伸，默认：true
                content: url// 内容
            });

            if (full)
                layer.full(layerIndex);

            return layerIndex;
        },

        /**
         * 打开iframe层，默认宽高为当前可视窗口的宽高
         * @param title     弹出框标题，必需
         * @param url       弹出框URL，必需
         * @param full      最大化标识（true|false），不必需
         */
        openLarge: function (title, url, full) {
            this.open(null, null, title, url, full);
        },

        /**
         * 打开页面层
         * @param width     弹出框宽度，必需
         * @param height    弹出框高度，必需
         * @param title     弹出框标题，必需
         * @param content   弹出框内容，必需
         * @param full      最大化标识（true|false），不必需
         */
        openPage: function (width, height, title, content, full) {
            width = (width && width < $(window).width()) ? width : $(window).width();
            height = (height && height < $(window).height()) ? height : $(window).height();
            title = title || false;
            content = content || '';

            var layerIndex = layer.open({
                type: 1,// 页面层
                title: title,// 标题
                area: [width + 'px', height + 'px'],// 宽高
                //offset: [ '0', '' ],// 坐标，默认：垂直水平居中
                closeBtn: 1,// 关闭按钮，1和2两种选择
                shade: [0.2, '#000'],// 遮罩，0.2透明度的黑色背景
                shadeClose: false,// 是否点击遮罩关闭，默认：false
                maxmin: true,// 最大最小化，默认：false
                fixed: true,// 固定，默认：true
                resize: true,// 是否允许拉伸，默认：true
                content: content// 内容
            });

            if (full)
                layer.full(layerIndex);

            return layerIndex;
        },

        /**
         * 打开页面层，默认宽高为当前可视窗口的宽高
         * @param title     弹出框标题，必需
         * @param content   弹出框内容，必需
         * @param full      最大化标识（true|false），不必需
         */
        openPageLarge: function (title, content, full) {
            this.openPage(null, null, title, content, full);
        },

        /**
         * 关闭弹出层
         * @param index    弹出层索引，可选
         */
        close: function (index) {
            index = index || parent.layer.getFrameIndex(window.name);
            parent.layer.close(index);
        }
    };

    exports('popup', popup);
});