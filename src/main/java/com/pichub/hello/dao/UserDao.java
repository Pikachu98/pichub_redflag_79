package com.pichub.hello.dao;

import com.pichub.hello.bo.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface UserDao {
    boolean focusUser(long userId1,long userId2) throws Exception;
    boolean insertUser(User user);
    boolean existsByPhone(String phone);
    boolean existsByEmail(String email);
    //boolean focusUser(Integer userId);
    int belikeCheck(@Param("userId") long userId, @Param("pictureId") long pictureId)throws Exception;
    boolean deleteBelike(@Param("userId") long userId, @Param("pictureId") long pictureId)throws Exception;
    boolean insertBelike(@Param("userId") long userId, @Param("pictureId") long pictureId)throws Exception;
}
