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
    <title>注册单位</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0,viewport-fit=cover">
    <link rel="stylesheet" href="./weui.css"/>
    <link rel="stylesheet" href="./example.css"/>
</head>
<body>
    <div class="weui-cells__group weui-cells__group_form">
        <div class="weui-form__text-area">
            <h2 class="weui-form__title">单位注册</h2>
        </div>

        <div class="weui-cells weui-cells_form">
            <div class="weui-cell weui-cell_select weui-cell_select-after">
                <div class="weui-cell__hd">
                    <label for="" class="weui-label">组织机构类型：</label>
                </div>
                <div class="weui-cell__bd">
                    <select class="weui-select" name="select2">
                        <option value="1">企业</option>
                        <option value="2">机关</option>
                        <option value="3">事业单位</option>
                        <option value="3">社会团体</option>

                    </select>
                </div>
            </div>
            <div class="weui-cell">
                <div class="weui-cell__hd"><label class="weui-label">单位名称</label></div>
                <div class="weui-cell__bd">
                    <input id="js_input" class="weui-input" placeholder="请输入单位名称"/>
                </div>
            </div>
            <div class="weui-cell">
                <div class="weui-cell__hd"><label class="weui-label">单位统一社会信用代码</label></div>
                <div class="weui-cell__bd">
                    <input id="js_input" class="weui-input" placeholder="请输入社会信用代码"/>
                </div>
            </div>

            <div class="weui-cell">
                <div class="weui-cell__hd"><label class="weui-label">所在地址：</label></div>
                <div class="weui-cell__hd">
                    <label for="" class="weui-label">省：</label>
                </div>
                <div class="weui-cell__bd">
                    <select class="weui-select" name="select3">
                        <option value="1">黑</option>
                        <option value="2">吉</option>
                        <option value="3">辽</option>
                        <option value="3">蒙</option>

                    </select>
                </div>
            </div>
            <div class="weui-cell">
                <div class="weui-cell__hd"><label class="weui-label"></label></div>

                <div class="weui-cell__hd">

                    <label for="" class="weui-label">市</label>
                </div>
                <div class="weui-cell__bd">
                    <select class="weui-select" name="select3">
                        <option value="1">2</option>
                        <option value="2">3</option>
                        <option value="3">4</option>
                        <option value="3">5</option>

                    </select>
                </div>
            </div>
            <div class="weui-cell">
                <div class="weui-cell__hd"><label class="weui-label"></label></div>

                <div class="weui-cell__hd">
                    <label for="" class="weui-label">县（区）</label>
                </div>
                <div class="weui-cell__bd">
                    <select class="weui-select" name="select3">
                        <option value="1">2</option>
                        <option value="2">3</option>
                        <option value="3">4</option>
                        <option value="3">5</option>

                    </select>
                </div>
            </div>
            <div class="weui-cell">
                <div class="weui-cell__hd"><label class="weui-label">所在街道</label></div>
                <div class="weui-cell__bd">
                    <input id="js_input" class="weui-input" placeholder="请输入所在街道" />
                </div>
            </div>
            <div class="weui-cell">
                <div class="weui-cell__hd"><label class="weui-label">详细地址</label></div>
                <div class="weui-cell__bd">
                    <input id="js_input" class="weui-input" placeholder="请输入详细地址" />
                </div>
            </div>

            <div class="weui-cell">
                <div class="weui-cell__hd"><label class="weui-label">联系人</label></div>
                <div class="weui-cell__bd">
                    <input id="js_input" class="weui-input" placeholder="请输入联系人姓名" />
                </div>
            </div>
            <div class="weui-cell">
                <div class="weui-cell__hd"><label class="weui-label">联系人电话</label></div>
                <div class="weui-cell__bd">
                    <input id="js_input" class="weui-input" placeholder="请输入联系人电话" type="number" pattern="[0-9]*" />
                </div>
            </div>
            <div class="weui-cell">
                <div class="weui-cell__hd"><label class="weui-label">登陆用户名</label></div>
                <div class="weui-cell__bd">
                    <input id="js_input" class="weui-input" placeholder="请输入登陆用户名" />
                </div>
            </div>
            <div class="weui-cell">
                <div class="weui-cell__hd"><label class="weui-label">登陆用户密码</label></div>
                <div class="weui-cell__bd">
                    <input id="js_input" class="weui-input" placeholder="请输入登陆用户密码" />
                </div>
            </div>
            <div class="weui-cell">
                <div class="weui-cell__hd"><label class="weui-label">用户密码确认</label></div>
                <div class="weui-cell__bd">
                    <input id="js_input" class="weui-input" placeholder="请再次输入用户密码" />
                </div>
            </div>
        </div>
    </div>


    <div>

        </div>
        <div class="button-sp-area">
            <a href="javascript:;" class="weui-btn weui-btn_primary">立即注册</a>
        </div>



</body>
</html>
