package com.pichub.hello.dao;

import com.pichub.hello.bo.Photo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
@Mapper
public interface PhotoDao {
    Photo getPhoto(@Param("photoId") Long photoId) throws Exception;
    List<Photo> listPhoto(@Param("userId") Long userId) throws Exception;
    void insetPhoto(@Param("photo") Photo photo) throws Exception;
    void deletePhoto(@Param("photo") Photo photo) throws Exception;

}
