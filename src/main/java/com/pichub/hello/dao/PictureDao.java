package com.pichub.hello.dao;

import com.pichub.hello.bo.Picture;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.List;

/**
 * Created by root on 19-3-16.
 */
@Mapper
public interface PictureDao {
    Picture getPicture(@Param("picId") int picId) throws Exception;
    int insertPicture(Picture picture)throws Exception;
    String getPictureOriginPath(long pictureId)throws Exception;
    String getPictureThumbnailPath(long pictureId)throws Exception;

    int getLove(@Param("userId")long userId,@Param("picId") long picId) throws Exception;

    List<Picture> getHotPicture() throws Exception;
    int checkMaxPictureId();
    int checkMaxPictureTagId();
    void insertTag(@Param("pictureId") long pictureId,@Param("score") double score,@Param("keyword") String keyword);

    List<Integer> getLike() throws Exception;
    List<Integer> getHotPicId() throws Exception;

    int getPictureId(@Param("picName") String picName)throws Exception;

   /* String getPicturePathByPhotoId(@Param("photoId") int photoId);*/
    List<String> getTag(int picId);

    List<Integer> getAlbumPics(@Param("userId") int userId) throws Exception;
    void deletePicture(@Param("pictureId") long pictureId)throws Exception;
    void changeStory(@Param("pictureId") long pictureId, @Param("story") String story)throws Exception;
}
