package com.pichub.hello.service;

import com.pichub.hello.bo.Administrator;

public interface AdministratorService {
    Boolean doLoginStatus(String username, String password);
}