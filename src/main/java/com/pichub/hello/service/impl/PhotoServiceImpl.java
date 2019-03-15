package com.pichub.hello.service.impl;

import com.pichub.hello.bo.Photo;
import com.pichub.hello.dao.PhotoDao;
import com.pichub.hello.service.PhotoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service("photoService")
public class PhotoServiceImpl implements PhotoService {
    @Autowired
    PhotoDao photoDao;

    @Override
    public Photo getPhoto(Long photoId) throws Exception {
        return photoDao.getPhoto(photoId);
    }

    @Override
    public List<Photo> listPhoto(Long userId) throws Exception {
        return photoDao.listPhoto(userId);
    }

    @Override
    public void insetPhoto(Photo photo) throws Exception {

        photoDao.insetPhoto(photo);
    }
}
