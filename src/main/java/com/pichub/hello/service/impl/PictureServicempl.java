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
import org.springframework.ui.ModelMap;

import java.io.File;
import java.io.IOException;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by root on 19-3-16.
 */
@Service("pictureService")
public class PictureServicempl implements PictureService{
    @Autowired
    PictureDao pictureDao;

    public Picture getPicture(int picId)throws Exception{
        return pictureDao.getPicture(picId);
    }

    public List<Picture> getHotPicture() throws Exception{
        return pictureDao.getHotPicture();
    }

    @Override
    public List<Integer> getLike() throws Exception {
        return pictureDao.getLike();
    }

    @Override
    public List<Integer> getHotPicId() throws Exception {
        List<Integer> lala = pictureDao.getHotPicId();
        for(int i =0; i<lala.size();i++)
            System.out.println(lala.get(i) + "我在这呢看这里看着了");
        return pictureDao.getHotPicId();
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


    public int getPictureId(String picName)throws Exception {
        return pictureDao.getPictureId(picName);
    }

    @Override
    public ModelMap getTag(List<Integer> picId) {
        ModelMap tag=null;
        for (int i=0;i<picId.size();i++){
            tag.put("picId="+i,pictureDao.getTag(picId.get(i)));
        }
        return tag;
    }

    @Override
    public List<Integer> getAlbumPics(int userId) throws Exception {
        return pictureDao.getAlbumPics(userId);
    }


}
