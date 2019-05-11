package com.pichub.hello.service;

import com.pichub.hello.bo.Picture;
import org.springframework.ui.ModelMap;

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

    int getLove(long userId, long picId ) throws Exception;

    int getPictureId(String picName)throws Exception;
    ModelMap getTag(List<Integer> picId);

    List<Integer> getAlbumPics(int userId) throws Exception;
    void deletePicture(int pictureId)throws Exception;
    void changeStory(int pictureId, String story)throws Exception;

}
