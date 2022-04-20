package com.feng.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class User {
    private String name;
    private String pwd;
    private String address;
    private String alias;
    private String email;
    private String sex;
    public User(String name,String pwd,String address,String alias,String email,String sex){
        this.name = name;
        this.pwd = pwd;
        this.address = address;
        this.alias = alias;
        this.email = email;
        this.sex = sex;
    }
}
