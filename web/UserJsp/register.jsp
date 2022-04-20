<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%
        String path = request.getContextPath();
        String basePath = request.getScheme() + "://" + request.getServerName() + ":" +
                request.getServerPort() + path + "/";
    %>
    <base href="<%=basePath%>">
    <title>注册</title>
    <link href="<%=basePath%>resources/resources/bootstrap/css/bootstrap.css" type="text/css" rel="stylesheet">
    <style type="text/css">
        #div1{
            position: absolute;
            left: 750px;
            top:120px;
        }
        #div2{
            position: absolute;
            left:180px;
            top:340px;
            width:100px;
            height:50px;
        }
        #div3{
            position: absolute;
            left: 650px;
            top:200px;
            width:200px;
            height: 100px;
        }
        #div{
            background:url('<%=basePath%>resources/img/bg.jpg') no-repeat;
            background-size:100% 100%;
            width:100%;
            height: 100%;
        }
        #span1{
            position: absolute;
            left: 320px;
            top:10px;
            width: 300px;
            font-size: 20px;
            color: red;
        }
    </style>

</head>
<body>
<div id="div">
    <div id="div1">
        <h1>注册</h1>
    </div>
    <div id="div3">
        <form action="/feng/register" method="post">
            <div style="position: absolute;left: 0px;top:10px;width: 300px;height: 60px;">
                <span style="font-family: KaiTi;font-size: 20px;position:absolute;left:-80px;top:0px;"><strong>用户名</strong></span><input id="name" name="name" placeholder="请输入用户名" class="form-control" style="position:absolute;left: 0px;top:0px;">
            </div>
            <span id="span1"></span>
            <br/>
            <div style="position: absolute;left: 0px;top:60px;width: 300px;height: 60px;">
                <span style="font-family: KaiTi;font-size: 20px;position:absolute;left:-80px;top:0px;"><strong>密码</strong></span><input id="password" name="pwd" placeholder="请输入密码" class="form-control" type="password" style="position:absolute;left: 0px;top:0px;">
            </div>
            <br/>
            <div style="position: absolute;left: 0px;top:110px;width: 300px;height: 60px;">
                <span style="font-family: KaiTi;font-size: 20px;position:absolute;left:-80px;top:0px;"><strong>性别</strong></span><input type="radio" name="sex" value="男" >男<input type="radio" name="sex" value="女" style="margin-left: 160px;">女
            </div>
            <br/>
            <div style="position: absolute;left: 0px;top:160px;width: 300px;height: 60px;">
                <span style="font-family: KaiTi;font-size: 20px;position:absolute;left:-80px;top:0px;"><strong>邮箱</strong></span><input id="email" name="email" placeholder="请输入邮箱" class="form-control" type="email" style="position:absolute;left: 0px;top:0px;">
            </div>
            <br/>
            <div style="position: absolute;left: 0px;top:210px;width: 300px;height: 60px;">
                <span style="font-family: KaiTi;font-size: 20px;position:absolute;left:-80px;top:0px;"><strong>地址</strong></span><input id="address" name="address" placeholder="请输入地址" class="form-control" type="text" style="position:absolute;left: 0px;top:0px;">
            </div>
            <br/>
            <div style="position: absolute;left: 0px;top:260px;width: 300px;height: 60px;">
                <span style="font-family: KaiTi;font-size: 20px;position:absolute;left:-80px;top:0px;"><strong>别名</strong></span><input id="alias" name="alias" placeholder="请输入别名" class="form-control" type="text" style="position:absolute;left: 0px;top:0px;">
            </div>
            <br/>
            <input type="submit" name="submit" value="提交" class="btn btn-primary" style="position:absolute;left:50px;top:350px;">
        </form>
        <br/>
        <form action="/feng/handlePicture" enctype="multipart/form-data" method="post">
            <div style="position: absolute;left: 0px;top:310px;width: 300px;height: 60px;">
                <span style="font-family: KaiTi;font-size: 20px;position:absolute;left:-80px;top:0px;"><strong>上传头像</strong></span><input id="picture" name="picture" type="file" style="position:absolute;left: 0px;top:0px;">
            </div>
            <br/>
            <input type="submit" name="submit" value="提交" class="btn btn-primary" style="position:absolute;left:200px;top:300px;">
        </form>
        <div id="div2">
            <a href="<%=basePath%>UserJsp/login.jsp" class="btn btn-primary btn-lg active" style="text-decoration: none">登录</a>
        </div>
    </div>
</div>
<%
    if(request.getAttribute("isRegister")!=null){
        if(request.getAttribute("isRegister").equals("false")) {
            out.write("<script type=\"text/javascript\">\n" +
                    "        document.getElementById(\"span1\").innerHTML = \"<span>出现重名!请选择其他名字!</span>\"\n" +
                    "    </script>");
        }else if(request.getAttribute("isRegister").equals("success")){
            out.write("<script type=\"text/javascript\">\n" +
                    "        alert(\"注册成功!注意图片的上传!\")\n" +
                    "    </script>");
        }else if(request.getAttribute("isRegister").equals("false1")){
            out.write("<script type=\"text/javascript\">\n" +
                    "        document.getElementById(\"span1\").innerHTML = \"<span>用户名为空!</span>\"\n" +
                    "    </script>");
        }
    }
%>
</body>
</html>
