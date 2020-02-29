<%--
  Created by IntelliJ IDEA.
  User: hongda01
  Date: 2020/2/17
  Time: 13:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>人员信息录入</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0,viewport-fit=cover">
    <link rel="stylesheet" href="./weui.css"/>
    <link rel="stylesheet" href="./example.css"/>
    <script src="./js/jquery-1.7.2.min.js"></script>
    <script>
        if(localStorage.getItem("yhxx")) {

            window.location.href = 'tiwen.jsp';
        }
        function checkXm (value, parent, data) {
            var msg;
            if (value.match(/\d/)) {
                msg = "不能有数字"
            } else if (value.match(/[A-z]/)) {
                msg = "不能有字母"
            } else if (value.match(/\s/)) {
                msg = "不能有空格"
            } else if (!value.match(/^[\u4E00-\u9FA5·]+$/)) {
                msg = "必须是汉字"
            } else if (value.length === 1) {
                msg = "不能仅仅1个字"
            } else if (value.length > 15) {
                msg = "不能超过15个字"
            }
            return msg;
        }
        function checkSfz2 (value, parent, data) {
            var msg;
            if (value.length < 18) {
                msg = "还需要输入" + (18 - value.length) + "位字符"
            } else if (value.length > 18) {
                msg = "太长了，超出了" + (value.length - 18) + "位字符"
            } else if (value.match(/\s/)) {
                msg = "不能有空格"
            } else if (!value.match(/^\d{18}$|^\d{17}X$/)) {
                msg = "不合法"
            }
            else {
                var d = new Date(value.substr(6, 4), value.substr(10, 2) - 1, value.substr(12, 2))
                var n = (d.getFullYear().toString() === value.substr(6, 4)
                    && (d.getMonth() + 1) === parseInt(value.substr(10, 2))
                    && d.getDate() === parseInt(value.substr(12, 2)))
                if (!n) {
                    msg = "生日部分不是合法日期"
                } else if (d > Date.now()) {
                    msg = "生日部分不能在未来日期"
                } else if (d < Date.now() - 86400000 * 36500) {
                    msg = "生日部分不能在百年前日期"
                }
                var j = 0
                for (var i = 1; i < 18; i++) {
                    var cy = i === 1 ? 7 : i === 2 ? 9 : i === 3 ? 10 : i === 4 ? 5 : i === 5 ? 8 :
                        i === 6 ? 4 : i === 7 ? 2 : i === 8 ? 1 : i === 9 ? 6 : i === 10 ? 3 :
                            i === 11 ? 7 : i === 12 ? 9 :
                                i === 13 ? 10 : i === 14 ? 5 : i === 15 ? 8 : i === 16 ? 4 : 2
                    j += value.substr(i - 1, 1) * cy
                }
                j = (12 - j % 11) % 11
                if (j === 10 && value.substr(17, 1) !== 'X') {
                    msg = "校验位必须是X"
                } else if (j !== 10 && value.substr(17, 1) !== j.toString()) {
                    msg = "校验位必须是" + j
                }
            }
            return msg
        };
        function checkSfz(num) {
            num = num.toUpperCase();
            //身份证号码为15位或者18位，15位时全为数字，18位前17位为数字，最后一位是校验位，可能为数字或字符X。  
            //num = document.getElementById("sfzh").value;
            if (!(/(^\d{15}$)|(^\d{17}([0-9]|X)$)/.test(num))) {

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

                        return false;
                    }
                    return true;
                }
            }
            return false;
        };
        function checkPass() {
            var mm = document.getElementById("mm").value;
            var mm2 = document.getElementById("mm2").value;
            if(mm2 != mm){
                alert("与原输入密码不符，重新输入");
            }

        }
        /*function setPhone() {

            document.getElementById("yhm").value = document.getElementById("lxdh").value;
        }*/
        function getDw() {
            var mc = document.getElementById("mc").value;
            var tn = {"tn":"Dwxx","tj":"mc like '%"+mc+"%' and rownum < 11"};
            var st = JSON.stringify(tn);
            var  data = {"data":st};
            var i;
            /*http://192.168.5.233:8080/G.jsp
                 http://202.111.188.120:88/G.jsp*/
            $.post("http://202.111.188.120:88/G.jsp",data).success(function (a) {
                a = JSON.parse(a);
                if(a.rows.length < 1){
                    alert("你输入的单位不存在!");
                }else {
                    var html = '';
                    for(i =0 ;i<a.rows.length;i++){
                        console.log(a.rows[i].mc,a.rows[i].xlh);
                        html = html +'<option value="'+ a.rows[i].xlh +'">'+ a.rows[i].mc +'</option>' ;
                        $('#dwxlh').html('').append(html);
                    }
                    //alert("ok!");
                    console.log(a.rows);
                    /*document.getElementById("mc").value = a.rows[0].mc;
                    if(document.getElementById("mc").value = a.rows[0].mc){
                        document.getElementById("dwxlh").value = a.rows[0].xlh;
                        //alert(document.getElementById("dwxlh").value);
                        return;
                    }*/
                }
            });

        }
        function doSubmit(){
            //var mc = document.getElementById("mc").value;
            var dwxlh = document.getElementById("dwxlh").value;
            var xm = document.getElementById("xm").value;
            var sfzh = document.getElementById("sfzh").value;
            var dzxz = document.getElementById("dzxz").value;
            var lxdh = document.getElementById("lxdh").value;
            /*var jcfrqk = document.getElementById("jcfrqk").value;
            var frqk = document.getElementById("frqk").value;
            var wcqkssxq = document.getElementById("wcqkssxq").value;
            var wcqkqt = document.getElementById("wcqkqt").value;
            var wcqkjtgj = document.getElementById("wcqkjtgj").value;
            var wcqkpzhm = document.getElementById("wcqkpzhm").value;
            var wcqkjcry = document.getElementById("wcqkjcry").value;
            var grcn = document.getElementById("grcn").value;*/
            /*var yhm = document.getElementById("yhm").value;
            var mm = document.getElementById("mm").value;
            var mm2 = document.getElementById("mm2").value;*/

            //alert(dwxlh);
           /* if(mc.length<=0 ){
                alert("工作单位不能为空!");
                return;
            }*/
            if(checkXm(xm)){
                alert("姓名："+checkXm(xm));
                return;
            }
            if(sfzh.length <=0){
                alert("身份证号不能为空!");
                return;
            }
            if(dzxz.length <=0){
                alert("地址不能为空!");
                return;
            }
            if(lxdh.length < 11){
                alert("联系电话有误请重新输入!");
                return;
            }
            /*if(mm != mm2){
                alert("与原输入密码不符，重新输入");
                return;
            }*/
            //checkSfz(sfzh);
            //alert(checkSfz(sfzh));
            if(checkSfz2(sfzh)){
                alert("身份证号："+checkSfz2(sfzh));
                return;
            }
            var tn = {/*"mc":mc,*/"dwxlh":dwxlh,"xm":xm,"sfzh":sfzh,"dzxz":dzxz,"lxdh":lxdh/*"jcfrqk":jcfrqk,"wcqkssxq":wcqkssxq,"wcqkqt":wcqkqt,"wcqkjtgj":wcqkjtgj,"wcqkpzhm":wcqkpzhm,"wcqkjcry":wcqkjcry,"frqk":frqk*//*"yhm":yhm*/,"mm":"000"};
            var st = JSON.stringify(tn);
            var data = {"data":st};
            var tn2 = {"tn":"Yhxx","tj":"yhm = '"+lxdh+"'"};
            var st2 = JSON.stringify(tn2);

            var  data2 = {"data":st2};
            /*http://192.168.5.233:8080/G.jsp
                 http://202.111.188.120:88/G.jsp*/
            $.post("http://202.111.188.120:88/G.jsp",data2).success(function (ac){
                var b;
                b = JSON.parse(ac);
                console.log(b.rows);
                if(b.rows.length){
                    alert("联系电话已存在");
                    return;
                }else {
                    $.post("http://202.111.188.120:88/login/SFr.jsp",data).success(function (a) {
                        a = JSON.parse(a);
                        if(a.d.match(/成功/)){
                            alert(a.d);
                            window.location.href = 'tiwen.jsp';
                        }else {
                            alert(a.d);
                            window.location.href = 'error.jsp';
                        }
                    });
                }
            });

            /*http://192.168.5.233:8080/G.jsp
                 http://202.111.188.120:88/G.jsp*/



        }
    </script>
</head>
<body>

<form>
    <div class="weui-cell" style="height: 30px">
        <div class="weui-cell__hd"></div>
        <div class="weui-cell__bd">
        </div>
    </div>
    <div class="weui-form__text-area">
        <h2 class="weui-form__title">鸿达集团<br>人员信息注册<br>（本人承诺所填报信息属实）</h2>
    </div>

    <%--<div class="weui-cell">
        <div class="weui-cell__hd"><label class="weui-label">工作单位</label></div>
        <div class="weui-cell__bd">
            <input id="mc" class="weui-input" placeholder="输入工作单位名称查询" onBlur="getDw()"/>
        </div>

    </div>--%>

    <%--<div class="weui-cell weui-cell_select weui-cell_select-after">
        <div class="weui-cell__hd">
            <label  class="weui-label">长春鸿达</label>

        </div>
    </div>--%>
    <div class="weui-cell">
        <div class="weui-cell__hd"><label class="weui-label"><b style="color: red">*</b>姓名</label></div>
        <div class="weui-cell__bd">
            <input id="dwxlh" type="hidden" value="3BD45F14-2CDF-42B2-84DB-03BBA824B501">
            <input id="xm" class="weui-input" placeholder="请输入中文姓名" />
        </div>
    </div>
    <div class="weui-cell">
        <div class="weui-cell__hd"><label class="weui-label"><b style="color: red">*</b>身份证号</label></div>
        <div class="weui-cell__bd">
            <input id="sfzh" class="weui-input" placeholder="请输入身份证号" maxlength="18"/>
    </div>
    </div>

    <div class="weui-cell">
        <div class="weui-cell__hd"><label class="weui-label"><b style="color: red">*</b>现住址</label></div>
        <div class="weui-cell__bd">
            <input id="dzxz" class="weui-input" placeholder="省市县（区）+街道+详址"/>
        </div>
    </div>
    <div class="weui-cell">
        <div class="weui-cell__hd"><label class="weui-label"><b style="color: red">*</b>手机号</label></div>
        <div class="weui-cell__bd">
            <input id="lxdh" class="weui-input" placeholder="请输入手机号" maxlength="11" onkeyup="this.value=this.value.replace(/\D/g,'')" />
        </div>
    </div>
    <%--<div class="weui-cell">
        <div class="weui-cell__hd"><label><b>您近期或14天内是否"接触"过发热或有呼吸道症状的人</b></label></div>
    </div>
    <div class="weui-cell weui-cell_select weui-cell_select-after">
        <div class="weui-cell__hd">
            <label  class="weui-label">*请选择：</label>
        </div>
        <div class="weui-cell__bd">
            <select id="jcfrqk" class="weui-select" name="select1">
                <option value="0">是</option>
                <option value="1">否</option>
                <option value="2">不清楚</option>
            </select>
        </div>
    </div>
    <div class="weui-cell">
        <div class="weui-cell__hd"><label><b>您近期或14天内是否"自己"发热或有呼吸道症状</b></label></div>
    </div>
    <div class="weui-cell weui-cell_select weui-cell_select-after">
        <div class="weui-cell__hd">
            <label  class="weui-label">*请选择：</label>
        </div>
        <div class="weui-cell__bd">
            <select id="frqk" class="weui-select" name="select1">
                <option value="0">是</option>
                <option value="1">否</option>
            </select>
        </div>
    </div>
    <div class="weui-cell">
        <div class="weui-cell__hd"><label><b>您近期或14天内去过的地方、乘坐的交通工具、接触的人员</b></label></div>
    </div>
    <div class="weui-cell weui-cell_select weui-cell_select-after">
        <div class="weui-cell__hd">
            <label  class="weui-label">去过地区：</label>
        </div>
        <div class="weui-cell__bd">
            <select id="wcqkssxq" class="weui-select" name="select2">
                <option value="110000">北京市</option>
                <option value="120000">天津市</option>
                <option value="130000">河北省</option>
                <option value="140000">山西省</option>
                <option value="150000">内蒙古自治区</option>
                <option value="210000">辽宁省</option>
                <option value="220000">吉林省</option>
                <option value="230000">黑龙江省</option>
                <option value="310000">上海市</option>
                <option value="320000">江苏省</option>
                <option value="330000">浙江省</option>
                <option value="340000">安徽省</option>
                <option value="350000">福建省</option>
                <option value="360000">江西省</option>
                <option value="370000">山东省</option>
                <option value="410000">河南省</option>
                <option value="420000">湖北省</option>
                <option value="430000">湖南省</option>
                <option value="440000">广东省</option>
                <option value="450000">广西壮族自治区</option>
                <option value="460000">海南省</option>
                <option value="500000">重庆市</option>
                <option value="510000">四川省</option>
                <option value="520000">贵州省</option>
                <option value="530000">云南省</option>
                <option value="540000">西藏自治区</option>
                <option value="610000">陕西省</option>
                <option value="620000">甘肃省</option>
                <option value="630000">青海省</option>
                <option value="640000">宁夏回族自治区</option>
                <option value="650000">新疆维吾尔自治区</option>
                <option value="660000">新疆生产建设兵团</option>
                <option value="710000">台湾省</option>
                <option value="810000">香港特别行政区</option>
                <option value="820000">澳门特别行政区</option>
            </select>
        </div>
    </div>

    <div class="weui-cell">
        <div class="weui-cell__hd"><label class="weui-label">其他地区</label></div>
        <div class="weui-cell__bd">
            <input id="wcqkqt" class="weui-input" placeholder="如未外出请填无"/>
        </div>
    </div>
    <div class="weui-cell weui-cell_select weui-cell_select-after">
        <div class="weui-cell__hd">
            <label  class="weui-label">交通工具：</label>
        </div>
        <div class="weui-cell__bd">
            <select id="wcqkjtgj" class="weui-select" name="select3">
                <option value="1">飞机</option>
                <option value="2">火车</option>
                <option value="3">客车</option>
                <option value="4">公交车</option>
                <option value="5">出租（网约）车</option>
                <option value="6">私家车</option>
                <option value="7">其他</option>
            </select>
        </div>
    </div>
    <div class="weui-cell">
        <div class="weui-cell__hd"><label class="weui-label">车号</label></div>
        <div class="weui-cell__bd">
            <input id="wcqkpzhm" class="weui-input" placeholder="或车次号、航班号"/>
        </div>
    </div>
    <div class="weui-cell">
        <div class="weui-cell__hd"><label class="weui-label">接触的人员</label></div>
        <div class="weui-cell__bd">
            <input type="hidden" id="wcqkjcry" class="weui-input" placeholder="多名人员用，分隔"/>
        </div>
    </div>--%>
    <%--<div class="weui-cell">
        <div class="weui-cell__hd"><label class="weui-label">用户名</label></div>
        <div class="weui-cell__bd">
            <input id="yhm" class="weui-input" placeholder="请输入用户名" />
        </div>
    </div>
    <div class="weui-cell">
        <div class="weui-cell__hd"><label class="weui-label">密码</label></div>
        <div class="weui-cell__bd">
            <input id="mm" class="weui-input" type="password" placeholder="请输入密码(英文或数字)" onkeyup="value=value.replace(
                /[^\w\.\/]/ig,''
            )"/>
        </div>
    </div>
    <div class="weui-cell">
        <div class="weui-cell__hd"><label class="weui-label">确认密码</label></div>
        <div class="weui-cell__bd">
            <input id="mm2" class="weui-input" type="password" placeholder="请再次输入密码" onkeyup="value=value.replace(
                /[^\w\.\/]/ig,''
            )" onblur="checkPass()"/>
        </div>
    </div>--%>
   <div class="weui-form__tips-area">
        <label id="weuiAgree" class="weui-agree">

            <span class="weui-agree__text"><h3>手机号即登录名，初始密码‘000’</h3></span>
        </label>
    </div>
    <div class="button-sp-area">
        <input type="button" value="立即提交"  class="weui-btn weui-btn_primary" onclick="doSubmit()">
    </div>
    <%--<input type="hidden"  id="dwxlh" value="" labelText="单位主键">--%>

</form>

</body>
</html>
