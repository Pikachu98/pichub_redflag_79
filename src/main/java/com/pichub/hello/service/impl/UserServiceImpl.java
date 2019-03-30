package com.pichub.hello.service.impl;

import com.pichub.hello.bo.Photo;
import com.pichub.hello.bo.User;
import com.pichub.hello.dao.UserDao;
import com.pichub.hello.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.List;

@Service("userService")
public class UserServiceImpl implements UserService {
    @Autowired
    UserDao userDao;

    @Override
    public int checkLogin(User user){

        if(userDao.tOrfUserName(user.getUserEmail())!=null){
            if (userDao.tOrfUser(user.getUserEmail(),user.getUserPassword())!=null) {
                return 200;//欢迎登陆
            }
            return 150;//密码错误
        }

        else
            return 100;//用户名不存在

    }






//    @Override
//    public boolean isPwd(String userpassword) {
//        if(userpassword == #{password})
//        return false;
//    }

    @Override
    public User getUser(Long userId)throws Exception{
        return userDao.getUser(userId);
    }

    @Override
    public int insertUser(User user) throws Exception {

        return userDao.insertUser(user);
    }

    public boolean belikeCheck(Long  userId, long pictureId)throws Exception{
        int flag = userDao.belikeCheck(userId, pictureId);
        if(flag > 0)    return true;
        else return false;
    }

    public boolean deleteBelike(Long  userId, long pictureId)throws Exception{
        return userDao.deleteBelike(userId, pictureId);
    }

    public boolean insertBelike(Long userId, long pictureId)throws Exception{
        return userDao.insertBelike(userId, pictureId);
    }

    @Override
    public String getUserName(String userEmail) {
        return userDao.getUserName(userEmail);
    }

    @Override
    public int checkEmail(String email) {
        if (userDao.checkEmail(email) != null)
            return 10;//10表示已有此email
        return 15;//15表示无此email
    }

    @Override
    public int doChangeEmail(String oldEmail, String oldCheckCod, String oldEmailCheckCode, String newEmail, String newCheckCode, String newEmailCheckCode) {
        if(oldCheckCod.equals(oldEmailCheckCode)!=true|| newCheckCode.equals(newEmailCheckCode)!=true)
            return 100;
        else if (checkEmail(oldEmail)==15)
            return 150;
        else if(checkEmail(oldEmail)==10)
            return 200;
        else if(oldCheckCod.equals(oldEmailCheckCode)&&newCheckCode.equals(newEmailCheckCode)&&checkEmail(oldEmail)==15&&checkEmail(oldEmail)==10){
            userDao.changeEmail(oldEmail,newEmail);
            return 250;
        }
        else
            return 0;
    }
}
