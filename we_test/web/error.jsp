<%--
  Created by IntelliJ IDEA.
  User: hongda01
  Date: 2020/2/18
  Time: 11:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0,viewport-fit=cover">
    <link rel="stylesheet" href="./weui.css"/>
    <link rel="stylesheet" href="./example.css"/>
    <title>出错</title>
    <script>
        function doSubmit() {
            //window.open("","_self").close();
            WeixinJSBridge.invoke("closeWindow",{},function(e){});
            document.addEventListener('WeixinJSBridgeReady', function(){ WeixinJSBridge.call('closeWindow'); }, false);
        }
        function doErr() {
            window.location.href = 'login.jsp';
        }
    </script>
</head>
<body>
<div class="page__bd page__bd_spacing">
    <div class="icon-box">
        <i class="weui-icon-warn weui-icon_msg"></i>
        <div class="icon-box__ctn">
            <h3 class="icon-box__title">警告</h3>
            <p class="icon-box__desc">操作未成功！请返回！</p>
        </div>
    </div>
</div>
<div class="page__bd page__bd_spacing">
    <div class="button-sp-area">
        <input type="button" value="关闭"  class="weui-btn weui-btn_primary" onclick="doSubmit()">
    </div>
</div>
</body>
</html>
