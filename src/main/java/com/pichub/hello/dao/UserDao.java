package com.pichub.hello.dao;

import com.pichub.hello.bo.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface UserDao {
    boolean focusUser(Integer userId1,Integer userId2) throws Exception;
    //boolean delFocus(Integer userId1,Integer userId2) throws Exception;
    boolean insertUser(User user)throws Exception;
    boolean existsByPhone(String phone)throws Exception;
    //boolean existsByEmail(String email);
    User getUser(@Param("userId")long userId)throws Exception;
    //boolean focusUser(Integer userId);
    int belikeCheck(@Param("userId") long userId, @Param("pictureId") long pictureId)throws Exception;
    boolean deleteBelike(@Param("userId") long userId, @Param("pictureId") long pictureId)throws Exception;
    boolean insertBelike(@Param("userId") long userId, @Param("pictureId") long pictureId)throws Exception;
}
