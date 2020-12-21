/**
 * 自定义表单验证
 *
 * @description    绑定附加属性说明
 *    lay-data-length    指定输入内容的长度，不绑定则表示任意长度，lay-data-length="6"表示固定长度6，lay-data-length="0-6"表示长度在0到6之间
 *    lay-null-msg    当表单元素值为空时的提示信息，不绑定，默认提示"必填项不能为空"
 *    lay-error-msg    输入内容不能通过验证时的提示信息，默认提示"请输入正确信息"
 *    lay-ignore    绑定了lay-ignore="ignore"的表单元素，在有输入时，会验证所填数据是否符合所指定数据类型，没有填写内容时则会忽略对它的验证
 *    lay-recheck    检查两次密码输入是否一致时使用，用来指定需要比较的另外一个表单元素。如：lay-recheck="password1"，那么它就会拿当前元素的值跟该表单下，name为"password1"的元素比较
 *    lay-integer-digits    检验浮点数时整数部分的位数，lay-integer-digits="6"表示固定长度6，lay-integer-digits="1-6"表示长度在1到6之间
 *    lay-fraction-digits    检验浮点数时小数部分的位数，lay-fraction-digits="2"表示固定长度2，lay-fraction-digits="1-2"表示长度在1到2之间
 *    lay-range-min    检验数字的最小值
 *    lay-range-max    检验数字的最大值
 *    lay-separator    检验输入内容是否以指定的分隔符分隔
 *
 * @name    verify.js
 * @author    Chanus
 * @date    20180509
 * @version    1.0.0
 */
;
layui.config({
    base: '../js/',
    version: '1.0.0'
}).use(['form'], function () {
    var $ = layui.jquery, form = layui.form;

    form.verify({
        // 校验必填项
        required: function (value, item) {
            var r = verify.validate(value, item, 'required');
            if (r !== true) return r;
        },
        // 校验密码
        password: function (value, item) {
            var r = verify.validate(value, item, 'password');
            if (r !== true) return r;

            if (!verify.isNull($(item).attr('lay-recheck')) && value !== $('input[name="' + $(item).attr('lay-recheck') + '"]').val())
                return '两次输入的密码不一致';
        },
        // 校验单选按钮必选
        mustradio: function (value, item) {
            if (verify.isNull($('input[name="' + $(item).attr('name') + '"]:checked').val()))
                return verify.nullMsg(item, '单选按钮必选');
        },
        // 校验复选框必选
        mustcheckbox: function (value, item) {
            if (verify.isNull($('input[name="' + $(item).attr('name') + '"]:checked').val()))
                return verify.nullMsg(item, '复选框必选');
        },
        mustcheckboxlike: function (value, item) {
            if (verify.isNull($('input[name^="' + $(item).attr('checkname') + '"]:checked').val()))
                return verify.nullMsg(item, '复选框必选');
        },
        // 校验手机号码(大陆)
        phone: function (value, item) {
            var r = verify.validate(value, item, 'phone');
            if (r !== true) return r;
        },
        // 校验电子邮箱
        email: function (value, item) {
            var r = verify.validate(value, item, 'email');
            if (r !== true) return r;
        },
        // 校验URL链接
        url: function (value, item) { // value：表单的值、item：表单的DOM对象
            var r = verify.validate(value, item, 'url');
            if (r !== true) return r;
        },
        // 校验数字，允许正数、负数、整数、浮点数
        number: function (value, item) {
            var r = verify.validate(value, item, 'number');
            if (r !== true) return r;
            var s = verify.checkNumberDigits(value, item);
            if (s !== true) return s;
        },
        // 校验数字，允许正数、正整数、正浮点数
        pnumber: function (value, item) {
            var r = verify.validate(value, item, 'pnumber');
            if (r !== true) return r;
            var s = verify.checkNumberDigits(value, item);
            if (s !== true) return s;
        },
        // 校验数字，允许负数、负整数、负浮点数
        nnumber: function (value, item) {
            var r = verify.validate(value, item, 'nnumber');
            if (r !== true) return r;
            var s = verify.checkNumberDigits(value, item);
            if (s !== true) return s;
        },
        // 校验数字，允许整数
        integer: function (value, item) {
            var r = verify.validate(value, item, 'integer');
            if (r !== true) return r;
            var s = verify.checkNumberDigits(value, item);
            if (s !== true) return s;
        },
        // 校验数字，允许0和正整数
        pinteger: function (value, item) {
            var r = verify.validate(value, item, 'pinteger');
            if (r !== true) return r;
            var s = verify.checkNumberDigits(value, item);
            if (s !== true) return s;
        },
        // 校验数字，允许0和负整数
        ninteger: function (value, item) {
            var r = verify.validate(value, item, 'ninteger');
            if (r !== true) return r;
            var s = verify.checkNumberDigits(value, item);
            if (s !== true) return s;
        },
        // 校验数字字符串
        digit: function (value, item) {
            var r = verify.validate(value, item, 'digit');
            if (r !== true) return r;
        },
        // 校验字符[A-Za-z]
        letter: function (value, item) {
            var r = verify.validate(value, item, 'letter');
            if (r !== true) return r;
        },
        // 校验字符下划线[A-Za-z_]
        letterline: function (value, item) {
            var r = verify.validate(value, item, 'letterline');
            if (r !== true) return r;
        },
        // 校验字符数字线[A-Za-z0-9]
        letternum: function (value, item) {
            var r = verify.validate(value, item, 'letternum');
            if (r !== true) return r;
        },
        // 校验字符数字下划线[A-Za-z0-9_]
        letternumline: function (value, item) {
            var r = verify.validate(value, item, 'letternumline');
            if (r !== true) return r;
        },
        // 校验日期yyyy-MM-dd
        date: function (value, item) {
            var r = verify.validate(value, item, 'date');
            if (r !== true) return r;
        },
        // 校验身份证号码
        identity: function (value, item) {
            var r = verify.validate(value, item, 'identity');
            if (r !== true) return r;
        }
    });

    var config = {
        required: [/[\S]+/],
        password: [/[\S]+/],
        phone: [/^1\d{10}$/, '请输入手机号', '请输入正确的手机号'],
        email: [/^([a-zA-Z0-9_.\-])+@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/, '请输入邮箱账号', '邮箱格式不正确'],
        url: [/(^#)|(^http(s*):\/\/[^\s]+\.[^\s]+)/, '请输入链接地址', '链接格式不正确'],
        number: [/^([+|-]?0|([+|-]?0\.\d+)|^([+|-]?[1-9]\d*(\.\d+)?))$/, '请填写数值', '数值格式不正确'],
        pnumber: [/^(0|0.\d+|[1-9]\d*(\.\d+)?)$/, '请填写数值', '数值格式不正确'],
        nnumber: [/^-\d+(\.\d+)?$/, '请填写数值', '数值格式不正确'],
        integer: [/^(0|-?[1-9][0-9]*)$/, '请填写数字', '数字格式不正确'],
        pinteger: [/^(0|[1-9][0-9]*)$/, '请填写数字', '数字格式不正确'],
        ninteger: [/^(0|-[1-9][0-9]*)$/, '请填写数字', '数字格式不正确'],
        digit: [/^\d+$/, '请填写数字', '数字格式不正确'],
        letter: [/^[A-Za-z]+$/],
        letterline: [/^[A-Za-z_]+$/],
        letternum: [/^[A-Za-z0-9]+$/],
        letternumline: [/^\w+$/],
        date: [/^(\d{4})[-\/](\d{1}|0\d{1}|1[0-2])([-\/](\d{1}|0\d{1}|[1-2][0-9]|3[0-1]))*$/, '请输入日期', '日期格式不正确'],
        identity: [/(^\d{15}$)|(^\d{17}(x|X|\d)$)/, '请输入身份证号', '请输入正确的身份证号']
    };

    var verify = {
        defaultNullMsg: '必填项不能为空',
        defaultErrorMsg: '请输入正确信息',
        isNull: function (value) {
            return value === null || value === '' || value === undefined;
        },
        checkDataLength: function (value, item) {
            var dataLength = $(item).attr('lay-data-length');
            if (!verify.isNull(dataLength)) {
                var lens = dataLength.split('-');
                return lens[1] === undefined ? (value.length === parseInt(lens[0])) : (value.length >= parseInt(lens[0]) && value.length <= parseInt(lens[1]));
            }
            return true;
        },
        checkNumberDigits: function (value, item) {
            // 验证数字范围
            var min = Number($(item).attr('lay-range-min'));// 最小值
            if (Number(value) < min)
                return verify.errorMsg(item, '数值不能小于' + min);

            var max = Number($(item).attr('lay-range-max'));// 最大值
            if (Number(value) > max)
                return verify.errorMsg(item, '数值不能大于' + max);

            var b = true, v = value.split('.');
            var i = v[0], f = v[1];

            var integerDigits = $(item).attr('lay-integer-digits');// 整数部分位数
            if (!verify.isNull(integerDigits)) {
                var digits = integerDigits.split('-');
                b = digits[1] === undefined ? (i.length === parseInt(digits[0])) : (i.length >= parseInt(digits[0]) && i.length <= parseInt(digits[1]));
            }
            if (!b)
                return verify.errorMsg(item, '数值格式不正确');
            var fractionDigits = $(item).attr('lay-fraction-digits');// 小数部分位数
            if (!verify.isNull(fractionDigits)) {
                var digits = fractionDigits.split('-');
                var len = verify.isNull(f) ? 0 : f.length;
                b = digits[1] === undefined ? (len === parseInt(digits[0])) : (len >= parseInt(digits[0]) && len <= parseInt(digits[1]));
            }
            return b ? true : verify.errorMsg(item, '数值格式不正确');
        },
        nullMsg: function (item, msg) {
            return verify.isNull($(item).attr('lay-null-msg')) ? (msg ? msg : verify.defaultNullMsg) : $(item).attr('lay-null-msg');
        },
        errorMsg: function (item, msg) {
            return verify.isNull($(item).attr('lay-error-msg')) ? (msg ? msg : verify.defaultErrorMsg) : $(item).attr('lay-error-msg');
        },
        ignore: function (item) {
            return !($(item).attr('lay-ignore') === undefined);
        },
        separator: function (item) {
            return $(item).attr('lay-separator') === undefined ? null : $(item).attr('lay-separator');
        },
        validate: function (value, item, _verify) {
            if (verify.isNull(value)) {
                return verify.ignore(item) ? true : verify.nullMsg(item, config[_verify][1]);
            } else {
                var _separator = verify.separator(item);
                if (verify.isNull(_separator)) {
                    return (config[_verify][0].test(value) && verify.checkDataLength(value, item)) ? true : verify.errorMsg(item, config[_verify][2]);
                } else {
                    var v = value.split(_separator), b = true;
                    $.each(v, function (i) {
                        if (!(config[_verify][0].test(v[i]) && verify.checkDataLength(v[i], item))) {
                            b = false;
                            return false;
                        }
                    });
                    return b ? true : verify.errorMsg(item, config[_verify][2]);
                }
            }
        }
    };
});