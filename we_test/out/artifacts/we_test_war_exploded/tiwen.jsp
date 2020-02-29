<%--
  Created by IntelliJ IDEA.
  User: hongda01
  Date: 2020/2/18
  Time: 9:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>体温采集</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0,viewport-fit=cover">
    <link rel="stylesheet" href="./weui.css"/>
    <link rel="stylesheet" href="./example.css"/>
    <script src="./js/jquery-1.7.2.min.js"></script>
    <script>
        if (!localStorage.getItem("yhxx")) {

            window.location.href = 'login.jsp';
        }

        function doBack() {
            localStorage.clear();
            window.location.href = 'login.jsp';
        }

        function doSubmit() {
            var yh = localStorage.getItem("yhxx");
            yh = JSON.parse(yh);
            //console.log(yh);
            var ryxlh = yh.rows[0].ryxlh;
            var dwxlh = yh.rows[0].dwxlh;
            //var sj = document.getElementById("sj").value;
            var tw = document.getElementById("tw").value;
            console.log(tw/10);
            tw = tw/10;
            //var pl = document.getElementById("pl").value;
            //var b = JSON.stringify(data);
            //alert(dwxlh);
            var tn = {"ryxlh": ryxlh, "dwxlh": dwxlh, "tw": tw};
            var st = JSON.stringify(tn);
            var data = {"data": st};
            var reg = new RegExp("^(((3[5-9]|3[5-9]\.\[0-9])?)|((4[0-2]|4[0-1]\.\[0-9])?))$");

            if (tw == "") {
                alert("请正确输入体温！")
                return;
            } else if (!reg.test(tw)) {
                alert("请正确输入体温！")
                return;
            } else {
                /*http://192.168.5.233:8080/G.jsp
                 http://202.111.188.120:88/G.jsp*/
                //alert(ryxlh);
                $.post("http://192.168.5.233:8080/login/SFtw.jsp", data).success(function (a) {
                    a = JSON.parse(a);
                    if (a.d) {
                        //alert(a.d);
                        window.location.href = 'success.jsp';
                    } else {
                        window.location.href = 'error.jsp';
                    }
                });

            }


        }

        function t() {
            /*http://192.168.5.233:8080/G.jsp
                 http://202.111.188.120:88/G.jsp*/
            window.location.href = 'http://192.168.5.233:8080/Tw';
        }


    </script>
    <style type="text/css">
        ul,li{
            list-style: none;
        }
        .password-div input{
            width: 1px;
            height: 1px;
            opacity: 0;
            border: 0;
        }
        .password-lable{
            height: 30px;
            clear: both;
        }
        .password-lable li{
            float: left;
            width: 30px;
            height: 30px;
            line-height: 30px;
            text-align: center;
            border: 1px solid #dedede;
            margin-left: -1px;
        }

    </style>
</head>
<body>

<form>
    <div class="weui-cell" style="height: 100px">
        <div class="weui-cell__hd"></div>
        <div class="weui-cell__bd">
        </div>
    </div>
    <div class="weui-form__text-area">
        <h2 class="weui-form__title">请填写当前体温</h2>
    </div>
    <div style="height: 30px">

    </div>

    <div class="weui-cell">


        <div class="weui-cell__bd">
            <%--                <input forsave=1 id="tw" class="weui-input" placeholder="如：36.5" type="number" pattern="[0-9]*."/>--%>
                <div class="password-div" >
                    <label for="tw" class="password-lable" >
                        <ul >
                            <li></li>
                            <li></li>
                            <li></li>
                        </ul>
                        <input id="tw" type="text" name="password" maxlength="3">
                    </label>
                </div>
                <div  style="font-size:xx-large" id="a"></div>
            <%--<input forsave=1 id="tw" class="weui-input" style="font-size:xx-large" maxlength="3" onkeyup="this.value=this.value.replace(/\D/g,'')"/>--%>
        </div>

    </div>
    <input type="hidden" id="ryxlh" value="" labelText="人物主键">
    <input type="hidden" id="dwxlh" value="" labelText="单位主键">
    <input type="hidden" id="sj" value="" labelText="当前日期">
    <%--<input type="hidden"  id="pl" value="" labelText="频率">&lt;%&ndash;采之前先判断当前日期，再判断频率，如果是1，&ndash;%&gt;--%>

    <div class="page__bd page__bd_spacing">
        <div class="button-sp-area">
            <input type="button" value="立即提交" class="weui-btn weui-btn_primary" onclick="doSubmit()">

        </div>

    </div>
    <div class="weui-cell" style="height: 150px">
        <div class="weui-cell__hd"></div>
        <div class="weui-cell__bd">
        </div>
    </div>
    <div class="page__bd page__bd_spacing" style="float: right">
        <div class="button-sp-area">
            <input type="button" value="退出登录" class="weui-btn weui-btn_mini weui-btn_primary" onclick="doBack()">
        </div>

    </div>

</form>

</body>
<script>
    $(".password-div input").on("input", function (e) { //标签为password-div下的input添加oninput事件
        var number = 3;   //定义输入最大值
        var pw = $("input[name = 'password']").val(); //定义pw为name是password的input框的输入值
        var list = $(".password-div ul li");  //定义list是li
        $("#a").empty();
        pw = pw.replace(/\D/g, "")
        $("input[name = 'password']").val(pw);
        $("#a").append(pw.replace(/(\d\d)(\d)/g, "体温：$1.$2℃"));
        for (var i = 0; i < number; i++) {    //for循环遍历将·放入li标签
            console.log(pw);
            if (pw[i]) {

                $(list[i]).text(pw[i]);

            } else {
                $(list[i]).text("");
            }
        }
    });
    $(".password-div ul").click(function () {
        $("input[name = 'password']").val("");
        $("#password").focus();
        $(".password-div ul li").text("");
    });
</script>
</html>
