<%--
  Created by IntelliJ IDEA.
  User: hongda01
  Date: 2020/2/18
  Time: 10:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0,viewport-fit=cover">
    <title>登陆</title>
    <link rel="stylesheet" href="./weui.css"/>
    <link rel="stylesheet" href="./example.css"/>
    <script src="./js/jquery-1.7.2.min.js"></script>
    <script>

           if(localStorage.getItem("yhxx")) {

               window.location.href = 'tiwen.jsp';
           }

        function doLogin(){
            var yhm = document.getElementById("yhm").value;
            var mm = document.getElementById("mm").value.replace(/\s/g,"");//把空格替换成空
            var tn = {"tn":"Yhxx","tj":"yhm = '"+yhm+"' and mm = '"+mm+"'"};
            var st = JSON.stringify(tn);

            var  data = {"data":st};
            /*http://192.168.5.233:8080/G.jsp
                 http://202.111.188.120:88/G.jsp*/
            $.post("http://202.111.188.120:88/G.jsp",data).success(function (a){
                var b;
                b = JSON.parse(a);
                console.log(b.rows);
                if(b.rows.length == 1){

                    localStorage.setItem("yhxx",a);
                    window.location.href = 'tiwen.jsp';
                }else{
                    alert("用户名或密码不正确，请重新输入");
                }
            });

        }
        function doReg(){
            window.location.href = 'yuangong.jsp';
        }
        function tt() {
            /*http://192.168.5.233:8080/G.jsp
                 http://202.111.188.120:88/G.jsp*/
            window.location.href = 'http://202.111.188.120:88/Tw';
        }
    </script>
</head>
<body>
    <form>
        <div class="weui-cell" style="height: 100px">
            <div class="weui-cell__hd"></div>
            <div class="weui-cell__bd">
            </div>
        </div>

        <div class="weui-form__text-area">
            <h2 class="weui-form__title">用户登陆</h2>
        </div>
        <div class="weui-cell">
            <div class="weui-cell__hd"><label class="weui-label">手机号：</label></div>
            <div class="weui-cell__bd">
                <input id="yhm" class="weui-input" placeholder="请输入手机号"/>
            </div>
        </div>
        <div class="weui-cell">
            <div class="weui-cell__hd"><label class="weui-label">密码：</label></div>
            <div class="weui-cell__bd">
                <input id="mm" class="weui-input" type="password" placeholder="请输入密码，初始密码000" />
            </div>
        </div>
        <div class="page__bd page__bd_spacing">
            <div class="button-sp-area">
                <input type="button" value="登陆"  class="weui-btn weui-btn_primary" onclick="doLogin()">
                <div class="weui-cell" style="height: 10px">
                    <div class="weui-cell__hd"></div>
                    <div class="weui-cell__bd">
                    </div>
                </div>
                <input type="button" value="注册"  class="weui-btn weui-btn_primary" onclick="doReg()">
               <%-- <input type="button" value="体温"  class="weui-btn weui-btn_primary" onclick="tt()">--%>



            </div>
        </div>



    </form>

</body>

</html>

