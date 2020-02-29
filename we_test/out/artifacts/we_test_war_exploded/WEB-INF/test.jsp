<%--
  Created by IntelliJ IDEA.
  User: hongda01
  Date: 2020/2/21
  Time: 15:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<script>
    var input = document.getElementById("myInput");
    input.addEventListener("keyup", function(event) {
        event.preventDefault();
        if (event.keyCode === 13) {
            document.getElementById("myBtn").click();
        }
    });
</script>
<script src="./js/jquery-1.7.2.min.js"></script>

<body>

<h3>按下 Enter 触发按钮点击事件</h3>
<p>选中输入框，然后按下"Enter" 就会触发按钮的点击事件。</p>

<input id="myInput" value="一些文本..">
<button id="myBtn" onclick="javascript:alert('Hello World!')">按钮</button>



</body>
</html>
