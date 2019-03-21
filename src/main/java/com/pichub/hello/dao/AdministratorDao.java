package com.pichub.hello.dao;

import com.pichub.hello.bo.Administrator;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface AdministratorDao {
    //管理员登陆，查询用户名密码是否匹配
    Administrator getAdministrator(@Param("username") String username,@Param("password") String password);
}
