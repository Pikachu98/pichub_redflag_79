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

    List<Picture> getHotPicture() throws Exception;
    List<Integer> getLike() throws Exception;
    List<Integer> getHotPicId() throws Exception;

    String getPicturePathByPhotoId(@Param("photoId") int photoId);
}
