package com.pichub.hello.service;

import com.pichub.hello.bo.User;

public interface UserService {
    boolean saveUser(User user) throws  Exception;
   // boolean isPwd(String userpassword);

    User tOrfUser(String userEmail, String userPassword) throws Exception;
    User getUser(long userId)throws Exception;
    boolean belikeCheck(long userId, long pictureId)throws Exception;
    boolean deleteBelike(long userId, long pictureId)throws Exception;
    boolean insertBelike(long userId, long pictureId)throws Exception;
}
