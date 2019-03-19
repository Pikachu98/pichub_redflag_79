package com.pichub.hello.service.impl;

import com.pichub.hello.bo.User;
import com.pichub.hello.dao.UserDao;
import com.pichub.hello.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

@Service("userService")
public class UserServiceImpl implements UserService {
    @Autowired
    private UserDao userDao;

    public boolean saveUser(User user)  throws  Exception {
        if (user.getUserName()==null || user.getUserName().trim().length()==0) {
            throw new Exception("User name is empty!");
        }
        boolean exists= false;
        exists = userDao.existsByPhone("");
        if (exists) {
            throw new Exception("User 's phone is exists");
        }
        return userDao.insertUser(user) ;
    }

    public User getUser(long userId)throws Exception{
        return userDao.getUser(userId);
    }

    public boolean belikeCheck(long userId, long pictureId)throws Exception{
        int flag = userDao.belikeCheck(userId, pictureId);
        if(flag > 0)    return true;
        else return false;
    }

    public boolean deleteBelike(long userId, long pictureId)throws Exception{
        return userDao.deleteBelike(userId, pictureId);
    }

    public boolean insertBelike(long userId, long pictureId)throws Exception{
        return userDao.insertBelike(userId, pictureId);
    }
}
