package com.pichub.hello.service;

import com.pichub.hello.bo.Administrator;

public interface AdministratorService {
    Boolean doLoginStatus(String username, String password);
    Boolean checkOldPwd(String username,String oldPassword);
    Boolean updatePwd(String username,String oldPassword);

}