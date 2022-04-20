package com.feng.servlet;

import com.feng.mapper.PictureMapper;
import com.feng.utils.MybatisUtil;
import org.apache.ibatis.session.SqlSession;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class handleFoodPicture extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        SqlSession sqlSession = MybatisUtil.getSqlSession();
        PictureMapper mapper = sqlSession.getMapper(PictureMapper.class);
        String[] paths = new String[4];
        String[] texts = new String[4];
        texts[2] = mapper.getBlogByName("米粉蒸肉");
        texts[1] = mapper.getBlogByName("瓦罐汤");
        texts[0] = mapper.getBlogByName("南昌拌粉");
        paths[2] = mapper.getPathByName("米粉蒸肉");
        paths[1] = mapper.getPathByName("瓦罐汤");
        paths[0] = mapper.getPathByName("南昌拌粉");
        req.setAttribute("paths",paths);
        req.setAttribute("texts",texts);
        sqlSession.close();
        req.getRequestDispatcher("html/有名小吃.jsp").forward(req,resp);
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
