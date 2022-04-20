<%@ page import="java.net.ResponseCache" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <meta charset="UTF-8">
    <title>历史人物</title>
    <%
        String path = request.getContextPath();
        String basePath = request.getScheme() + "://" + request.getServerName() + ":" +
                request.getServerPort() + path + "/";
    %>
    <base href="<%=basePath%>">
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
            left:320px;
            top:130px;
            width:1100px;
            height: 200px;
        }
        #div3{
            position: absolute;
            left:320px;
            top:350px;
            width:1100px;
            height: 200px;
        }
        #div4{
            position: absolute;
            left:320px;
            top:570px;
            width:1100px;
            height: 200px;
        }
        .dropdown1 {
            position: relative;
            display: inline-block;
            width: 250px;
            height: 160px;
        }

        .dropdown_content {
            display: none;
            position: absolute;
            background-color: #f9f9f9;
            min-width: 160px;
            box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
            z-index: 1;
        }

        .dropdown1:hover .dropdown_content {
            display: block;
        }

        .desc {
            padding: 15px;
            text-align: center;
        }
    </style>
</head>
<body>
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
            <a href="<%=basePath%>UserJsp/userInfo.jsp" class="a"><span class="span1">个人信息</span></a>
        </div>
    </div>
<%
    if(session.getAttribute("name")==null){
        response.sendRedirect("UserJsp/login.jsp");
    }
    if(request.getAttribute("paths")==null||request.getAttribute("texts")==null){
        response.sendRedirect("/feng/handleHistoryPicture");
    }else{
        String[] paths = (String[]) request.getAttribute("paths");
        String[] texts = (String[]) request.getAttribute("texts");
        out.write("<div id=\"div2\">\n" +
                "        <div class=\"dropdown1\">\n" +
                "            <img src=\""+paths[0]+"\" style=\"width:250px;height: 160px; \">\n" +
                "            <div class=\"dropdown_content\">\n" +
                "                <img src=\""+paths[0]+"\" style=\"position:absolute;left:260px;top:-190px;width:312.5px;height: 200px; \">\n" +
                "                <p class=\"desc\" style=\"position:absolute;left:370px;top:-230px;width: 90px;height: 30px;font-family: KaiTi\">朱耷</p>\n" +
                "            </div>\n" +
                "        </div>\n" +
                "        <div style=\"position: absolute;top:0px;left:300px;width: 760px;height: 160px;\">\n" +
                "            <p style=\"font-family: KaiTi;font-size: 20px;\">\n" +
                "\n" +texts[0]+
                "            </p>\n" +
                "        </div>\n" +
                "    </div>");
        out.write("<div id=\"div3\">\n" +
                "        <div class=\"dropdown1\" style=\"position:absolute;left:820px;top:0px;\">\n" +
                "            <img src=\""+paths[1]+"\" style=\"width:250px;height: 160px; \">\n" +
                "            <div class=\"dropdown_content\">\n" +
                "                <img src=\""+paths[1]+"\" style=\"position:absolute;left:-320px;top:-190px;width:312.5px;height: 200px; \">\n" +
                "                <p class=\"desc\" style=\"position:absolute;left:-220px;top:-230px;width: 90px;height: 30px;font-family: KaiTi\">晏殊</p>\n" +
                "            </div>\n" +
                "        </div>\n" +
                "        <div style=\"position: absolute;top:-10px;left:0px;width: 760px;height: 160px;\">\n" +
                "            <p style=\"font-family: KaiTi;font-size: 20px;\">\n" +texts[1]+
                "            </p>\n" +
                "        </div>\n" +
                "    </div>");
        out.write("<div id=\"div4\">\n" +
                "        <div class=\"dropdown1\">\n" +
                "            <img src=\""+paths[2]+"\" style=\"width:250px;height: 160px; \">\n" +
                "            <div class=\"dropdown_content\">\n" +
                "                <img src=\""+paths[2]+"\" style=\"position:absolute;left:260px;top:-190px;width:312.5px;height: 200px; \">\n" +
                "                <p class=\"desc\" style=\"position:absolute;left:370px;top:-230px;width: 90px;height: 30px;font-family: KaiTi\">晏几道</p>\n" +
                "            </div>\n" +
                "        </div>\n" +
                "        <div style=\"position: absolute;top:5px;left:300px;width: 760px;height: 160px;\">\n" +
                "            <p style=\"font-family: KaiTi;font-size: 20px;\">\n" +texts[2]+
                "            </p>\n" +
                "        </div>\n" +
                "    </div>");
    }
%>

    <form action="/feng/logout" method="post">
        <input type="submit" style="position:fixed;left: 130px;top:650px;" class="btn btn-danger active" value="注销">
    </form>
</div>
</body>
</html>