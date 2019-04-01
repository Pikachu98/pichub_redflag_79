package com.pichub.hello.web;

import com.pichub.hello.bo.Album;
import com.pichub.hello.service.AlbumService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping(value = "/album")
public class AlbumController {
    @Autowired
    AlbumService albumService;

    @RequestMapping(value="/")
    public String album(HttpServletRequest request, HttpServletResponse response){
        return "album";
    }


    @RequestMapping("/create")
    @ResponseBody
    public Map<String,Object> createAlbum(Album album, HttpServletRequest request, HttpServletResponse response) throws Exception{
        Long userId = (Long) request.getSession().getAttribute("userId");
        album.setUserId(userId);
        int count =albumService.createAlbum(album);
        Map<String, Object> result = new HashMap<String, Object>();
        if(count == 1){
            result.put("msg","创建成功");
            return result;
        }
        else{
            result.put("msg","创建失败");
            return result;
        }
    }


    @RequestMapping("/{albumId}")
    @ResponseBody
    public String getAlbum(@PathVariable Long albumId, ModelMap model,
                           HttpServletRequest request, HttpServletResponse response) throws Exception{
        Album album=albumService.getAlbum(albumId);
        model.put("p",album);
        return "album";
    }

}
