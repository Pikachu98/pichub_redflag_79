package com.pichub.hello.service.impl;

import com.drew.imaging.ImageMetadataReader;
import com.drew.imaging.ImageProcessingException;
import com.drew.metadata.Directory;
import com.drew.metadata.Metadata;
import com.drew.metadata.Tag;
import com.pichub.hello.bo.Picture;
import com.pichub.hello.dao.PictureDao;
import com.pichub.hello.service.PictureService;
import net.coobird.thumbnailator.Thumbnails;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.File;
import java.io.IOException;

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
        return pictureDao.getHotPicture();
    }

    public int insertPicture(Picture picture)throws Exception{
        return pictureDao.insertPicture(picture);
    }


    @Override
    public Picture getThumbnail() {
        try {
            Thumbnails.of("D:/123.jpg")//原图文件的路径
                    .scale(1f)
                    .outputQuality(0.5f)
                    .toFile("D:/345.jpg");
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public String getExif() {
        File jpegFile = new File("D:/123.jpg");
        Metadata metadata = null;
        try {
            metadata = ImageMetadataReader.readMetadata(jpegFile);
        } catch (ImageProcessingException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        for (Directory directory : metadata.getDirectories()) {
            for (Tag tag : directory.getTags()) {
                //格式化输出[directory.getName()] - tag.getTagName() = tag.getDescription()
                System.out.format("[%s] - %s = %s\n",
                        directory.getName(), tag.getTagName(), tag.getDescription());
            }
            if (directory.hasErrors()) {
                for (String error : directory.getErrors()) {
                    System.err.format("ERROR: %s", error);
                }
            }
        }
        return null;
    }
}
