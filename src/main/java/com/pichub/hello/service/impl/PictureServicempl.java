package com.pichub.hello.service.impl;

import com.pichub.hello.bo.Picture;
import com.pichub.hello.dao.PictureDao;
import com.pichub.hello.service.PictureService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by root on 19-3-16.
 */
@Service
public class PictureServicempl implements PictureService{
    @Autowired
    PictureDao pictureDao;

    public Picture getPicture(long pictureId)throws Exception{
        return pictureDao.getPicture(pictureId);
    }
}
