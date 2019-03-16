package com.pichub.hello.dao;

import com.pichub.hello.bo.User;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserDao {
    boolean insertUser(User user);
    boolean existsByPhone(String phone);
    boolean existsByEmail(String email);
    boolean focusUser(int userId);
}
