package com.pichub.hello.web;

import com.pichub.hello.bo.Photo;
import com.pichub.hello.service.PhotoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
public class HomeController {
    @Autowired
    PhotoService photoService;

    //@Autowired
    //PhotoDao photoDao;
    //http://url/photo/photoid
    /*@RequestMapping(value = "/photo")
    public String index() {

        return "index";
    }*/
    @RequestMapping(value = "/photo/{photoId}")
    public String photoDetail(@PathVariable Long photoId,ModelMap model,
                              HttpServletRequest request, HttpServletResponse response) throws Exception {

        Photo photo = photoService.getPhoto(photoId);
        model.put("p",photo);

        return "photo";
    }
}
