package com.pichub.hello.service;

import com.pichub.hello.bo.User;

public interface UserService {
    boolean saveUser(User user) throws  Exception;
}
