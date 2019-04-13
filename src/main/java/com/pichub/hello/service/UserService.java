package com.pichub.hello.service;

import com.pichub.hello.bo.User;

import javax.servlet.http.HttpServletRequest;

public interface UserService {



    int checkLogin(User user, HttpServletRequest request);
    User getUser(Long userId)throws Exception;
    int changePassword(String userEmail, String userPassword) throws Exception;



    int insertUser(User user) throws Exception;
    boolean belikeCheck(Long userId, long pictureId)throws Exception;
    boolean deleteBelike(Long  userId, long pictureId)throws Exception;
    boolean insertBelike(Long userId, long pictureId)throws Exception;

    String getUserName(String userEmail);
    int checkEmail(String email);
    int doChangeEmail(String oldEmail, String oldCheckCod, String oldEmailCheckCode, String newEmail, String newCheckCode, String newEmailCheckCode);
    String getAvatarPath(long userId);
    boolean GenerateImage(String imgStr);
    void changeAvatar(long userId, String avatarPath)throws Exception;

    User getUser(long userId) throws Exception;
}
