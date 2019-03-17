package com.pichub.hello.dao;

import com.pichub.hello.bo.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface UserDao {
    User getUser(@Param("userId")long userId)throws Exception;
    boolean insertUser(User user);
    boolean existsByPhone(String phone);
    boolean existsByEmail(String email);
    boolean focusUser(int userId);
}
