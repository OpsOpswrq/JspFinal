package com.feng.servlet;

import com.feng.mapper.UserMapper;
import com.feng.pojo.User;
import com.feng.utils.MybatisUtil;
import org.apache.ibatis.session.SqlSession;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class handleLogin extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf8");
        resp.setCharacterEncoding("utf8");
        resp.setContentType("text/html;charset=utf8");
        String name = req.getParameter("name");
        String pwd = req.getParameter("pwd");
        SqlSession sqlSession = MybatisUtil.getSqlSession();
        UserMapper mapper = sqlSession.getMapper(UserMapper.class);
        User user = mapper.selectUserByName(name);
        if(user==null){
            req.setAttribute("isLogin","false1");
            sqlSession.close();
            req.getRequestDispatcher("UserJsp/login.jsp").forward(req,resp);
        }
        else if(user.getPwd().equals(pwd)){
            req.setAttribute("isLogin","true");
            sqlSession.close();
            req.getRequestDispatcher("UserJsp/login.jsp").forward(req,resp);
        }else{
            req.setAttribute("isLogin","false2");
            sqlSession.close();
            req.getRequestDispatcher("UserJsp/login.jsp").forward(req,resp);
        }
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
