package com.pichub.hello.service.impl;

import com.pichub.hello.dao.UserDao;
import com.pichub.hello.service.FocusService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("FocusService")
public class FocusServicelmpl implements FocusService {
    @Autowired
    private UserDao userDao;
    public boolean focusChange(int userId) throws Exception {
        return userDao.focusUser(userId);
    }
}

