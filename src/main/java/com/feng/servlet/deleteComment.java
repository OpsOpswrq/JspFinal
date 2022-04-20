package com.feng.servlet;

import com.feng.mapper.CommentMapper;
import com.feng.pojo.Comment;
import com.feng.utils.MybatisUtil;
import org.apache.ibatis.session.SqlSession;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.IOException;
import java.util.List;

public class deleteComment extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf8");
        resp.setCharacterEncoding("utf8");
        resp.setContentType("application/json");
        BufferedReader reader = req.getReader();
        String s = reader.readLine();
        String[] split = s.split(":");
        String substring = split[1].substring(0, split[1].length() - 1);
        SqlSession sqlSession = MybatisUtil.getSqlSession();
        CommentMapper mapper = sqlSession.getMapper(CommentMapper.class);
        mapper.deleteCommentById(Integer.parseInt(substring));
        List<Comment> comments = mapper.selectAllComments();
        req.setAttribute("comments",comments);
        req.setAttribute("count","continue");
        req.getRequestDispatcher("commentJsp/comment.jsp").forward(req,resp);
        sqlSession.commit();
        sqlSession.close();
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
