package com.pichub.hello.dao;

import com.pichub.hello.bo.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface UserDao {

    //关注用户功能
    boolean focusUser(Integer userId1,Integer userId2) throws Exception;
    boolean delFocus(Integer userId1,Integer userId2) throws Exception;
    int checkFocus(Integer userId1,Integer userId2) throws Exception;
    List showMyFocus(Integer userId) throws Exception;
    List showFocusMe(Integer userId) throws Exception;

    int insertUser(@Param("user") User user)throws Exception;
   // boolean existsByPhone(String phone)throws Exception;

    boolean existsByEmail(String email);

    User tOrfUser(@Param("userEmail")String userEmail,@Param("userPassword")String userPassword);
    User tOrfUserName(@Param("userEmail")String userEmail);


    User getUser(@Param("userId")Long userId)throws Exception;
    boolean focusUser(Integer userId);
    int belikeCheck(@Param("userId") Long userId, @Param("pictureId") long pictureId)throws Exception;
    boolean deleteBelike(@Param("userId") Long  userId, @Param("pictureId") long pictureId)throws Exception;
    boolean insertBelike(@Param("userId") Long userId, @Param("pictureId") long pictureId)throws Exception;
    //int insertUser(@Param("user") User user) throws Exception;
}
