<%@ page import="com.feng.pojo.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>个人信息</title>
    <%
        String path = request.getContextPath();
        String basePath = request.getScheme() + "://" + request.getServerName() + ":" +
                request.getServerPort() + path + "/";
    %>
    <base href="<%=basePath%>">
    <title>评论留言</title>
    <link href="<%=basePath%>resources/css/style.css" type="text/css" rel="stylesheet"></link>
    <link href="<%=basePath%>resources/resources/bootstrap/css/bootstrap.css" type="text/css" rel="stylesheet">
    <style>
        #div_img1{
            position:absolute;
            left:10px;
            top:10px;
        }
        #div1{
            position: fixed;
            left:80px;
            top:220px;
            width: 200px;
            height: 400px;
        }
        #div2{
            position: absolute;
            width: 500px;
            height:400px;
            left:680px;
            top:240px;
        }
    </style>
</head>
<body>
<%
    if(session.getAttribute("name")==null){
        response.sendRedirect("../UserJsp/login.jsp");
    }
%>
<div>
    <div id="div_img1">
        <img src="<%=basePath%>resources/img/school.jpg" style="width: 50%;height: 50%;">
    </div>
    <div id="div1">
        <div class="div1">
            <a href="<%=basePath%>main/mainPage.jsp" class="a"><span class="span1">家乡概述</span></a>
            <div class="div2">
                <a href="<%=basePath%>html/风景名胜.jsp" class="a1"><span class="span2">风景名胜</span></a>
                <a href="<%=basePath%>html/有名小吃.jsp" class="a1"><span class="span2">有名小吃</span></a>
                <a href="<%=basePath%>html/历史人物.jsp" class="a1"><span class="span2">历史人物</span></a>
            </div>
        </div>
        <div style="position:absolute;left:0px;top:180px;">
            <a href="<%=basePath%>commentJsp/comment.jsp" class="a"><span class="span1">留言评论</span></a>
        </div>
        <div style="position:absolute;left: 0px;top:360px;">
            <a href="" class="a"><span class="span1">个人信息</span></a>
        </div>
    </div>
    <div id="div2">
        <form action="/feng/handleUser" method="post">
            <%
                if(request.getAttribute("user")!=null){
                    User user = (User) request.getAttribute("user");
                    out.write("<div style=\"position: absolute;left: 0px;top:10px;width: 300px;height: 60px;\">\n" +
                            "            <span style=\"font-family: KaiTi;font-size: 20px;position:absolute;left:-80px;top:0px;\"><strong>用户名</strong></span><input id=\"name\" name=\"name\" placeholder=\"请输入用户名\" readonly=\"readonly\" value=\""+user.getName()+"\" class=\"form-control\" style=\"position:absolute;left: 0px;top:0px;\">\n" +
                            "        </div>\n" +
                            "        <br/>\n" +
                            "        <div style=\"position: absolute;left: 0px;top:60px;width: 300px;height: 60px;\">\n" +
                            "            <span style=\"font-family: KaiTi;font-size: 20px;position:absolute;left:-80px;top:0px;\"><strong>密码</strong></span><input id=\"password\" name=\"pwd\" placeholder=\"请输入密码\" value=\""+user.getPwd()+"\"class=\"form-control\" type=\"text\" style=\"position:absolute;left: 0px;top:0px;\">\n" +
                            "        </div>\n" +
                            "        <br/>\n" +
                            "        <div style=\"position: absolute;left: 0px;top:110px;width: 300px;height: 60px;\">\n" +
                            "            <span style=\"font-family: KaiTi;font-size: 20px;position:absolute;left:-80px;top:0px;\"><strong>性别</strong></span><input type=\"text\" name=\"sex\" style=\"position:absolute;left: 0px;top:0px;\" class=\"form-control\" value=\""+user.getSex()+"\">"+
                            "        </div>\n" +
                            "        <br/>\n" +
                            "        <div style=\"position: absolute;left: 0px;top:160px;width: 300px;height: 60px;\">\n" +
                            "            <span style=\"font-family: KaiTi;font-size: 20px;position:absolute;left:-80px;top:0px;\"><strong>邮箱</strong></span><input id=\"email\" name=\"email\" placeholder=\"请输入邮箱\" value=\""+user.getEmail()+"\"class=\"form-control\" type=\"email\" style=\"position:absolute;left: 0px;top:0px;\">\n" +
                            "        </div>\n" +
                            "        <br/>\n" +
                            "        <div style=\"position: absolute;left: 0px;top:210px;width: 300px;height: 60px;\">\n" +
                            "            <span style=\"font-family: KaiTi;font-size: 20px;position:absolute;left:-80px;top:0px;\"><strong>地址</strong></span><input id=\"address\" name=\"address\" placeholder=\"请输入地址\" value=\""+user.getAddress()+"\"class=\"form-control\" type=\"text\" style=\"position:absolute;left: 0px;top:0px;\">\n" +
                            "        </div>\n" +
                            "        <br/>\n" +
                            "        <div style=\"position: absolute;left: 0px;top:260px;width: 300px;height: 60px;\">\n" +
                            "            <span style=\"font-family: KaiTi;font-size: 20px;position:absolute;left:-80px;top:0px;\"><strong>别名</strong></span><input id=\"alias\" name=\"alias\" placeholder=\"请输入别名\" value=\""+user.getAlias()+"\"class=\"form-control\" type=\"text\" style=\"position:absolute;left: 0px;top:0px;\">\n" +
                            "        </div>\n" +
                            "        <br/>"+
                            "<div style=\"position: absolute;left: 0px;top:350px;width: 300px;height: 60px;\">\n" +
                            "                                        <span style=\"font-family: KaiTi;font-size: 20px;position:absolute;left:-80px;top:0px;\"><strong>头像</strong></span>"+"<img src=\""+request.getAttribute("path")+"\" style=\"position:absolute;left:100px;top:0px;width:100px;height:100px;\">\n" +
                            "                                    </div>\n"+"<br/>");
                }else{
                    request.setAttribute("userName",session.getAttribute("name"));
                    request.getRequestDispatcher("/returnUser").forward(request,response);
                }
            %>
            <input type="submit" value="提交修改" class="btn btn-danger active" style="position: absolute;left: 100px;top:310px;">
        </form>
    </div>
    <form action="/feng/logout" method="post">
        <input type="submit" style="position:absolute;left: 130px;top:650px;" class="btn btn-danger active" value="注销">
    </form>
</div>
</body>
</html>
