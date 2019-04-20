package com.pichub.hello.service.impl;

import com.pichub.hello.bo.Album;
import com.pichub.hello.dao.AlbumDao;
import com.pichub.hello.service.AlbumService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("albumService")
public class AlbumServiceImpl implements AlbumService {
    @Autowired
    AlbumDao albumDao;

    @Override
    public Album getAlbum(Long albumId) {
        return albumDao.getAlbum(albumId);
    }

    @Override
    public List<Album> listAlbum() {
        return null;
    }

    @Override
    public Album createAlbum() {
        return null;
    }

    @Override
    public Album deleteAlbum() {
        return null;
    }

    @Override
    public int createAlbum(Album album) {
        //成功新建一个相册
        int count = albumDao.createAlbum(album);
        return count;
    }

    public List<Album> getMyAlbumList(long userId)throws Exception
    {
        return albumDao.getMyAlbumList(userId);
    }

    public boolean insertAlbumAndPicture(long picId, long albumId)throws Exception
    {
        if(albumDao.insertAlbumAndPicture(picId,albumId) > 0)
        {
            return true;
        }
        else
        {
            return false;
        }
    }

}
