package com.pichub.hello.service;


public interface FocusService {
    boolean focusChange(Integer userId1,Integer userId2) throws Exception;
    boolean delFocus(Integer userId1,Integer userId2) throws Exception;
}
