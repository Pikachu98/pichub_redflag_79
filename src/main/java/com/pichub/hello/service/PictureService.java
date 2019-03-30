package com.pichub.hello.service;

import com.pichub.hello.bo.Picture;

/**
 * Created by root on 19-3-16.
 */
public interface PictureService {
    Picture getPicture(long pictureId) throws Exception;
    Picture getThumbnail();//将原图压缩至500K左右
    String getExif();//获取图片exif信息
}