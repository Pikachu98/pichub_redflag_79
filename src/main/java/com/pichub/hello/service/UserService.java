package com.pichub.hello.service;

import com.pichub.hello.bo.User;

public interface UserService {



    int checkLogin(String userEmail, String userPassword);
    User getUser(Long userId)throws Exception;
    int insertUser(User user) throws Exception;
    boolean belikeCheck(Long userId, long pictureId)throws Exception;
    boolean deleteBelike(Long  userId, long pictureId)throws Exception;
    boolean insertBelike(Long userId, long pictureId)throws Exception;
    // boolean isPwd(String userpassword);

}
