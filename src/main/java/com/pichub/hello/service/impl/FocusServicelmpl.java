package com.pichub.hello.service.impl;

import com.pichub.hello.dao.UserDao;
import com.pichub.hello.service.FocusService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("focusService")
public class FocusServicelmpl implements FocusService {
    @Autowired
    private UserDao userDao;
    public boolean focusChange(Integer userId1,Integer userId2) throws Exception {
        return userDao.focusUser(userId1,userId2);
    }

    public boolean delFocus(Integer userId1, Integer userId2) throws Exception {
        return userDao.delFocus(userId1,userId2);
    }

    public int checkFocus(Integer userId1, Integer userId2) throws Exception {
        return userDao.checkFocus(userId1,userId2);
    }

    @Override

    public List<Integer> showMyFocus(Integer userId) throws Exception {

        return userDao.showMyFocus(userId);
    }

    @Override
    public List<Integer> showFocusMe(Integer userId) throws Exception {

        return userDao.showFocusMe(userId);
    }


    public List<Integer> showMyLike(Integer userId) throws Exception {
        return userDao.showMyLike(userId);
    }

    @Override

    public List<Integer> showMyAlbum(Integer userId) throws Exception {

        return userDao.showMyAlbum(userId);
    }

    @Override
    public boolean changeUsername(Integer userId, String userName) throws Exception {
        return userDao.changeUsername(userId,userName);
    }

}

