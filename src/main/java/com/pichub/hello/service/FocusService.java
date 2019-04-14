package com.pichub.hello.service;


import com.pichub.hello.bo.Album;
import com.pichub.hello.bo.Picture;
import com.pichub.hello.bo.User;

import java.util.List;

public interface FocusService {
    boolean focusChange(Integer userId1,Integer userId2) throws Exception;
    boolean delFocus(Integer userId1,Integer userId2) throws Exception;
    int checkFocus(Integer userId1,Integer userId2) throws Exception;
    List<User> showMyFocus(Integer userId) throws Exception;
    List<User> showFocusMe(Integer userId) throws Exception;
    List<Picture> showMyLike(Integer userId) throws Exception;
    List<Album> showMyAlbum(Integer userId) throws Exception;
    boolean changeUsername(Integer userId, String userName) throws Exception;
}
