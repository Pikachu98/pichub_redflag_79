package com.pichub.hello.service;


import java.util.List;

public interface FocusService {
    boolean focusChange(Integer userId1,Integer userId2) throws Exception;
    boolean delFocus(Integer userId1,Integer userId2) throws Exception;
    int checkFocus(Integer userId1,Integer userId2) throws Exception;
    List showMyFocus(Integer userId) throws Exception;
    List showFocusMe(Integer userId) throws Exception;
    List showMyLike(Integer userId) throws Exception;
    List showMyAlbum(Integer userId) throws Exception;
    boolean changeUsername(Integer userId, String userName) throws Exception;
}
