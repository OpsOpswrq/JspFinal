package com.feng.servlet;

import com.feng.mapper.UserMapper;
import com.feng.pojo.User;
import com.feng.utils.MybatisUtil;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.ibatis.session.SqlSession;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;

public class handleRegister extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf8");
        resp.setContentType("text/html;charset=utf8");
        resp.setCharacterEncoding("utf8");
        String name = req.getParameter("name");
        String pwd = req.getParameter("pwd");
        String address = req.getParameter("address");
        String alias = req.getParameter("alias");
        String sex = req.getParameter("sex");
        String email = req.getParameter("email");
        if(name==null){
            req.setAttribute("isRegister","false1");
            req.getRequestDispatcher("UserJsp/register.jsp").forward(req,resp);
        }else{
            User user =new User(name, pwd, address, alias,email,sex);
            SqlSession sqlSession = MybatisUtil.getSqlSession();
            UserMapper mapper = sqlSession.getMapper(UserMapper.class);
            User user1 = mapper.selectUserByName(name);
            if(user1==null){
                mapper.insertUser(user);
                req.setAttribute("isRegister","success");
                HttpSession session = req.getSession();
                session.setAttribute("username",name);
                sqlSession.commit();
                sqlSession.close();
                req.getRequestDispatcher("UserJsp/register.jsp").forward(req,resp);
            } else{
                req.setAttribute("isRegister","false");
                req.getRequestDispatcher("UserJsp/register.jsp").forward(req,resp);
                sqlSession.close();
            }
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
