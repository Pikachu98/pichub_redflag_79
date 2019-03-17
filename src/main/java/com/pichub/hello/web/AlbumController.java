package com.pichub.hello.web;

import com.pichub.hello.bo.Album;
import com.pichub.hello.service.AlbumService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
public class AlbumController {
    @Autowired
    AlbumService albumService;

    @RequestMapping("/album/{albumId}")
    public String getAlbum(@PathVariable Long albumId, ModelMap model,
                           HttpServletRequest request, HttpServletResponse response) throws Exception{
        Album album=albumService.getAlbum(albumId);
        model.put("p",album);
        return "album";
    }

}
