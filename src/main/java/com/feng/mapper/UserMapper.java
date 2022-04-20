package com.feng.mapper;

import com.feng.pojo.User;

public interface UserMapper {
    int insertUser(User user);
    User selectUserByName(String name);
    void updateUser(User user);
}
