package com.feng.mapper;

import com.feng.pojo.Comment;

import java.util.List;

public interface CommentMapper {
    void insertComment(Comment comment);
    void deleteCommentById(int id);
    Comment selectCommentById(int id);
    List<Comment> selectAllComments();
}
