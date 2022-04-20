package com.feng.servlet;

import com.feng.mapper.PictureMapper;
import com.feng.mapper.UserMapper;
import com.feng.pojo.Picture;
import com.feng.pojo.User;
import com.feng.utils.MybatisUtil;
import org.apache.ibatis.session.SqlSession;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class handleUser extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf8");
        resp.setContentType("text/html;charset=utf8");
        resp.setCharacterEncoding("utf8");
        String name = req.getParameter("name");
        String pwd = req.getParameter("pwd");
        String sex = req.getParameter("sex");
        if((!sex.equals("男"))&&(!sex.equals("女"))){
            SqlSession sqlSession = MybatisUtil.getSqlSession();
            UserMapper mapper = sqlSession.getMapper(UserMapper.class);
            User user = mapper.selectUserByName(name);
            req.setAttribute("user",user);
            req.getRequestDispatcher("UserJsp/userInfo.jsp").forward(req,resp);
        }else{
            String email = req.getParameter("email");
            String address = req.getParameter("address");
            String alias = req.getParameter("alias");
            User user = new User(name, pwd, address, alias, email, sex);
            SqlSession sqlSession = MybatisUtil.getSqlSession();
            UserMapper mapper = sqlSession.getMapper(UserMapper.class);
            mapper.updateUser(user);
            sqlSession.commit();
            User user1 = mapper.selectUserByName(name);
            req.setAttribute("user",user1);
            req.getRequestDispatcher("UserJsp/userInfo.jsp").forward(req,resp);
            sqlSession.close();
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
