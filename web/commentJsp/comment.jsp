<%@ page import="com.feng.pojo.Comment" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
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
            position:fixed;
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
        #div4{
            position: absolute;
            width: 1100px;
            left:350px;
            top:130px;
            height:2000px;
        }
        .p{
            font-size: 20px;
            font-family: KaiTi;
            position: relative;
            top:10px;
            left: 10px;
        }
        .button1{
            position: absolute;
            top:-35px;
            left:1000px;
        }
        .span{
            font-family: KaiTi;
            font-size: 16px;
            position: absolute;
            top:120px;
            left:800px;
        }
        #div5{
            position: fixed;
            left: 350px;
            top:650px;
            width: 1100px;
            height: 140px;
        }
    </style>
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
    <script type="text/javascript">
        function del(id){
            axios({
                method:'POST',
                url:'http://localhost:7878/feng/deleteComment',
                data:{
                    id:id
                }
            })
        }
    </script>
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
            <a href="<%=basePath%>UserJsp/userInfo.jsp" class="a"><span class="span1">个人信息</span></a>
        </div>
    </div>
    <input type="radio" checked="checked" style="">
    <div id="div4">
        <%
            if(request.getAttribute("comments")==null) {
                response.sendRedirect("/feng/comment");
            }else{
                List<Comment> comments = (List<Comment>) request.getAttribute("comments");
                for(int i = 0;i<comments.size();i++){
                    out.write("<div style=\"position:relative;left: 0px;top:0px;width: 1100px;height: 150px;margin-bottom:40px;background-color:#E4E7ED;\">\n" +
                            "            \n" +"<p class=\"p\">"+comments.get(i).getContent()+"</p>"+
                            "<button onclick=\"del("+comments.get(i).getId()+");\" class=\"btn btn-danger button1\" type=\"submit\">删除</button>"+
                            "<span class=\"span\">"+"用户:"+comments.get(i).getUserName()+"于"+comments.get(i).getCommit()+"</span>"+
                            "        </div>");
                }
            }

        %>
    </div>
    <div id="div5">
        <form method="post" action="/feng/handleComment">
            <input hidden="hidden" name="userName" value="${sessionScope.get("name")}">
            <textarea rows="6" cols="150" style="resize:none;" name="comment">

            </textarea>
            <input id="add" type="submit" value="发表" style="position:absolute;left: 1000px;top:130px;" class="btn btn-info">
        </form>
    </div>
    <form action="/feng/logout" method="post">
        <input type="submit" style="position:fixed;left: 130px;top:650px;" class="btn btn-danger active" value="注销">
    </form>
</div>
</body>
</html>
