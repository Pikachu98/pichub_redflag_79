package com.pichub.hello.dao;

import com.pichub.hello.bo.Album;
import com.pichub.hello.bo.Picture;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface AlbumDao {

    Album getAlbum(@Param("album_id") Long album_id);

    //相册列表
    List<Album> listAlbum(@Param("user_id") Long user_id);

    //新建相册
    int createAlbum(@Param("album") Album album);

    //删除相册
    Album deleteAlbum(@Param("album_id") Long album_id);

    List<Album> getMyAlbumList(@Param("userId") long userId)throws Exception;
    int insertAlbumAndPicture(@Param("picId")long picId, @Param("albumId")long albumId)throws Exception;

    //得到相册内的相片id
    List<Integer> getPictures(@Param("albumId") Long albumId);

}
