package com.feng.servlet;

import com.feng.mapper.CommentMapper;
import com.feng.pojo.Comment;
import com.feng.utils.MybatisUtil;
import org.apache.ibatis.session.SqlSession;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class handleComment extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf8");
        resp.setContentType("text/html;charset=utf8");
        resp.setCharacterEncoding("utf8");
        String content = req.getParameter("comment");
        String userName = req.getParameter("userName");
        Comment comment = new Comment(userName, content);
        SqlSession sqlSession = MybatisUtil.getSqlSession();
        CommentMapper mapper = sqlSession.getMapper(CommentMapper.class);
        mapper.insertComment(comment);
        sqlSession.commit();
        sqlSession.close();
        resp.sendRedirect("commentJsp/comment.jsp");
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
