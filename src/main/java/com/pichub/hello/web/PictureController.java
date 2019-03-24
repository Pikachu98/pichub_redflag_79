package com.pichub.hello.web;

import com.pichub.hello.bo.Picture;
import com.pichub.hello.service.PictureService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by root on 19-3-16.
 */
@Controller
public class PictureController {
    @Autowired
    PictureService pictureService;

    @RequestMapping(value = "/picture/{pictureId}")
    public String pictureDetail(@PathVariable long pictureId, ModelMap model,
                                HttpServletRequest request, HttpServletResponse response)throws Exception{
        Picture picture = pictureService.getPicture(pictureId);
        model.put("p", picture);

        return "picture";
    }

    @RequestMapping(value = "/upload")
    public String upload(HttpServletRequest request, HttpServletResponse response)throws Exception
    {
        return "upload";
    }


}
