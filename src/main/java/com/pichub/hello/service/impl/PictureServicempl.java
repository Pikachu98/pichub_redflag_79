package com.pichub.hello.service.impl;

import com.pichub.hello.bo.Picture;
import com.pichub.hello.dao.PictureDao;
import com.pichub.hello.service.PictureService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by root on 19-3-16.
 */
@Service("pictureService")
public class PictureServicempl implements PictureService{
    @Autowired
    PictureDao pictureDao;

    public Picture getPicture(long pictureId)throws Exception{
        return pictureDao.getPicture(pictureId);
    }

    public List<Picture> getHotPicture(){
        System.out.println(pictureDao.getHotPicture());
        return pictureDao.getHotPicture();
    }
}
