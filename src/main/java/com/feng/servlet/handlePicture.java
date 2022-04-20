package com.feng.servlet;

import com.feng.mapper.PictureMapper;
import com.feng.pojo.Picture;
import com.feng.utils.MybatisUtil;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
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

public class handlePicture extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        FileItemFactory factory = new DiskFileItemFactory();
        ServletFileUpload fileUpload = new ServletFileUpload(factory);
        List<FileItem> items = null;
        try {
            items = fileUpload.parseRequest(req);
        } catch (FileUploadException e) {
            e.printStackTrace();
        }
        Iterator iterator = items.iterator();
        while(iterator.hasNext()){
            FileItem next = (FileItem) iterator.next();
            if(!next.isFormField()){
                String fileName = next.getName();
                int index = fileName.lastIndexOf("\\");
                fileName = fileName.substring(index + 1);
                SqlSession sqlSession = MybatisUtil.getSqlSession();
                PictureMapper mapper = sqlSession.getMapper(PictureMapper.class);
                HttpSession session = req.getSession();
                String username = (String) session.getAttribute("username");
                mapper.insertPicturePath(new Picture(username,"/feng/upload/"+fileName));
                sqlSession.commit();
                sqlSession.close();
                String basePath = req.getServletContext().getRealPath("/upload");
                File file = new File(basePath,fileName);
                try {
                    next.write(file);
                }
                catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        req.getRequestDispatcher("UserJsp/register.jsp").forward(req,resp);
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
