package com.pichub.hello.dao;

import com.pichub.hello.bo.Picture;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by root on 19-3-16.
 */
@Mapper
public interface PictureDao {
    Picture getPicture(@Param("pictureId") long pictureId) throws Exception;
    int insertPicture(Picture picture)throws Exception;

    List<Picture> getHotPicture() throws Exception;
    long checkMaxPictureId();
    long checkMaxPictureTagId();
    void insertTag(@Param("pictureId") long pictureId,@Param("score") double score,@Param("keyword") String keyword);

}
