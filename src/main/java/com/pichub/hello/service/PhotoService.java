package com.pichub.hello.service;

import com.pichub.hello.bo.Photo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

public interface PhotoService {
    Photo getPhoto(Long photoId) throws Exception;
    List<Photo> listPhoto(Long userId) throws Exception;
    void insetPhoto(Photo photo) throws Exception;
}
