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
    public int checkLogin(String userEmail, String userPassword){
        if(userDao.tOrfUserName(userEmail)!=null){
            if (userDao.tOrfUser(userEmail,userPassword)!=null)
                return 200;//欢迎登陆
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
}
