package com.pichub.hello.dao;

import com.pichub.hello.bo.Album;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface AlbumDao {
    Album getAlbum(@Param("album_id") Long album_id) throws Exception;
    List<Album> listAlbum(@Param("user_id") Long album_id) throws Exception;
    Album createAlbum(@Param("album") Album album) throws Exception;
    Album deleteAlbum(@Param("album_id") Long album_id) throws Exception;
}
