<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>家乡概述</title>
    <%
        String path = request.getContextPath();
        String basePath = request.getScheme() + "://" + request.getServerName() + ":" +
                request.getServerPort() + path + "/";
    %>
    <base href="<%=basePath%>">
    <link href="<%=basePath%>resources/css/style.css" type="text/css" rel="stylesheet"></link>
    <link href="<%=basePath%>resources/resources/bootstrap/css/bootstrap.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../resources/js/jquery-3.6.0.js"></script>
    <script type="text/javascript">
        let i = 1
        $(function (){
            setInterval(()=>{
                i = i%3
                $("#img1").attr("src","../resources/img/"+i+".jpg")
                i += 1
            },3000);
        });
    </script>
    <style type="text/css">
        #div_img{
            position: absolute;
            left:350px;
            top:30px;
            width: 1100px;
            height: 200px;
        }
        #div_img1{
            position:absolute;
            left:10px;
            top:10px;
        }
        #div3{
            position: absolute;
            left:350px;
            top:320px;
            width:1100px;
            height:400px;
        }
        #div1{
            position: fixed;
            left:80px;
            top:220px;
            width: 200px;
            height: 400px;
        }
    </style>
</head>
<body>
<%
    if(session.getAttribute("name")==null) {
        response.sendRedirect("../UserJsp/login.jsp");
    }
%>
<div>
    <div id="div_img1">
        <img src="<%=basePath%>resources/img/school.jpg" style="width: 50%;height: 50%;">
    </div>
    <div id="div_img">
        <img src="<%=basePath%>resources/img/0.jpg" id="img1" style="width: 1100px;height: 200px;">
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
    <div id="div3">
        <h1>南昌介绍</h1>
        <p style="font-family: KaiTi;font-size: 20px">
            <span>南昌是江西省省会，全省政治、经济、文化中心位于江西北部，长江南岸，赣江下游，滨临鄱阳湖，东南地势平坦，西北丘陵起伏，全市境内江河纵横，湖泊星罗棋布。南昌又是一座具有光荣革命传统的英雄城市，“八一”南昌起义举世闻名，中国人民解放军诞生于此，故南昌又有“英雄城”之美称。</span><br/><br/><br/>
            <span>改革开放后，南昌的旅游事业发展迅速，许多的文物古迹修复一新，自然景观26处人文景观已达78处，南昌临近周边地区有著名的世界文化遗产庐山风景名胜区，鄱阳湖候鸟保护区、龙虎山国家风景名胜区、井冈山国家风景名胜区、三清山国家风景名胜区。形成了以南昌为中心，沿京九铁路风景带为重点，辐射江西全省的旅游、观光体系。</span>
        </p>
    </div>
    <form action="/feng/logout" method="post">
        <input type="submit" style="position:fixed;left: 130px;top:650px;" class="btn btn-danger active" value="注销">
    </form>
</div>
</body>
</html>

