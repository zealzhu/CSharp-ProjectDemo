//判断是否纯数字或者控制键
function isNumber(e) {
    e = e || window.event;      //浏览器兼容
    var reg = /[0-9]/;            //正则纯数字，等同于var reg = new RegExp(/[0-9]/);
    return reg.test(e.key)
        || e.keyCode == 8   //BackSpace 8
        || e.keyCode == 46  //Delete 46
        || e.keyCode == 35  //End 35
        || e.keyCode == 36  //Home 36
        || e.keyCode == 37  //Left Arrow 37
        || e.keyCode == 38  //Up Arrow 38
        || e.keyCode == 39  //Right Arrow 39
        || e.keyCode == 40  //Down Arrow 40
        || e.keyCode == 45; //Insert 45
}

//判断粘贴是否纯数字
function isPasteNumber(e) {
    e = e || window.event;

    //浏览器兼容
    //IE浏览器   window.clipboardData
    //FireFox、Chrome   e.clipboardData
    //获取剪贴板
    var clipboardData = e.clipboardData || window.clipboardData;

    //获取剪切板中保存的数据    text表示以文本的方式获取
    var txt = clipboardData.getData('text');
    var reg = /^\d+$/;//纯数字

    return reg.test(txt);
}