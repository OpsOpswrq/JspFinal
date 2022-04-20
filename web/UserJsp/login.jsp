<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%
        String path = request.getContextPath();
        String basePath = request.getScheme() + "://" + request.getServerName() + ":" +
                request.getServerPort() + path + "/";
    %>
    <base href="<%=basePath%>">
    <title>登录</title>
    <link href="<%=basePath%>resources/resources/bootstrap/css/bootstrap.css" type="text/css" rel="stylesheet">
    <style type="text/css">
        #div1{
            position: absolute;
            left: 770px;
            top:250px;
        }
        #div2{
            position: absolute;
            left:180px;
            top:140px;
            width:100px;
            height:50px;
        }
        #div3{
            position: absolute;
            left: 650px;
            top:330px;
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
            top:15px;
            width: 300px;
            font-size: 20px;
            color: red;
        }
        #span2{
             position: absolute;
             left: 320px;
             top:65px;
             width: 300px;
             font-size: 20px;
             color: red;
         }
    </style>
</head>
<body>
<div id="div">
    <div id="div1">
        <h1>登录</h1>
    </div>
    <div id="div3">
        <form action="/feng/login" method="post">
            <div style="position: absolute;left: 0px;top:10px;width: 300px;height: 60px;">
                <span style="font-family: KaiTi;font-size: 20px;position:absolute;left:-80px;top:0px;"><strong>用户名</strong></span><input id="name" name="name" placeholder="请输入用户名" class="form-control" style="position:absolute;left: 0px;top:0px;">
            </div>
            <span id="span1"></span>
            <br/>
            <div style="position: absolute;left: 0px;top:60px;width: 300px;height: 60px;">
                <span style="font-family: KaiTi;font-size: 20px;position:absolute;left:-80px;top:0px;"><strong>密码</strong></span><input id="password" name="pwd" placeholder="请输入密码" class="form-control" type="password" style="position:absolute;left: 0px;top:0px;">
            </div>
            <span id="span2"></span>
            <br/>
            <input type="submit" name="submit" value="登录" class="btn btn-primary" style="position: absolute;left: 50px;top:150px;">
        </form>
        <div id="div2">
            <a href="<%=basePath%>UserJsp/register.jsp" class="btn btn-primary btn-lg active" style="text-decoration: none;">注册</a>
        </div>
    </div>
</div>
<%
    if(request.getAttribute("isLogin")!=null){
        if(request.getAttribute("isLogin").equals("false1")){
            out.write("<script type=\"text/javascript\">\n" +
                    "        document.getElementById(\"span1\").innerHTML=\"<span>用户名出现错误</span>\"\n" +
                    "    </script>");
        }else if(request.getAttribute("isLogin").equals("false2")){
            out.write("<script type=\"text/javascript\">\n" +
                    "        document.getElementById(\"span2\").innerHTML=\"<span>密码出现错误</span>\"\n" +
                    "    </script>");
            out.write("alert()");
        }else if(request.getAttribute("isLogin").equals("true")){
            session.setAttribute("name",request.getParameter("name"));
            response.sendRedirect("main/mainPage.jsp");
        }
    }
%>
</body>
</html>
