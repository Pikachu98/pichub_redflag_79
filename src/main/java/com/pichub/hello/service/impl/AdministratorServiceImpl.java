package com.pichub.hello.service.impl;

import com.pichub.hello.dao.AdministratorDao;
import com.pichub.hello.service.AdministratorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service("administratorService")
public class AdministratorServiceImpl implements AdministratorService {
    @Autowired
    AdministratorDao administratorDao;

    @Override
    public Boolean doLoginStatus(String username, String password) {
        if (administratorDao.getAdministrator(username, password) != null)
            return true;
        return false;
    }

    public Boolean checkOldPwd(String username, String oldPassword) {

        if (administratorDao.checkOldPwd(username).getPassword().equals(oldPassword)) {
            return true;
        } else {
            System.out.println("原密码检查未通过");
            return false;
        }

    }

    public Boolean updatePwd(String username, String newPassword) {
        administratorDao.updatePwd(username, newPassword);
        return true;
    }

}






