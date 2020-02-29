<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html style="width: 100%;height: 100%">
<head>
    <meta charset="UTF-8">
    <title>支付密码输入框</title>
    <script src="./js/jquery-1.7.2.min.js"></script>
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
<body style="width: 100%;height: 100%">
<div class="password-div" >
    <label for="password" class="password-lable">
        <ul>
            <li></li><li></li>.
            <li></li>℃
        </ul>
        <input id="password" type="text" name="password" maxlength="3">
    </label>
</div>
<span id="a"></span>
</body>
<script >
    $(".password-div ").on("input",function(e){ //标签为password-div下的input添加oninput事件
        var number = 3;   //定义输入最大值
        var pw = $("input[name = 'password']").val(); //定义pw为name是password的input框的输入值
        var list = $(".password-div ul li");  //定义list是li
        $("#a").empty();
        pw=pw.replace(/\D/g,"")
        $("input[name = 'password']").val(pw);
        $("#a").append(pw.replace(/(\d\d)(\d)/g,"$1.$2℃"));
    for(var i = 0; i < number ; i++){    //for循环遍历将·放入li标签
            console.log(pw);
            if(pw[i]){

                 $(list[i]).text(pw[i]);

            }else{
                $(list[i]).text("");
            };


        };
    });
    $(".password-div ul").click(function(){
        $("input[name = 'password']").val("");
        $("#password").focus();
        $(".password-div ul li").text("");
    });
</script>
</html>