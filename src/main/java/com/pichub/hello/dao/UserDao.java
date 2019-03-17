package com.pichub.hello.dao;

import com.pichub.hello.bo.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface UserDao {
    boolean focusUser(Integer userId1,Integer userId2) throws Exception;
    boolean insertUser(User user);
    boolean existsByPhone(String phone);
    boolean existsByEmail(String email);
    User getUser(@Param("userId")long userId)throws Exception;
    //boolean focusUser(Integer userId);
}
