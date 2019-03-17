package com.pichub.hello.service.impl;

import com.pichub.hello.dao.UserDao;
import com.pichub.hello.service.FocusService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("focusService")
public class FocusServicelmpl implements FocusService {
    @Autowired
    private UserDao userDao;
    public boolean focusChange(Integer userId1,Integer userId2) throws Exception {
        return userDao.focusUser(userId1,userId2);
    }

    public boolean delFocus(Integer userId1, Integer userId2) throws Exception {
        return false;
    }


}

