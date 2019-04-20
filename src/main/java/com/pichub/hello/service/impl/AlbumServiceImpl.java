package com.pichub.hello.service.impl;

import com.pichub.hello.bo.Album;
import com.pichub.hello.bo.Picture;
import com.pichub.hello.dao.AlbumDao;
import com.pichub.hello.dao.PictureDao;
import com.pichub.hello.service.AlbumService;
import com.pichub.hello.service.PictureService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service("albumService")
public class AlbumServiceImpl implements AlbumService {
    @Autowired
    AlbumDao albumDao;

    @Autowired
    PictureDao pictureDao;

    @Autowired
    PictureService pictureService;

    @Override
    public Album getAlbum(Long albumId) {
        return albumDao.getAlbum(albumId);
    }

    @Override
    public List<Album> listAlbum(long userId) {
        return albumDao.listAlbum(userId);
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

    @Override
    public List<Picture> getPictures(Long albumId) {
        List<Picture> pics = new ArrayList<Picture>();
        List<Integer> picIds = albumDao.getPictures(albumId);
        if(picIds.size()==0){
            return null;
        }
        for (int i = 0; i < picIds.size(); i++){
            try {
                pics.add(pictureService.getPicture(picIds.get(i)));
            } catch (Exception e) {
                System.out.print("AlbumServiceImpl.java的getPictures方法产生异常");
                e.printStackTrace();
            }
        }
        return pics;
    }
}
