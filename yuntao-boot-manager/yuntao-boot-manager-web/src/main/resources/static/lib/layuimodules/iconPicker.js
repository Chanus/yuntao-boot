/**
 * 字体图标选择
 * @description 基于iconPicker图标选择器和iconFonts图表选择器二次开发
 * @name        iconPicker.js
 * @author      Chanus
 * @date        20200319
 * @version     1.0.0
 */
layui.define(['laypage', 'form'], function (exports) {
    "use strict";

    var IconPicker = function () {
            this.v = '1.1';
        }, _MOD = 'iconPicker',
        $ = layui.jquery,
        laypage = layui.laypage,
        form = layui.form,
        BODY = 'body',
        TIPS = '请选择图标';

    /**
     * 渲染组件
     */
    IconPicker.prototype.render = function (options) {
        var opts = options,
            // DOM选择器
            elem = opts.elem,
            // 数据类型：layuiIcon/layuiIconUnicode/awesomeIcon/allClass
            type = opts.type == null ? 'layuiIcon' : opts.type,
            // 是否分页：true/false
            page = opts.page == null ? true : opts.page,
            // 每页显示数量
            limit = opts.limit == null ? 12 : opts.limit,
            // 是否开启搜索：true/false
            search = opts.search == null ? true : opts.search,
            // 每个图标格子的宽度：'43px'或'20%'
            cellWidth = opts.cellWidth,
            // 点击回调
            click = opts.click,
            // json数据
            data = {},
            // 唯一标识
            tmp = new Date().getTime(),

            // 初始化时input的值
            ORIGINAL_ELEM_VALUE = $(elem).val(),
            TITLE = 'layui-select-title',
            TITLE_ID = 'layui-select-title-' + tmp,
            ICON_BODY = 'layui-iconpicker-' + tmp,
            PICKER_BODY = 'layui-iconpicker-body-' + tmp,
            PAGE_ID = 'layui-iconpicker-page-' + tmp,
            LIST_BOX = 'layui-iconpicker-list-box',
            selected = 'layui-form-selected',
            unselect = 'layui-unselect';

        var a = {
            init: function () {
                data = common.getData[type]();

                a.hideElem().createSelect().createBody().toggleSelect();
                a.preventEvent().inputListen();
                common.loadCss();

                return a;
            },
            /**
             * 隐藏elem
             */
            hideElem: function () {
                $(elem).hide();
                return a;
            },
            /**
             * 绘制select下拉选择框
             */
            createSelect: function () {
                var oriIcon;
                if (type === 'layuiIcon') {
                    oriIcon = '<i class="layui-icon ' + ORIGINAL_ELEM_VALUE + '"></i>';
                } else if (type === 'layuiIconUnicode') {
                    oriIcon = '<i class="layui-icon">' + ORIGINAL_ELEM_VALUE + '</i>';
                } else if (type === 'awesomeIcon') {
                    oriIcon = '<i class="fa ' + ORIGINAL_ELEM_VALUE + '"></i>';
                } else if (type === 'allClass') {
                    if (ORIGINAL_ELEM_VALUE) {
                        if (ORIGINAL_ELEM_VALUE.indexOf('layui-icon ') === 0) {
                            oriIcon = '<i class="layui-icon ' + ORIGINAL_ELEM_VALUE + '"></i>';
                        } else if (ORIGINAL_ELEM_VALUE.indexOf('fa ') === 0) {
                            oriIcon = '<i class="fa ' + ORIGINAL_ELEM_VALUE + '"></i>';
                        }
                    } else {
                        oriIcon = '<i class="layui-icon ' + ORIGINAL_ELEM_VALUE + '"></i>';
                    }
                }

                var selectHtml = '<div class="layui-iconpicker layui-unselect layui-form-select" id="' + ICON_BODY + '">' +
                    '<div class="' + TITLE + '" id="' + TITLE_ID + '">' +
                    '<div class="layui-iconpicker-item">' +
                    '<span class="layui-iconpicker-icon layui-unselect">' +
                    oriIcon +
                    '</span>' +
                    '<i class="layui-edge"></i>' +
                    '</div>' +
                    '</div>' +
                    '<div class="layui-anim layui-anim-upbit" style="">' +
                    '123' +
                    '</div>';
                $(elem).after(selectHtml);
                return a;
            },
            /**
             * 展开/折叠下拉框
             */
            toggleSelect: function () {
                var item = '#' + TITLE_ID + ' .layui-iconpicker-item,#' + TITLE_ID + ' .layui-iconpicker-item .layui-edge';
                a.event('click', item, function (e) {
                    var $icon = $('#' + ICON_BODY);
                    if ($icon.hasClass(selected)) {
                        $icon.removeClass(selected).addClass(unselect);
                    } else {
                        // 隐藏其他picker
                        $('.layui-form-select').removeClass(selected);
                        // 显示当前picker
                        $icon.addClass(selected).removeClass(unselect);
                    }
                    e.stopPropagation();
                });
                return a;
            },
            /**
             * 绘制主体部分
             */
            createBody: function () {
                // 获取数据
                var searchHtml = '';

                if (search) {
                    searchHtml = '<div class="layui-iconpicker-search">' +
                        '<input class="layui-input" placeholder="' + TIPS + '">' +
                        '<i class="layui-icon">&#xe615;</i>' +
                        '</div>';
                }

                // 组合dom
                var bodyHtml = '<div class="layui-iconpicker-body" id="' + PICKER_BODY + '">' +
                    searchHtml +
                    '<div class="' + LIST_BOX + '"></div> ' +
                    '</div>';
                $('#' + ICON_BODY).find('.layui-anim').eq(0).html(bodyHtml);
                a.search().createList().check().page();

                return a;
            },
            /**
             * 绘制图标列表
             * @param text 模糊查询关键字
             * @returns {string}
             */
            createList: function (text) {
                var d = data,
                    l = d.length,
                    pageHtml = '',
                    listHtml = $('<div class="layui-iconpicker-list">')//'<div class="layui-iconpicker-list">';

                // 计算分页数据
                var _limit = limit, // 每页显示数量
                    _pages = l % _limit === 0 ? l / _limit : parseInt(l / _limit + 1), // 总计多少页
                    _id = PAGE_ID;

                // 图标列表
                var icons = [];

                for (var i = 0; i < l; i++) {
                    var obj = d[i];

                    // 判断是否模糊查询
                    if (text && obj.indexOf(text) === -1) {
                        continue;
                    }

                    // 是否自定义格子宽度
                    var style = '';
                    if (cellWidth !== null) {
                        style += ' style="width:' + cellWidth + '"';
                    }

                    // 每个图标dom
                    var icon = '<div class="layui-iconpicker-icon-item" title="' + obj + '" ' + style + '>';
                    if (type === 'layuiIcon') {
                        icon += '<i class="layui-icon ' + obj + '"></i>';
                    } else if (type === 'layuiIconUnicode') {
                        icon += '<i class="layui-icon">' + obj.replace('amp;', '') + '</i>';
                    } else if (type === 'awesomeIcon') {
                        icon += '<i class="fa ' + obj + '" aria-hidden="true" style="margin-top: 13px;"></i>';
                    } else if (type === 'allClass') {
                        if (obj.indexOf('layui-icon-') === 0) {
                            icon += '<i class="layui-icon ' + obj + '"></i>';
                        } else if (obj.indexOf('fa-') === 0) {
                            icon += '<i class="fa ' + obj + '" aria-hidden="true" style="margin-top: 13px;"></i>';
                        }
                    }
                    icon += '</div>';

                    icons.push(icon);
                }

                // 查询出图标后再分页
                l = icons.length;
                _pages = l % _limit === 0 ? l / _limit : parseInt(l / _limit + 1);
                for (var i = 0; i < _pages; i++) {
                    // 按limit分块
                    var lm = $('<div class="layui-iconpicker-icon-limit" id="layui-iconpicker-icon-limit-' + tmp + (i + 1) + '">');

                    for (var j = i * _limit; j < (i + 1) * _limit && j < l; j++) {
                        lm.append(icons[j]);
                    }

                    listHtml.append(lm);
                }

                // 无数据
                if (l === 0) {
                    listHtml.append('<p class="layui-iconpicker-tips">无数据</p>');
                }

                // 判断是否分页
                if (page) {
                    $('#' + PICKER_BODY).addClass('layui-iconpicker-body-page');
                    pageHtml = '<div class="layui-iconpicker-page" id="' + PAGE_ID + '">' +
                        '<div class="layui-iconpicker-page-count">' +
                        '<span id="' + PAGE_ID + '-current">1</span>/' +
                        '<span id="' + PAGE_ID + '-pages">' + _pages + '</span>' +
                        ' (<span id="' + PAGE_ID + '-length">' + l + '</span>)' +
                        '</div>' +
                        '<div class="layui-iconpicker-page-operate">' +
                        '<i class="layui-icon" id="' + PAGE_ID + '-prev" data-index="0" prev>&#xe603;</i> ' +
                        '<i class="layui-icon" id="' + PAGE_ID + '-next" data-index="2" next>&#xe602;</i> ' +
                        '</div>' +
                        '</div>';
                }


                $('#' + ICON_BODY).find('.layui-anim').find('.' + LIST_BOX).html('').append(listHtml).append(pageHtml);
                return a;
            },
            // 阻止Layui的一些默认事件
            preventEvent: function () {
                var item = '#' + ICON_BODY + ' .layui-anim';
                a.event('click', item, function (e) {
                    e.stopPropagation();
                });
                return a;
            },
            // 分页
            page: function () {
                var icon = '#' + PAGE_ID + ' .layui-iconpicker-page-operate .layui-icon';

                $(icon).unbind('click');
                a.event('click', icon, function (e) {
                    var elem = e.currentTarget,
                        total = parseInt($('#' + PAGE_ID + '-pages').html()),
                        isPrev = $(elem).attr('prev') !== undefined,
                        // 按钮上标的页码
                        index = parseInt($(elem).attr('data-index')),
                        $cur = $('#' + PAGE_ID + '-current'),
                        // 点击时正在显示的页码
                        current = parseInt($cur.html());

                    // 分页数据
                    if (isPrev && current > 1) {
                        current = current - 1;
                        $(icon + '[prev]').attr('data-index', current);
                    } else if (!isPrev && current < total) {
                        current = current + 1;
                        $(icon + '[next]').attr('data-index', current);
                    }
                    $cur.html(current);

                    // 图标数据
                    $('#' + ICON_BODY + ' .layui-iconpicker-icon-limit').hide();
                    $('#layui-iconpicker-icon-limit-' + tmp + current).show();
                    e.stopPropagation();
                });
                return a;
            },
            /**
             * 搜索
             */
            search: function () {
                var item = '#' + PICKER_BODY + ' .layui-iconpicker-search .layui-input';
                a.event('input propertychange', item, function (e) {
                    var elem = e.target,
                        t = $(elem).val();
                    a.createList(t);
                });
                a.event('click', item, function (e) {
                    e.stopPropagation();
                });
                return a;
            },
            /**
             * 点击选中图标
             */
            check: function () {
                var item = '#' + PICKER_BODY + ' .layui-iconpicker-icon-item';
                a.event('click', item, function (e) {
                    var icon = '';

                    if (type === 'layuiIcon') {
                        var el = $(e.currentTarget).find('.layui-icon');
                        var clsArr = el.attr('class').split(/[\s\n]/), cls = clsArr[1];
                        icon = cls;
                        $('#' + TITLE_ID).find('.layui-iconpicker-item .layui-icon').html('').attr('class', clsArr.join(' '));
                    } else if (type === 'layuiIconUnicode') {
                        var el = $(e.currentTarget).find('.layui-icon');
                        var cls = el.html();
                        icon = cls;
                        $('#' + TITLE_ID).find('.layui-iconpicker-item .layui-icon').html(icon);
                    } else if (type === 'awesomeIcon') {
                        var el = $(e.currentTarget).find('.fa');
                        var clsArr = el.attr('class').split(/[\s\n]/), cls = clsArr[1];
                        icon = cls;
                        $('#' + TITLE_ID).find('.layui-iconpicker-item .fa').html('').attr('class', clsArr.join(' '));
                    } else if (type === 'allClass') {
                        var el1 = $(e.currentTarget).find('.layui-icon'), el2 = $(e.currentTarget).find('.fa'), el;
                        el = el1.length > 0 ? el1 : el2;
                        var clsArr = el.attr('class').split(/[\s\n]/), cls = clsArr[1];
                        icon = cls;
                        var iconEl1 = $('#' + TITLE_ID).find('.layui-iconpicker-item .layui-icon'), iconEl2 = $('#' + TITLE_ID).find('.layui-iconpicker-item .fa'), iconEl;
                        iconEl = iconEl1.length > 0 ? iconEl1 : iconEl2;
                        iconEl.html('').attr('class', clsArr.join(' '));
                    }

                    $('#' + ICON_BODY).removeClass(selected).addClass(unselect);
                    $(elem).val(icon).attr('value', icon);
                    // 回调
                    if (click) {
                        click({
                            icon: icon,
                            type: type
                        });
                    }

                });
                return a;
            },
            // 监听原始input数值改变
            inputListen: function () {
                var el = $(elem);
                a.event('change', elem, function () {
                    var value = el.val();
                })
                // el.change(function(){

                // });
                return a;
            },
            event: function (evt, el, fn) {
                $(BODY).on(evt, el, fn);
            }
        };

        var common = {
            /**
             * 加载样式表
             */
            loadCss: function () {
                var css = '.layui-iconpicker {max-width: 280px;}.layui-iconpicker .layui-anim{display:none;position:absolute;left:0;top:42px;padding:5px 0;z-index:899;min-width:100%;border:1px solid #d2d2d2;max-height:300px;overflow-y:auto;background-color:#fff;border-radius:2px;box-shadow:0 2px 4px rgba(0,0,0,.12);box-sizing:border-box;}.layui-iconpicker-item{border:1px solid #e6e6e6;width:90px;height:36px;border-radius:2px;cursor:pointer;position:relative;}.layui-iconpicker-icon{border-right:1px solid #e6e6e6;-webkit-box-sizing:border-box;-moz-box-sizing:border-box;box-sizing:border-box;display:block;width:60px;height:100%;float:left;text-align:center;background:#fff;transition:all .3s;}.layui-iconpicker-icon i{line-height:38px;font-size:18px;}.layui-iconpicker-item > .layui-edge{left:70px;}.layui-iconpicker-item:hover{border-color:#D2D2D2!important;}.layui-iconpicker-item:hover .layui-iconpicker-icon{border-color:#D2D2D2!important;}.layui-iconpicker.layui-form-selected .layui-anim{display:block;}.layui-iconpicker-body{padding:6px;}.layui-iconpicker .layui-iconpicker-list{background-color:#fff;border:1px solid #ccc;border-radius:4px;}.layui-iconpicker .layui-iconpicker-icon-item{display:inline-block;width:21.1%;line-height:36px;text-align:center;cursor:pointer;vertical-align:top;height:36px;margin:4px;border:1px solid #ddd;border-radius:2px;transition:300ms;}.layui-iconpicker .layui-iconpicker-icon-item i.layui-icon{font-size:17px;}.layui-iconpicker .layui-iconpicker-icon-item:hover{background-color:#eee;border-color:#ccc;-webkit-box-shadow:0 0 2px #aaa,0 0 2px #fff inset;-moz-box-shadow:0 0 2px #aaa,0 0 2px #fff inset;box-shadow:0 0 2px #aaa,0 0 2px #fff inset;text-shadow:0 0 1px #fff;}.layui-iconpicker-search{position:relative;margin:0 0 6px 0;border:1px solid #e6e6e6;border-radius:2px;transition:300ms;}.layui-iconpicker-search:hover{border-color:#D2D2D2!important;}.layui-iconpicker-search .layui-input{cursor:text;display:inline-block;width:86%;border:none;padding-right:0;margin-top:1px;}.layui-iconpicker-search .layui-icon{position:absolute;top:11px;right:4%;}.layui-iconpicker-tips{text-align:center;padding:8px 0;cursor:not-allowed;}.layui-iconpicker-page{margin-top:6px;margin-bottom:-6px;font-size:12px;padding:0 2px;}.layui-iconpicker-page-count{display:inline-block;}.layui-iconpicker-page-operate{display:inline-block;float:right;cursor:default;}.layui-iconpicker-page-operate .layui-icon{font-size:12px;cursor:pointer;}.layui-iconpicker-body-page .layui-iconpicker-icon-limit{display:none;}.layui-iconpicker-body-page .layui-iconpicker-icon-limit:first-child{display:block;}';
                var $style = $('head').find('style[iconpicker]');
                if ($style.length === 0) {
                    $('head').append('<style rel="stylesheet" iconpicker>' + css + '</style>');
                }
            },
            /**
             * 获取数据
             */
            getData: {
                layuiIcon: function () {
                    return ["layui-icon-heart-fill", "layui-icon-heart", "layui-icon-light", "layui-icon-time", "layui-icon-bluetooth", "layui-icon-at", "layui-icon-mute", "layui-icon-mike", "layui-icon-key", "layui-icon-gift", "layui-icon-email", "layui-icon-rss", "layui-icon-wifi", "layui-icon-logout", "layui-icon-android", "layui-icon-ios", "layui-icon-windows", "layui-icon-transfer", "layui-icon-service", "layui-icon-subtraction", "layui-icon-addition", "layui-icon-slider", "layui-icon-print", "layui-icon-export", "layui-icon-cols", "layui-icon-screen-restore", "layui-icon-screen-full", "layui-icon-rate-half", "layui-icon-rate", "layui-icon-rate-solid", "layui-icon-cellphone", "layui-icon-vercode", "layui-icon-login-wechat", "layui-icon-login-qq", "layui-icon-login-weibo", "layui-icon-password", "layui-icon-username", "layui-icon-refresh-3", "layui-icon-auz", "layui-icon-spread-left", "layui-icon-shrink-right", "layui-icon-snowflake", "layui-icon-tips", "layui-icon-note", "layui-icon-home", "layui-icon-senior", "layui-icon-refresh", "layui-icon-refresh-1", "layui-icon-flag", "layui-icon-theme", "layui-icon-notice", "layui-icon-website", "layui-icon-console", "layui-icon-face-surprised", "layui-icon-set", "layui-icon-template-1", "layui-icon-app", "layui-icon-template", "layui-icon-praise", "layui-icon-tread", "layui-icon-male", "layui-icon-female", "layui-icon-camera", "layui-icon-camera-fill", "layui-icon-more", "layui-icon-more-vertical", "layui-icon-rmb", "layui-icon-dollar", "layui-icon-diamond", "layui-icon-fire", "layui-icon-return", "layui-icon-location", "layui-icon-read", "layui-icon-survey", "layui-icon-face-smile", "layui-icon-face-cry", "layui-icon-cart-simple", "layui-icon-cart", "layui-icon-next", "layui-icon-prev", "layui-icon-upload-drag", "layui-icon-upload", "layui-icon-download-circle", "layui-icon-component", "layui-icon-file-b", "layui-icon-user", "layui-icon-find-fill", "layui-icon-loading", "layui-icon-loading-1", "layui-icon-add-1", "layui-icon-play", "layui-icon-pause", "layui-icon-headset", "layui-icon-video", "layui-icon-voice", "layui-icon-speaker", "layui-icon-fonts-del", "layui-icon-fonts-code", "layui-icon-fonts-html", "layui-icon-fonts-strong", "layui-icon-unlink", "layui-icon-picture", "layui-icon-link", "layui-icon-face-smile-b", "layui-icon-align-left", "layui-icon-align-right", "layui-icon-align-center", "layui-icon-fonts-u", "layui-icon-fonts-i", "layui-icon-tabs", "layui-icon-radio", "layui-icon-circle", "layui-icon-edit", "layui-icon-share", "layui-icon-delete", "layui-icon-form", "layui-icon-cellphone-fine", "layui-icon-dialogue", "layui-icon-fonts-clear", "layui-icon-layer", "layui-icon-date", "layui-icon-water", "layui-icon-code-circle", "layui-icon-carousel", "layui-icon-prev-circle", "layui-icon-layouts", "layui-icon-util", "layui-icon-templeate-1", "layui-icon-upload-circle", "layui-icon-tree", "layui-icon-table", "layui-icon-chart", "layui-icon-chart-screen", "layui-icon-engine", "layui-icon-triangle-d", "layui-icon-triangle-r", "layui-icon-file", "layui-icon-set-sm", "layui-icon-reduce-circle", "layui-icon-add-circle", "layui-icon-404", "layui-icon-about", "layui-icon-up", "layui-icon-down", "layui-icon-left", "layui-icon-right", "layui-icon-circle-dot", "layui-icon-search", "layui-icon-set-fill", "layui-icon-group", "layui-icon-friends", "layui-icon-reply-fill", "layui-icon-menu-fill", "layui-icon-log", "layui-icon-picture-fine", "layui-icon-face-smile-fine", "layui-icon-list", "layui-icon-release", "layui-icon-ok", "layui-icon-help", "layui-icon-chat", "layui-icon-top", "layui-icon-star", "layui-icon-star-fill", "layui-icon-close-fill", "layui-icon-close", "layui-icon-ok-circle", "layui-icon-add-circle-fine"];
                },
                layuiIconUnicode: function () {
                    return ["&amp;#xe68f;", "&amp;#xe68c;", "&amp;#xe748;", "&amp;#xe68d;", "&amp;#xe689;", "&amp;#xe687;", "&amp;#xe685;", "&amp;#xe6dc;", "&amp;#xe683;", "&amp;#xe627;", "&amp;#xe618;", "&amp;#xe808;", "&amp;#xe7e0;", "&amp;#xe682;", "&amp;#xe684;", "&amp;#xe680;", "&amp;#xe67f;", "&amp;#xe691;", "&amp;#xe626;", "&amp;#xe67e;", "&amp;#xe624;", "&amp;#xe714;", "&amp;#xe66d;", "&amp;#xe67d;", "&amp;#xe610;", "&amp;#xe758;", "&amp;#xe622;", "&amp;#xe6c9;", "&amp;#xe67b;", "&amp;#xe67a;", "&amp;#xe678;", "&amp;#xe679;", "&amp;#xe677;", "&amp;#xe676;", "&amp;#xe675;", "&amp;#xe673;", "&amp;#xe66f;", "&amp;#xe9aa;", "&amp;#xe672;", "&amp;#xe66b;", "&amp;#xe668;", "&amp;#xe6b1;", "&amp;#xe702;", "&amp;#xe66e;", "&amp;#xe68e;", "&amp;#xe674;", "&amp;#xe669;", "&amp;#xe666;", "&amp;#xe66c;", "&amp;#xe66a;", "&amp;#xe667;", "&amp;#xe7ae;", "&amp;#xe665;", "&amp;#xe664;", "&amp;#xe716;", "&amp;#xe656;", "&amp;#xe653;", "&amp;#xe663;", "&amp;#xe6c6;", "&amp;#xe6c5;", "&amp;#xe662;", "&amp;#xe661;", "&amp;#xe660;", "&amp;#xe65d;", "&amp;#xe65f;", "&amp;#xe671;", "&amp;#xe65e;", "&amp;#xe659;", "&amp;#xe735;", "&amp;#xe756;", "&amp;#xe65c;", "&amp;#xe715;", "&amp;#xe705;", "&amp;#xe6b2;", "&amp;#xe6af;", "&amp;#xe69c;", "&amp;#xe698;", "&amp;#xe657;", "&amp;#xe65b;", "&amp;#xe65a;", "&amp;#xe681;", "&amp;#xe67c;", "&amp;#xe601;", "&amp;#xe857;", "&amp;#xe655;", "&amp;#xe770;", "&amp;#xe670;", "&amp;#xe63d;", "&amp;#xe63e;", "&amp;#xe654;", "&amp;#xe652;", "&amp;#xe651;", "&amp;#xe6fc;", "&amp;#xe6ed;", "&amp;#xe688;", "&amp;#xe645;", "&amp;#xe64f;", "&amp;#xe64e;", "&amp;#xe64b;", "&amp;#xe62b;", "&amp;#xe64d;", "&amp;#xe64a;", "&amp;#xe64c;", "&amp;#xe650;", "&amp;#xe649;", "&amp;#xe648;", "&amp;#xe647;", "&amp;#xe646;", "&amp;#xe644;", "&amp;#xe62a;", "&amp;#xe643;", "&amp;#xe63f;", "&amp;#xe642;", "&amp;#xe641;", "&amp;#xe640;", "&amp;#xe63c;", "&amp;#xe63b;", "&amp;#xe63a;", "&amp;#xe639;", "&amp;#xe638;", "&amp;#xe637;", "&amp;#xe636;", "&amp;#xe635;", "&amp;#xe634;", "&amp;#xe633;", "&amp;#xe632;", "&amp;#xe631;", "&amp;#xe630;", "&amp;#xe62f;", "&amp;#xe62e;", "&amp;#xe62d;", "&amp;#xe62c;", "&amp;#xe629;", "&amp;#xe628;", "&amp;#xe625;", "&amp;#xe623;", "&amp;#xe621;", "&amp;#xe620;", "&amp;#xe616;", "&amp;#xe61f;", "&amp;#xe61c;", "&amp;#xe60b;", "&amp;#xe619;", "&amp;#xe61a;", "&amp;#xe603;", "&amp;#xe602;", "&amp;#xe617;", "&amp;#xe615;", "&amp;#xe614;", "&amp;#xe613;", "&amp;#xe612;", "&amp;#xe611;", "&amp;#xe60f;", "&amp;#xe60e;", "&amp;#xe60d;", "&amp;#xe60c;", "&amp;#xe60a;", "&amp;#xe609;", "&amp;#xe605;", "&amp;#xe607;", "&amp;#xe606;", "&amp;#xe604;", "&amp;#xe600;", "&amp;#xe658;", "&amp;#x1007;", "&amp;#x1006;", "&amp;#x1005;", "&amp;#xe608;"];
                },
                awesomeIcon: function () {
                    return [
                        "fa-address-book",
                        "fa-address-book-o",
                        "fa-address-card",
                        "fa-address-card-o",
                        "fa-bandcamp",
                        "fa-bath",
                        "fa-bathtub",
                        "fa-drivers-license",
                        "fa-drivers-license-o",
                        "fa-eercast",
                        "fa-envelope-open",
                        "fa-envelope-open-o",
                        "fa-etsy",
                        "fa-free-code-camp",
                        "fa-grav",
                        "fa-handshake-o",
                        "fa-id-badge",
                        "fa-id-card",
                        "fa-id-card-o",
                        "fa-imdb",
                        "fa-linode",
                        "fa-meetup",
                        "fa-microchip",
                        "fa-podcast",
                        "fa-quora",
                        "fa-ravelry",
                        "fa-s15",
                        "fa-shower",
                        "fa-snowflake-o",
                        "fa-superpowers",
                        "fa-telegram",
                        "fa-thermometer",
                        "fa-thermometer-0",
                        "fa-thermometer-1",
                        "fa-thermometer-2",
                        "fa-thermometer-3",
                        "fa-thermometer-4",
                        "fa-thermometer-empty",
                        "fa-thermometer-full",
                        "fa-thermometer-half",
                        "fa-thermometer-quarter",
                        "fa-thermometer-three-quarters",
                        "fa-times-rectangle",
                        "fa-times-rectangle-o",
                        "fa-user-circle",
                        "fa-user-circle-o",
                        "fa-user-o",
                        "fa-vcard",
                        "fa-vcard-o",
                        "fa-window-close",
                        "fa-window-close-o",
                        "fa-window-maximize",
                        "fa-window-minimize",
                        "fa-window-restore",
                        "fa-wpexplorer",
                        "fa-address-book",
                        "fa-address-book-o",
                        "fa-address-card",
                        "fa-address-card-o",
                        "fa-adjust",
                        "fa-american-sign-language-interpreting",
                        "fa-anchor",
                        "fa-archive",
                        "fa-area-chart",
                        "fa-arrows",
                        "fa-arrows-h",
                        "fa-arrows-v",
                        "fa-asl-interpreting",
                        "fa-assistive-listening-systems",
                        "fa-asterisk",
                        "fa-at",
                        "fa-audio-description",
                        "fa-automobile",
                        "fa-balance-scale",
                        "fa-ban",
                        "fa-bank",
                        "fa-bar-chart",
                        "fa-bar-chart-o",
                        "fa-barcode",
                        "fa-bars",
                        "fa-bath",
                        "fa-bathtub",
                        "fa-battery",
                        "fa-battery-0",
                        "fa-battery-1",
                        "fa-battery-2",
                        "fa-battery-3",
                        "fa-battery-4",
                        "fa-battery-empty",
                        "fa-battery-full",
                        "fa-battery-half",
                        "fa-battery-quarter",
                        "fa-battery-three-quarters",
                        "fa-bed",
                        "fa-beer",
                        "fa-bell",
                        "fa-bell-o",
                        "fa-bell-slash",
                        "fa-bell-slash-o",
                        "fa-bicycle",
                        "fa-binoculars",
                        "fa-birthday-cake",
                        "fa-blind",
                        "fa-bluetooth",
                        "fa-bluetooth-b",
                        "fa-bolt",
                        "fa-bomb",
                        "fa-book",
                        "fa-bookmark",
                        "fa-bookmark-o",
                        "fa-braille",
                        "fa-briefcase",
                        "fa-bug",
                        "fa-building",
                        "fa-building-o",
                        "fa-bullhorn",
                        "fa-bullseye",
                        "fa-bus",
                        "fa-cab",
                        "fa-calculator",
                        "fa-calendar",
                        "fa-calendar-check-o",
                        "fa-calendar-minus-o",
                        "fa-calendar-o",
                        "fa-calendar-plus-o",
                        "fa-calendar-times-o",
                        "fa-camera",
                        "fa-camera-retro",
                        "fa-car",
                        "fa-caret-square-o-down",
                        "fa-caret-square-o-left",
                        "fa-caret-square-o-right",
                        "fa-caret-square-o-up",
                        "fa-cart-arrow-down",
                        "fa-cart-plus",
                        "fa-cc",
                        "fa-certificate",
                        "fa-check",
                        "fa-check-circle",
                        "fa-check-circle-o",
                        "fa-check-square",
                        "fa-check-square-o",
                        "fa-child",
                        "fa-circle",
                        "fa-circle-o",
                        "fa-circle-o-notch",
                        "fa-circle-thin",
                        "fa-clock-o",
                        "fa-clone",
                        "fa-close",
                        "fa-cloud",
                        "fa-cloud-download",
                        "fa-cloud-upload",
                        "fa-code",
                        "fa-code-fork",
                        "fa-coffee",
                        "fa-cog",
                        "fa-cogs",
                        "fa-comment",
                        "fa-comment-o",
                        "fa-commenting",
                        "fa-commenting-o",
                        "fa-comments",
                        "fa-comments-o",
                        "fa-compass",
                        "fa-copyright",
                        "fa-creative-commons",
                        "fa-credit-card",
                        "fa-credit-card-alt",
                        "fa-crop",
                        "fa-crosshairs",
                        "fa-cube",
                        "fa-cubes",
                        "fa-cutlery",
                        "fa-dashboard",
                        "fa-database",
                        "fa-deaf",
                        "fa-deafness",
                        "fa-desktop",
                        "fa-diamond",
                        "fa-dot-circle-o",
                        "fa-download",
                        "fa-drivers-license",
                        "fa-drivers-license-o",
                        "fa-edit",
                        "fa-ellipsis-h",
                        "fa-ellipsis-v",
                        "fa-envelope",
                        "fa-envelope-o",
                        "fa-envelope-open",
                        "fa-envelope-open-o",
                        "fa-envelope-square",
                        "fa-eraser",
                        "fa-exchange",
                        "fa-exclamation",
                        "fa-exclamation-circle",
                        "fa-exclamation-triangle",
                        "fa-external-link",
                        "fa-external-link-square",
                        "fa-eye",
                        "fa-eye-slash",
                        "fa-eyedropper",
                        "fa-fax",
                        "fa-feed",
                        "fa-female",
                        "fa-fighter-jet",
                        "fa-file-archive-o",
                        "fa-file-audio-o",
                        "fa-file-code-o",
                        "fa-file-excel-o",
                        "fa-file-image-o",
                        "fa-file-movie-o",
                        "fa-file-pdf-o",
                        "fa-file-photo-o",
                        "fa-file-picture-o",
                        "fa-file-powerpoint-o",
                        "fa-file-sound-o",
                        "fa-file-video-o",
                        "fa-file-word-o",
                        "fa-file-zip-o",
                        "fa-film",
                        "fa-filter",
                        "fa-fire",
                        "fa-fire-extinguisher",
                        "fa-flag",
                        "fa-flag-checkered",
                        "fa-flag-o",
                        "fa-flash",
                        "fa-flask",
                        "fa-folder",
                        "fa-folder-o",
                        "fa-folder-open",
                        "fa-folder-open-o",
                        "fa-frown-o",
                        "fa-futbol-o",
                        "fa-gamepad",
                        "fa-gavel",
                        "fa-gear",
                        "fa-gears",
                        "fa-gift",
                        "fa-glass",
                        "fa-globe",
                        "fa-graduation-cap",
                        "fa-group",
                        "fa-hand-grab-o",
                        "fa-hand-lizard-o",
                        "fa-hand-paper-o",
                        "fa-hand-peace-o",
                        "fa-hand-pointer-o",
                        "fa-hand-rock-o",
                        "fa-hand-scissors-o",
                        "fa-hand-spock-o",
                        "fa-hand-stop-o",
                        "fa-handshake-o",
                        "fa-hard-of-hearing",
                        "fa-hashtag",
                        "fa-hdd-o",
                        "fa-headphones",
                        "fa-heart",
                        "fa-heart-o",
                        "fa-heartbeat",
                        "fa-history",
                        "fa-home",
                        "fa-hotel",
                        "fa-hourglass",
                        "fa-hourglass-1",
                        "fa-hourglass-2",
                        "fa-hourglass-3",
                        "fa-hourglass-end",
                        "fa-hourglass-half",
                        "fa-hourglass-o",
                        "fa-hourglass-start",
                        "fa-i-cursor",
                        "fa-id-badge",
                        "fa-id-card",
                        "fa-id-card-o",
                        "fa-image",
                        "fa-inbox",
                        "fa-industry",
                        "fa-info",
                        "fa-info-circle",
                        "fa-institution",
                        "fa-key",
                        "fa-keyboard-o",
                        "fa-language",
                        "fa-laptop",
                        "fa-leaf",
                        "fa-legal",
                        "fa-lemon-o",
                        "fa-level-down",
                        "fa-level-up",
                        "fa-life-bouy",
                        "fa-life-buoy",
                        "fa-life-ring",
                        "fa-life-saver",
                        "fa-lightbulb-o",
                        "fa-line-chart",
                        "fa-location-arrow",
                        "fa-lock",
                        "fa-low-vision",
                        "fa-magic",
                        "fa-magnet",
                        "fa-mail-forward",
                        "fa-mail-reply",
                        "fa-mail-reply-all",
                        "fa-male",
                        "fa-map",
                        "fa-map-marker",
                        "fa-map-o",
                        "fa-map-pin",
                        "fa-map-signs",
                        "fa-meh-o",
                        "fa-microchip",
                        "fa-microphone",
                        "fa-microphone-slash",
                        "fa-minus",
                        "fa-minus-circle",
                        "fa-minus-square",
                        "fa-minus-square-o",
                        "fa-mobile",
                        "fa-mobile-phone",
                        "fa-money",
                        "fa-moon-o",
                        "fa-mortar-board",
                        "fa-motorcycle",
                        "fa-mouse-pointer",
                        "fa-music",
                        "fa-navicon",
                        "fa-newspaper-o",
                        "fa-object-group",
                        "fa-object-ungroup",
                        "fa-paint-brush",
                        "fa-paper-plane",
                        "fa-paper-plane-o",
                        "fa-paw",
                        "fa-pencil",
                        "fa-pencil-square",
                        "fa-pencil-square-o",
                        "fa-percent",
                        "fa-phone",
                        "fa-phone-square",
                        "fa-photo",
                        "fa-picture-o",
                        "fa-pie-chart",
                        "fa-plane",
                        "fa-plug",
                        "fa-plus",
                        "fa-plus-circle",
                        "fa-plus-square",
                        "fa-plus-square-o",
                        "fa-podcast",
                        "fa-power-off",
                        "fa-print",
                        "fa-puzzle-piece",
                        "fa-qrcode",
                        "fa-question",
                        "fa-question-circle",
                        "fa-question-circle-o",
                        "fa-quote-left",
                        "fa-quote-right",
                        "fa-random",
                        "fa-recycle",
                        "fa-refresh",
                        "fa-registered",
                        "fa-remove",
                        "fa-reorder",
                        "fa-reply",
                        "fa-reply-all",
                        "fa-retweet",
                        "fa-road",
                        "fa-rocket",
                        "fa-rss",
                        "fa-rss-square",
                        "fa-s15",
                        "fa-search",
                        "fa-search-minus",
                        "fa-search-plus",
                        "fa-send",
                        "fa-send-o",
                        "fa-server",
                        "fa-share",
                        "fa-share-alt",
                        "fa-share-alt-square",
                        "fa-share-square",
                        "fa-share-square-o",
                        "fa-shield",
                        "fa-ship",
                        "fa-shopping-bag",
                        "fa-shopping-basket",
                        "fa-shopping-cart",
                        "fa-shower",
                        "fa-sign-in",
                        "fa-sign-language",
                        "fa-sign-out",
                        "fa-signal",
                        "fa-signing",
                        "fa-sitemap",
                        "fa-sliders",
                        "fa-smile-o",
                        "fa-snowflake-o",
                        "fa-soccer-ball-o",
                        "fa-sort",
                        "fa-sort-alpha-asc",
                        "fa-sort-alpha-desc",
                        "fa-sort-amount-asc",
                        "fa-sort-amount-desc",
                        "fa-sort-asc",
                        "fa-sort-desc",
                        "fa-sort-down",
                        "fa-sort-numeric-asc",
                        "fa-sort-numeric-desc",
                        "fa-sort-up",
                        "fa-space-shuttle",
                        "fa-spinner",
                        "fa-spoon",
                        "fa-square",
                        "fa-square-o",
                        "fa-star",
                        "fa-star-half",
                        "fa-star-half-empty",
                        "fa-star-half-full",
                        "fa-star-half-o",
                        "fa-star-o",
                        "fa-sticky-note",
                        "fa-sticky-note-o",
                        "fa-street-view",
                        "fa-suitcase",
                        "fa-sun-o",
                        "fa-support",
                        "fa-tablet",
                        "fa-tachometer",
                        "fa-tag",
                        "fa-tags",
                        "fa-tasks",
                        "fa-taxi",
                        "fa-television",
                        "fa-terminal",
                        "fa-thermometer",
                        "fa-thermometer-0",
                        "fa-thermometer-1",
                        "fa-thermometer-2",
                        "fa-thermometer-3",
                        "fa-thermometer-4",
                        "fa-thermometer-empty",
                        "fa-thermometer-full",
                        "fa-thermometer-half",
                        "fa-thermometer-quarter",
                        "fa-thermometer-three-quarters",
                        "fa-thumb-tack",
                        "fa-thumbs-down",
                        "fa-thumbs-o-down",
                        "fa-thumbs-o-up",
                        "fa-thumbs-up",
                        "fa-ticket",
                        "fa-times",
                        "fa-times-circle",
                        "fa-times-circle-o",
                        "fa-times-rectangle",
                        "fa-times-rectangle-o",
                        "fa-tint",
                        "fa-toggle-down",
                        "fa-toggle-left",
                        "fa-toggle-off",
                        "fa-toggle-on",
                        "fa-toggle-right",
                        "fa-toggle-up",
                        "fa-trademark",
                        "fa-trash",
                        "fa-trash-o",
                        "fa-tree",
                        "fa-trophy",
                        "fa-truck",
                        "fa-tty",
                        "fa-tv",
                        "fa-umbrella",
                        "fa-universal-access",
                        "fa-university",
                        "fa-unlock",
                        "fa-unlock-alt",
                        "fa-unsorted",
                        "fa-upload",
                        "fa-user",
                        "fa-user-circle",
                        "fa-user-circle-o",
                        "fa-user-o",
                        "fa-user-plus",
                        "fa-user-secret",
                        "fa-user-times",
                        "fa-users",
                        "fa-vcard",
                        "fa-vcard-o",
                        "fa-video-camera",
                        "fa-volume-control-phone",
                        "fa-volume-down",
                        "fa-volume-off",
                        "fa-volume-up",
                        "fa-warning",
                        "fa-wheelchair",
                        "fa-wheelchair-alt",
                        "fa-wifi",
                        "fa-window-close",
                        "fa-window-close-o",
                        "fa-window-maximize",
                        "fa-window-minimize",
                        "fa-window-restore",
                        "fa-wrench",
                        "fa-american-sign-language-interpreting",
                        "fa-asl-interpreting",
                        "fa-assistive-listening-systems",
                        "fa-audio-description",
                        "fa-blind",
                        "fa-braille",
                        "fa-cc",
                        "fa-deaf",
                        "fa-deafness",
                        "fa-hard-of-hearing",
                        "fa-low-vision",
                        "fa-question-circle-o",
                        "fa-sign-language",
                        "fa-signing",
                        "fa-tty",
                        "fa-universal-access",
                        "fa-volume-control-phone",
                        "fa-wheelchair",
                        "fa-wheelchair-alt",
                        "fa-hand-grab-o",
                        "fa-hand-lizard-o",
                        "fa-hand-o-down",
                        "fa-hand-o-left",
                        "fa-hand-o-right",
                        "fa-hand-o-up",
                        "fa-hand-paper-o",
                        "fa-hand-peace-o",
                        "fa-hand-pointer-o",
                        "fa-hand-rock-o",
                        "fa-hand-scissors-o",
                        "fa-hand-spock-o",
                        "fa-hand-stop-o",
                        "fa-thumbs-down",
                        "fa-thumbs-o-down",
                        "fa-thumbs-o-up",
                        "fa-thumbs-up",
                        "fa-ambulance",
                        "fa-automobile",
                        "fa-bicycle",
                        "fa-bus",
                        "fa-cab",
                        "fa-car",
                        "fa-fighter-jet",
                        "fa-motorcycle",
                        "fa-plane",
                        "fa-rocket",
                        "fa-ship",
                        "fa-space-shuttle",
                        "fa-subway",
                        "fa-taxi",
                        "fa-train",
                        "fa-truck",
                        "fa-wheelchair",
                        "fa-wheelchair-alt",
                        "fa-genderless",
                        "fa-intersex",
                        "fa-mars",
                        "fa-mars-double",
                        "fa-mars-stroke",
                        "fa-mars-stroke-h",
                        "fa-mars-stroke-v",
                        "fa-mercury",
                        "fa-neuter",
                        "fa-transgender",
                        "fa-transgender-alt",
                        "fa-venus",
                        "fa-venus-double",
                        "fa-venus-mars",
                        "fa-file",
                        "fa-file-archive-o",
                        "fa-file-audio-o",
                        "fa-file-code-o",
                        "fa-file-excel-o",
                        "fa-file-image-o",
                        "fa-file-movie-o",
                        "fa-file-o",
                        "fa-file-pdf-o",
                        "fa-file-photo-o",
                        "fa-file-picture-o",
                        "fa-file-powerpoint-o",
                        "fa-file-sound-o",
                        "fa-file-text",
                        "fa-file-text-o",
                        "fa-file-video-o",
                        "fa-file-word-o",
                        "fa-file-zip-o",
                        "fa-circle-o-notch",
                        "fa-cog",
                        "fa-gear",
                        "fa-refresh",
                        "fa-spinner",
                        "fa-check-square",
                        "fa-check-square-o",
                        "fa-circle",
                        "fa-circle-o",
                        "fa-dot-circle-o",
                        "fa-minus-square",
                        "fa-minus-square-o",
                        "fa-plus-square",
                        "fa-plus-square-o",
                        "fa-square",
                        "fa-square-o",
                        "fa-cc-amex",
                        "fa-cc-diners-club",
                        "fa-cc-discover",
                        "fa-cc-jcb",
                        "fa-cc-mastercard",
                        "fa-cc-paypal",
                        "fa-cc-stripe",
                        "fa-cc-visa",
                        "fa-credit-card",
                        "fa-credit-card-alt",
                        "fa-google-wallet",
                        "fa-paypal",
                        "fa-area-chart",
                        "fa-bar-chart",
                        "fa-bar-chart-o",
                        "fa-line-chart",
                        "fa-pie-chart",
                        "fa-bitcoin",
                        "fa-btc",
                        "fa-cny",
                        "fa-dollar",
                        "fa-eur",
                        "fa-euro",
                        "fa-gbp",
                        "fa-gg",
                        "fa-gg-circle",
                        "fa-ils",
                        "fa-inr",
                        "fa-jpy",
                        "fa-krw",
                        "fa-money",
                        "fa-rmb",
                        "fa-rouble",
                        "fa-rub",
                        "fa-ruble",
                        "fa-rupee",
                        "fa-shekel",
                        "fa-sheqel",
                        "fa-try",
                        "fa-turkish-lira",
                        "fa-usd",
                        "fa-won",
                        "fa-yen",
                        "fa-align-center",
                        "fa-align-justify",
                        "fa-align-left",
                        "fa-align-right",
                        "fa-bold",
                        "fa-chain",
                        "fa-chain-broken",
                        "fa-clipboard",
                        "fa-columns",
                        "fa-copy",
                        "fa-cut",
                        "fa-dedent",
                        "fa-eraser",
                        "fa-file",
                        "fa-file-o",
                        "fa-file-text",
                        "fa-file-text-o",
                        "fa-files-o",
                        "fa-floppy-o",
                        "fa-font",
                        "fa-header",
                        "fa-indent",
                        "fa-italic",
                        "fa-link",
                        "fa-list",
                        "fa-list-alt",
                        "fa-list-ol",
                        "fa-list-ul",
                        "fa-outdent",
                        "fa-paperclip",
                        "fa-paragraph",
                        "fa-paste",
                        "fa-repeat",
                        "fa-rotate-left",
                        "fa-rotate-right",
                        "fa-save",
                        "fa-scissors",
                        "fa-strikethrough",
                        "fa-subscript",
                        "fa-superscript",
                        "fa-table",
                        "fa-text-height",
                        "fa-text-width",
                        "fa-th",
                        "fa-th-large",
                        "fa-th-list",
                        "fa-underline",
                        "fa-undo",
                        "fa-unlink",
                        "fa-angle-double-down",
                        "fa-angle-double-left",
                        "fa-angle-double-right",
                        "fa-angle-double-up",
                        "fa-angle-down",
                        "fa-angle-left",
                        "fa-angle-right",
                        "fa-angle-up",
                        "fa-arrow-circle-down",
                        "fa-arrow-circle-left",
                        "fa-arrow-circle-o-down",
                        "fa-arrow-circle-o-left",
                        "fa-arrow-circle-o-right",
                        "fa-arrow-circle-o-up",
                        "fa-arrow-circle-right",
                        "fa-arrow-circle-up",
                        "fa-arrow-down",
                        "fa-arrow-left",
                        "fa-arrow-right",
                        "fa-arrow-up",
                        "fa-arrows",
                        "fa-arrows-alt",
                        "fa-arrows-h",
                        "fa-arrows-v",
                        "fa-caret-down",
                        "fa-caret-left",
                        "fa-caret-right",
                        "fa-caret-square-o-down",
                        "fa-caret-square-o-left",
                        "fa-caret-square-o-right",
                        "fa-caret-square-o-up",
                        "fa-caret-up",
                        "fa-chevron-circle-down",
                        "fa-chevron-circle-left",
                        "fa-chevron-circle-right",
                        "fa-chevron-circle-up",
                        "fa-chevron-down",
                        "fa-chevron-left",
                        "fa-chevron-right",
                        "fa-chevron-up",
                        "fa-exchange",
                        "fa-hand-o-down",
                        "fa-hand-o-left",
                        "fa-hand-o-right",
                        "fa-hand-o-up",
                        "fa-long-arrow-down",
                        "fa-long-arrow-left",
                        "fa-long-arrow-right",
                        "fa-long-arrow-up",
                        "fa-toggle-down",
                        "fa-toggle-left",
                        "fa-toggle-right",
                        "fa-toggle-up",
                        "fa-arrows-alt",
                        "fa-backward",
                        "fa-compress",
                        "fa-eject",
                        "fa-expand",
                        "fa-fast-backward",
                        "fa-fast-forward",
                        "fa-forward",
                        "fa-pause",
                        "fa-pause-circle",
                        "fa-pause-circle-o",
                        "fa-play",
                        "fa-play-circle",
                        "fa-play-circle-o",
                        "fa-random",
                        "fa-step-backward",
                        "fa-step-forward",
                        "fa-stop",
                        "fa-stop-circle",
                        "fa-stop-circle-o",
                        "fa-youtube-play",
                        "fa-500px",
                        "fa-adn",
                        "fa-amazon",
                        "fa-android",
                        "fa-angellist",
                        "fa-apple",
                        "fa-bandcamp",
                        "fa-behance",
                        "fa-behance-square",
                        "fa-bitbucket",
                        "fa-bitbucket-square",
                        "fa-bitcoin",
                        "fa-black-tie",
                        "fa-bluetooth",
                        "fa-bluetooth-b",
                        "fa-btc",
                        "fa-buysellads",
                        "fa-cc-amex",
                        "fa-cc-diners-club",
                        "fa-cc-discover",
                        "fa-cc-jcb",
                        "fa-cc-mastercard",
                        "fa-cc-paypal",
                        "fa-cc-stripe",
                        "fa-cc-visa",
                        "fa-chrome",
                        "fa-codepen",
                        "fa-codiepie",
                        "fa-connectdevelop",
                        "fa-contao",
                        "fa-css3",
                        "fa-dashcube",
                        "fa-delicious",
                        "fa-deviantart",
                        "fa-digg",
                        "fa-dribbble",
                        "fa-dropbox",
                        "fa-drupal",
                        "fa-edge",
                        "fa-eercast",
                        "fa-empire",
                        "fa-envira",
                        "fa-etsy",
                        "fa-expeditedssl",
                        "fa-fa",
                        "fa-facebook",
                        "fa-facebook-f",
                        "fa-facebook-official",
                        "fa-facebook-square",
                        "fa-firefox",
                        "fa-first-order",
                        "fa-flickr",
                        "fa-font-awesome",
                        "fa-fonticons",
                        "fa-fort-awesome",
                        "fa-forumbee",
                        "fa-foursquare",
                        "fa-free-code-camp",
                        "fa-ge",
                        "fa-get-pocket",
                        "fa-gg",
                        "fa-gg-circle",
                        "fa-git",
                        "fa-git-square",
                        "fa-github",
                        "fa-github-alt",
                        "fa-github-square",
                        "fa-gitlab",
                        "fa-gittip",
                        "fa-glide",
                        "fa-glide-g",
                        "fa-google",
                        "fa-google-plus",
                        "fa-google-plus-circle",
                        "fa-google-plus-official",
                        "fa-google-plus-square",
                        "fa-google-wallet",
                        "fa-gratipay",
                        "fa-grav",
                        "fa-hacker-news",
                        "fa-houzz",
                        "fa-html5",
                        "fa-imdb",
                        "fa-instagram",
                        "fa-internet-explorer",
                        "fa-ioxhost",
                        "fa-joomla",
                        "fa-jsfiddle",
                        "fa-lastfm",
                        "fa-lastfm-square",
                        "fa-leanpub",
                        "fa-linkedin",
                        "fa-linkedin-square",
                        "fa-linode",
                        "fa-linux",
                        "fa-maxcdn",
                        "fa-meanpath",
                        "fa-medium",
                        "fa-meetup",
                        "fa-mixcloud",
                        "fa-modx",
                        "fa-odnoklassniki",
                        "fa-odnoklassniki-square",
                        "fa-opencart",
                        "fa-openid",
                        "fa-opera",
                        "fa-optin-monster",
                        "fa-pagelines",
                        "fa-paypal",
                        "fa-pied-piper",
                        "fa-pied-piper-alt",
                        "fa-pied-piper-pp",
                        "fa-pinterest",
                        "fa-pinterest-p",
                        "fa-pinterest-square",
                        "fa-product-hunt",
                        "fa-qq",
                        "fa-quora",
                        "fa-ra",
                        "fa-ravelry",
                        "fa-rebel",
                        "fa-reddit",
                        "fa-reddit-alien",
                        "fa-reddit-square",
                        "fa-renren",
                        "fa-resistance",
                        "fa-safari",
                        "fa-scribd",
                        "fa-sellsy",
                        "fa-share-alt",
                        "fa-share-alt-square",
                        "fa-shirtsinbulk",
                        "fa-simplybuilt",
                        "fa-skyatlas",
                        "fa-skype",
                        "fa-slack",
                        "fa-slideshare",
                        "fa-snapchat",
                        "fa-snapchat-ghost",
                        "fa-snapchat-square",
                        "fa-soundcloud",
                        "fa-spotify",
                        "fa-stack-exchange",
                        "fa-stack-overflow",
                        "fa-steam",
                        "fa-steam-square",
                        "fa-stumbleupon",
                        "fa-stumbleupon-circle",
                        "fa-superpowers",
                        "fa-telegram",
                        "fa-tencent-weibo",
                        "fa-themeisle",
                        "fa-trello",
                        "fa-tripadvisor",
                        "fa-tumblr",
                        "fa-tumblr-square",
                        "fa-twitch",
                        "fa-twitter",
                        "fa-twitter-square",
                        "fa-usb",
                        "fa-viacoin",
                        "fa-viadeo",
                        "fa-viadeo-square",
                        "fa-vimeo",
                        "fa-vimeo-square",
                        "fa-vine",
                        "fa-vk",
                        "fa-wechat",
                        "fa-weibo",
                        "fa-weixin",
                        "fa-whatsapp",
                        "fa-wikipedia-w",
                        "fa-windows",
                        "fa-wordpress",
                        "fa-wpbeginner",
                        "fa-wpexplorer",
                        "fa-wpforms",
                        "fa-xing",
                        "fa-xing-square",
                        "fa-y-combinator",
                        "fa-y-combinator-square",
                        "fa-yahoo",
                        "fa-yc",
                        "fa-yc-square",
                        "fa-yelp",
                        "fa-yoast",
                        "fa-youtube",
                        "fa-youtube-play",
                        "fa-youtube-square",
                        "fa-ambulance",
                        "fa-h-square",
                        "fa-heart",
                        "fa-heart-o",
                        "fa-heartbeat",
                        "fa-hospital-o",
                        "fa-medkit",
                        "fa-plus-square",
                        "fa-stethoscope",
                        "fa-user-md",
                        "fa-wheelchair",
                        "fa-wheelchair-alt"
                    ];
                },
                allClass: function () {
                    var layuiIconArr = this.layuiIcon(), awesomeIconArr = this.awesomeIcon();
                    layuiIconArr.push.apply(layuiIconArr, awesomeIconArr);
                    return layuiIconArr;
                }
            }
        };

        a.init();
        return new IconPicker();
    };

    /**
     * 选中图标
     * @param filter lay-filter
     * @param iconName 图标名称
     * @param type 图标类型，layuiIcon/layuiIconUnicode/awesomeIcon/allClass
     */
    IconPicker.prototype.checkIcon = function (filter, iconName, type) {
        var el = $('*[lay-filter=' + filter + ']'), c;

        if (type === 'layuiIcon') {
            var p = el.next().find('.layui-iconpicker-item .layui-icon');
            c = 'layui-icon ' + iconName;
            p.html('').attr('class', c);
        } else if (type === 'layuiIconUnicode') {
            var p = el.next().find('.layui-iconpicker-item .layui-icon');
            c = iconName;
            p.html(c);
        } else if (type === 'awesomeIcon') {
            var p = el.next().find('.layui-iconpicker-item .fa');
            c = 'fa ' + iconName;
            p.html('').attr('class', c);
        } else if (type === 'allClass') {
            var p1 = el.next().find('.layui-iconpicker-item .layui-icon'), p2 = el.next().find('.layui-iconpicker-item .fa'), p;
            p = p1.length > 0 ? p1 : p2;
            if (iconName.indexOf('layui-icon-') === 0) {
                c = 'layui-icon ' + iconName;
            } else if (iconName.indexOf('fa-') === 0) {
                c = 'fa ' + iconName;
            }
            p.html('').attr('class', c);
        }

        el.attr('value', c).val(c);
    };

    var iconPicker = new IconPicker();
    exports(_MOD, iconPicker);
});