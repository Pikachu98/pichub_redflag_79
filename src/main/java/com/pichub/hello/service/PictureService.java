package com.pichub.hello.service;

import com.pichub.hello.bo.Picture;

import java.util.List;

/**
 * Created by root on 19-3-16.
 */
public interface PictureService {
    Picture getPicture(int picId) throws Exception;
    Picture getThumbnail();//将原图压缩至500K左右
    String getExif();//获取图片exif信息
    int insertPicture(Picture picture)throws Exception;
    List<Picture> getHotPicture() throws Exception;
    List<Integer> getLike() throws Exception;
    List<Integer> getHotPicId() throws Exception;


}
