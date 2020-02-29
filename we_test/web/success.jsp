<%--
  Created by IntelliJ IDEA.
  User: hongda01
  Date: 2020/2/18
  Time: 11:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0,viewport-fit=cover">
    <title>提交成功</title>
    <link rel="stylesheet" href="./weui.css"/>
    <link rel="stylesheet" href="./example.css"/>
    <script>
        function doBack(){
            window.history.back();

        }
        function doSubmit() {
            //window.open("","_self").close();
            WeixinJSBridge.invoke("closeWindow",{},function(e){});
            document.addEventListener('WeixinJSBridgeReady', function(){ WeixinJSBridge.call('closeWindow'); }, false);
        }
        function close_page() {
            var userAgent = navigator.userAgent;
            if (userAgent.indexOf("Firefox") != -1 || userAgent.indexOf("Chrome") !=-1) {
                window.history.back();
                window.close();
            }else if(userAgent.indexOf('Android') > -1 || userAgent.indexOf('Linux') > -1){
                window.history.back();
                window.close();
            }else {
                window.opener = null;
                window.close();
            }
        }
    </script>
</head>
<body>
<div class="page__bd page__bd_spacing">
    <div class="icon-box">
        <i class="weui-icon-success weui-icon_msg"></i>
        <div class="icon-box__ctn">
            <h3 class="icon-box__title">成功</h3>
            <p class="icon-box__desc">操作成功！请点击确定后继续登陆操作！</p>
        </div>
    </div>
</div>
<div class="page__bd page__bd_spacing">
    <div class="button-sp-area">
        <input type="button" value="确定"  class="weui-btn weui-btn_primary" onclick="doSubmit()">
    </div>
</div>
</body>
</html>
