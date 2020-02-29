
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>
      <script>
          function x() {
              var c = document.getElementById("tt").value;
              var reg = new RegExp("^(((3[5-9]|3[5-9]\.\[0-9])?)|((4[0-4]|4[0-4]\.\[0-9])?))$");
              //alert(c);
              if (!reg.test(c)){
                  alert("cuowu!");
                  return;
              }

          };
          function isCardNo(num) {
              num = num.toUpperCase();
              //身份证号码为15位或者18位，15位时全为数字，18位前17位为数字，最后一位是校验位，可能为数字或字符X。  
              num = document.getElementById("tt").value;
              if (!(/(^\d{15}$)|(^\d{17}([0-9]|X)$)/.test(num))) {
                  alert("2");

                  return false;
              }
              //校验位按照ISO 7064:1983.MOD 11-2的规定生成，X可以认为是数字10。 
              //下面分别分析出生日期和校验位 
              var len, re;
              len = num.length;
              if (len == 15) {
                  re = new RegExp(/^(\d{6})(\d{2})(\d{2})(\d{2})(\d{3})$/);
                  var arrSplit = num.match(re);

                  //检查生日日期是否正确 
                  var dtmBirth = new Date('19' + arrSplit[2] + '/' + arrSplit[3] + '/' + arrSplit[4]);
                  var bCorrectDay;
                  bCorrectDay = (dtmBirth.getYear() == Number(arrSplit[2])) && ((dtmBirth.getMonth() + 1) == Number(arrSplit[3])) &&
                      (
                          dtmBirth.getDate() == Number(arrSplit[4]));
                  if (!bCorrectDay) {
                      alert("2");

                      return false;
                  } else {
                      //将15位身份证转成18位 
                      //校验位按照ISO 7064:1983.MOD 11-2的规定生成，X可以认为是数字10。 
                      var arrInt = new Array(7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2);
                      var arrCh = new Array('1', '0', 'X', '9', '8', '7', '6', '5', '4', '3', '2');
                      var nTemp = 0,
                          i;
                      num = num.substr(0, 6) + '19' + num.substr(6, num.length - 6);
                      for (i = 0; i < 17; i++) {
                          nTemp += num.substr(i, 1) * arrInt[i];
                      }
                      num += arrCh[nTemp % 11];
                      alert("1");

                      return true;
                  }
              }
              if (len == 18) {
                  re = new RegExp(/^(\d{6})(\d{4})(\d{2})(\d{2})(\d{3})([0-9]|X)$/);
                  var arrSplit = num.match(re);

                  //检查生日日期是否正确 
                  var dtmBirth = new Date(arrSplit[2] + "/" + arrSplit[3] + "/" + arrSplit[4]);
                  var bCorrectDay;
                  bCorrectDay = (dtmBirth.getFullYear() == Number(arrSplit[2])) && ((dtmBirth.getMonth() + 1) == Number(arrSplit[3])) &&
                      (dtmBirth.getDate() == Number(arrSplit[4]));
                  if (!bCorrectDay) {
                      alert("2");

                      return false;
                  } else {
                      //检验18位身份证的校验码是否正确。 
                      //校验位按照ISO 7064:1983.MOD 11-2的规定生成，X可以认为是数字10。 
                      var valnum;
                      var arrInt = new Array(7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2);
                      var arrCh = new Array('1', '0', 'X', '9', '8', '7', '6', '5', '4', '3', '2');
                      var nTemp = 0,
                          i;
                      for (i = 0; i < 17; i++) {
                          nTemp += num.substr(i, 1) * arrInt[i];
                      }
                      valnum = arrCh[nTemp % 11];
                      if (valnum != num.substr(17, 1)) {
                          alert("2");

                          return false;
                      }
                      alert("1");
                      return true;
                  }
              }
              alert("2");
              return false;
          };




      </script>
  </head>
  <body>
  <div>
      <a href="weUI.html">样子</a>
      <a href="yuangong.jsp">员工</a>
      <a href="tiwen.jsp">体温采集</a>
      <a href="login.jsp">登陆</a>
      <input type="button" value="1234644" onClick="x()">
      <a href="success.jsp">成功</a>
      <a href="error.jsp">失败</a>

      <input type="text" value="" id="tt" onblur="isCardNo()">

  </div>
  </body>
</html>
