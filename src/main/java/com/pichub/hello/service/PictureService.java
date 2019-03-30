package com.pichub.hello.service;

import com.pichub.hello.bo.Picture;

import java.util.List;

/**
 * Created by root on 19-3-16.
 */
public interface PictureService {
    Picture getPicture(long pictureId) throws Exception;
    List<Picture> getHotPicture();
}
