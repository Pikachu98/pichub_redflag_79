package com.pichub.hello.web;

import com.pichub.hello.bo.Picture;
import com.pichub.hello.dao.PictureDao;
import com.pichub.hello.service.PictureService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * Created by root on 19-3-16.
 */
@Controller
public class PictureController {
    @Autowired
    PictureService pictureService;

    @Autowired
    PictureDao pictureDao;


    @RequestMapping(value = "/picture/{picId}")
    public String pictureDetail(@PathVariable int picId, ModelMap model,
                                HttpServletRequest request, HttpServletResponse response)throws Exception{
        Picture picture = pictureService.getPicture(picId);
        model.put("p", picture);

        return "photo/show";
    }

    @RequestMapping(value = "/upload")
    public String upload(HttpServletRequest request, HttpServletResponse response)throws Exception
    {
        return "upload";
    }

    @RequestMapping(value = "/getThumbnail")
    @ResponseBody
    public String Thumbnail(HttpServletRequest request, HttpServletResponse response)
    {
        pictureService.getThumbnail();
        return null;
    }

    @RequestMapping(value = "/getExif")
    @ResponseBody
    public String getExif(HttpServletRequest request, HttpServletResponse response)
    {
        pictureService.getExif();
        return null;
    }

    @RequestMapping(value = "/picture-detail/{picId}")
    public String pictureDetail(@PathVariable int picId,ModelMap model) throws Exception{
        model.put("picTag",pictureDao.getTag(picId));
        model.put("picId",picId);
        try {
            Picture p = pictureService.getPicture(picId);
            model.put("picture",p);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "picture-detail";
    }

    @RequestMapping("/deletePicture")
    public void deletePicture(int picId, HttpServletRequest request, HttpServletResponse response)throws Exception
    {
        pictureService.deletePicture(picId);
    }

    @RequestMapping("/changeStory")
    public void changeStory(int picId, String story, HttpServletResponse response, HttpServletRequest request)throws Exception
    {
        pictureService.changeStory(picId,story);
    }
}