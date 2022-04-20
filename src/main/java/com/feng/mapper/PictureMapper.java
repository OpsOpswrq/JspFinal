package com.feng.mapper;

import com.feng.pojo.Picture;

public interface PictureMapper {
    String getPathByName(String name);
    String getBlogByName(String name);
    void insertPicturePath(Picture picture);
}
