//JQuery窗口加载时调用，类似onload,可以多次使用，不会覆盖1
$(function () {
    //绑定验证码单击事件，刷新验证码
    $('#imgCaptcha').click(function () {
        $(this).attr('src', '/Captcha/CaptchaHandler.ashx?r=' + Math.random());
    });
});

//登录函数
function login() {
    //非空验证
    if (!checkLoginInfo())
        return false;

    //通过验证隐藏
    $('.tip').css({
        display: 'none'
    });
    $('.tip').html('');

    //用md5对密码加密并转换为大写
    var pwd = hex_md5($('#txtPwd').val()).toUpperCase();
    //转换成json格式
    var postData = {
        UserName: $('#txtUid').val(),
        Password: pwd,
        Captcha: $('#txtCaptcha').val(),
        IsAutoLogin: $('#chkAutoLogin').get(0).checked,
    };

    //发送Ajax请求
    $.ajax({
        url: '/ajax/LoginHandler.ashx',
        type: 'post',
        dataType: 'json',
        data: postData,
        success: function (data) {
            if (data.Status != 0) {                 //登录失败
                $('.tip').css('display', 'inline'); //显示错误信息
                $('.tip').html(data.Msg);
                //刷新验证码
                $('#imgCaptcha').attr('src', '/Captcha/CaptchaHandler.ashx?r=' + Math.random());
            }
            else {                                  //登录成功跳转
                window.location.href = '/Index.aspx';
            }
        },
    })
}

//验证输入项
function checkLoginInfo() {
    var flag = true;   //验证是否通过
    var msg = "";       //错误消息

    //验证是否输入用户名
    if ($('#txtUid').val() == "") {
        flag = false;
        msg = "请输入用户名";
    }
    //验证是否输入密码
    if ($('#txtPwd').val() == "") {
        flag = false;
        msg = "请输入密码";
    }
    //验证是否输入验证码
    if ($('#txtCaptcha').val() == "") {
        flag = false;
        msg = "请输入验证码";
    }
    //验证不通过显示提示消息
    if (!flag) {
        $('.tip').css({         //显示
            display: 'inline'
        });
        $('.tip').html(msg);
    }

    return flag;
}
