package com.feng.servlet;

import com.feng.mapper.PictureMapper;
import com.feng.mapper.UserMapper;
import com.feng.pojo.User;
import com.feng.utils.MybatisUtil;
import org.apache.ibatis.session.SqlSession;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class returnUser extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf8");
        resp.setContentType("text/html;charset=utf8");
        resp.setCharacterEncoding("utf8");
        String userName = (String) req.getAttribute("userName");
        SqlSession sqlSession = MybatisUtil.getSqlSession();
        UserMapper mapper = sqlSession.getMapper(UserMapper.class);
        User user = mapper.selectUserByName(userName);
        req.setAttribute("user",user);
        PictureMapper mapper1 = sqlSession.getMapper(PictureMapper.class);
        String pathByName = mapper1.getPathByName(userName);
        System.out.println(pathByName);
        req.setAttribute("path",pathByName);
        sqlSession.close();
        req.getRequestDispatcher("UserJsp/userInfo.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doGet(req, resp);
    }

    @Override
    public void destroy() {
        super.destroy();
    }

    @Override
    public void init() throws ServletException {
        super.init();
    }
}
