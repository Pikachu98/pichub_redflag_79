package com.pichub.hello.service;

import com.pichub.hello.bo.Album;
import com.pichub.hello.bo.Picture;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AlbumService {
    Album getAlbum(Long albumId) throws Exception;
    List<Album> listAlbum(long userId);
    Album createAlbum();
    Album deleteAlbum();
    int createAlbum(Album album);

    public List<Album> getMyAlbumList(long userId)throws Exception;
    boolean insertAlbumAndPicture(long picId, long albumId)throws Exception;



    List<Picture> getPictures(Long albumId);

}
