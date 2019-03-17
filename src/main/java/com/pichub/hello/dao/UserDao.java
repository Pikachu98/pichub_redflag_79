package com.pichub.hello.dao;

import com.pichub.hello.bo.User;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserDao {
    boolean focusUser(long userId1,long userId2) throws Exception;
    boolean insertUser(User user);
    boolean existsByPhone(String phone);
    boolean existsByEmail(String email);
    //boolean focusUser(Integer userId);
}
