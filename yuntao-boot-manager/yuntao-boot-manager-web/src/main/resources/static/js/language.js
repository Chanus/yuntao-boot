/* 设置语言类型：默认为中文 */
var i18nLanguage = "zh_CN";

/* 获取 cookie 中的语言类型，cookie 名称为 lang */
var initI18nLanguage = function () {
    if (document.cookie && document.cookie !== '') {
        var cookies = document.cookie.split('; ');
        for (var i = 0; i < cookies.length; i++) {
            if (cookies[i].substring(0, 5) === 'lang=') {
                i18nLanguage = cookies[i].substring(5);
                break;
            }
        }
    }
}

/* 初始化 i18n */
var initI18n = function () {
    initI18nLanguage();

    $.i18n.properties({// 加载资浏览器语言对应的资源文件
        name: 'message', // 资源文件名称
        language: i18nLanguage, // 语言
        path: ctx + 'i18n/', // 资源文件路径
        mode: 'map' // 用 Map 的方式使用资源文件中的值
    });
}

/* 页面加载完成后执行 */
$(function () {
    initI18n();
});