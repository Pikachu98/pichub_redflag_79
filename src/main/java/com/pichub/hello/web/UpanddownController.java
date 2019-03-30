package com.pichub.hello.web;

import com.pichub.hello.service.PictureService;
import com.pichub.hello.bo.Picture;
import com.sun.image.codec.jpeg.JPEGCodec;
import com.sun.image.codec.jpeg.JPEGEncodeParam;
import com.sun.image.codec.jpeg.JPEGImageEncoder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.UUID;
import java.util.Date;
/**
 * Created by root on 19-3-24.
 */
@Controller
public class UpanddownController {
    @Autowired
    PictureService pictureService;

    @RequestMapping(value = "/uploadFile" ,method = RequestMethod.POST)
    public String uploadFile(@RequestParam(value="file") MultipartFile file, @RequestParam(value = "story")String story,
                             @RequestParam(value = "userId") long userId, HttpServletRequest request, HttpServletResponse response)
    {
        if(file == null && file.getSize() > 0)
        {
            return "{" + "false" + "}";
        }

        //insert origin picture
        String fileName = file.getOriginalFilename();
        String exName = fileName.substring(fileName.lastIndexOf(".") + 1 );
        String newOriginiName = UUID.randomUUID().toString().replaceAll("-","") + "." + exName;
        String originPicturePath = getParent(request.getServletContext().getRealPath("/"))
                             + "resources/originPictures/";

        String finalOriginPath = originPicturePath +newOriginiName;
        FileOutputStream fos = null;//upload origin picture
        try {
            fos = new FileOutputStream(finalOriginPath);
            fos.write(file.getBytes());
        }catch (Exception e)
        {
            e.printStackTrace();
        } finally {
            if (fos != null) {
                try {
                    fos.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }


        //insert thumbnail picture
        String newThumbnailName = UUID.randomUUID().toString().replaceAll("-","") + "." + exName;
        String thumbnailPath = getParent(request.getServletContext().getRealPath("/"))
                              + "resources/static/thumbnail/";
        String finalThumbnailPath = thumbnailPath + newThumbnailName;
        fos = null;
        try{
            fos = new FileOutputStream(finalThumbnailPath);
            fos.write(file.getBytes());


        }catch (Exception e)
        {
            e.printStackTrace();
        }finally {
            if (fos != null) {
                try {
                    fos.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }

        File tFile;
        if(exName!="jpg")
        {
            tFile = new File(conversion(finalThumbnailPath));
        }
        else
        {
            tFile = new File(finalThumbnailPath);
        }
        handleDpi(tFile,300,300);


        //insert to database
        Picture picture = new Picture();
        picture.setPicName(newOriginiName);
        picture.setUploadTime(new Date());
        picture.setDelState(1);
        picture.setPicStory(story);
        picture.setUserId(userId);
        picture.setPicPath(real2realative(finalOriginPath));
        picture.setPicThumbnailPath(real2realative(finalThumbnailPath));
        picture.setPicSize(file.getSize());
        try {
            pictureService.insertPicture(picture);
        } catch (Exception e) {
            e.printStackTrace();
        }



        return "{" + "true" + "}";

    }



    private void handleDpi(File file, int xDensity, int yDensity) {//change Dpi
        try {
            BufferedImage image = ImageIO.read(file);
            JPEGImageEncoder jpegEncoder = JPEGCodec.createJPEGEncoder(new FileOutputStream(file));
            JPEGEncodeParam jpegEncodeParam = jpegEncoder.getDefaultJPEGEncodeParam(image);
            jpegEncodeParam.setDensityUnit(JPEGEncodeParam.DENSITY_UNIT_DOTS_INCH);
            jpegEncoder.setJPEGEncodeParam(jpegEncodeParam);
            jpegEncodeParam.setQuality(0.75f, false);
            jpegEncodeParam.setXDensity(xDensity);
            jpegEncodeParam.setYDensity(yDensity);
            jpegEncoder.encode(image, jpegEncodeParam);
            image.flush();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }



    private String getParent(String realPath)
    {
        String str = realPath.substring(0,realPath.lastIndexOf(File.separator));
        return str.substring(0,str.lastIndexOf(File.separator) + 1);
    }



    private String real2realative(String realPath)
    {
        return realPath.substring(realPath.indexOf("main"));
    }


    private String  conversion(String realPath)
    {
        File input = new File(realPath);
        System.out.println(realPath);
        String outputFilePath = realPath.substring(0,realPath.lastIndexOf(".")) + ".jpg";
        try {
            BufferedImage bim = ImageIO.read(input);
            BufferedImage newBim = new BufferedImage(bim.getWidth(),bim.getHeight(),BufferedImage.TYPE_INT_RGB);
            newBim.setData(bim.getData());
            //newBim.createGraphics().drawImage(bim,0,0,Color.white,null);
            File output = new File(outputFilePath);
            ImageIO.write(bim,"jpg",output);
        }catch (IOException e)
        {
            e.printStackTrace();
        }

        return outputFilePath;
    }


}
