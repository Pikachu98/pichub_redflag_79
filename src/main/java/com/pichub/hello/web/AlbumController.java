package com.pichub.hello.web;

import com.pichub.hello.bo.Album;
import com.pichub.hello.bo.Picture;
import com.pichub.hello.bo.User;
import com.pichub.hello.service.AlbumService;
import com.pichub.hello.service.FocusService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class AlbumController {
    @Autowired
    AlbumService albumService;
    @Autowired
    FocusService focusService;

    @RequestMapping("/create")
    @ResponseBody
    public Map<String,Object> createAlbum(Album album, HttpServletRequest request, HttpServletResponse response) {
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


    @RequestMapping("/getAlbum/{albumId}")
    @ResponseBody
    public String getAlbum(@PathVariable Long albumId, ModelMap model,
                           HttpServletRequest request, HttpServletResponse response) throws Exception{
        Album album=albumService.getAlbum(albumId);
        model.put("p",album);
        return "album";
    }

    @RequestMapping("/myAlbum")
    public String myAlbum(ModelMap model,HttpServletRequest request)throws Exception
    {
        List<Album> myAlbumList = albumService.getMyAlbumList(User.getCurrentUser(request).getUserId());
        model.put("MyFocus",focusService.showMyFocus(User.getCurrentUser(request).getUserId().intValue()).size());
        model.put("FocusMe",focusService.showFocusMe(User.getCurrentUser(request).getUserId().intValue()).size());

        model.put("albumList",myAlbumList);

        listAlbum(model,request);
        return "myalbum";

    }

    @RequestMapping(value = "/myAlbum/listAlbum",method = RequestMethod.POST)
    @ResponseBody
    public int listAlbum(ModelMap model,HttpServletRequest request){
        model.put("listAlbum",albumService.listAlbum(User.getCurrentUser(request).getUserId()));
        return 1;
    }

    @RequestMapping(value = "/myAlbum/listPicture",method = RequestMethod.POST)
    @ResponseBody
    public List<Picture> listPicture(ModelMap model, HttpServletRequest request, long albumId){
        albumId = Long.parseLong(request.getParameter("albumId"));
        model.put("listPicture",albumService.getPictures(albumId));//albumService.getPictures(albumId)方法需要检查调试
        if (albumService.getPictures(albumId)==null)
            return null;
        return albumService.getPictures(albumId);
    }

    @RequestMapping(value = "/albumContent/{albumId}",method = RequestMethod.POST)
    public String getAlbumContent(@PathVariable("albumId") Long albumId, String pathName, ModelMap model, HttpServletRequest request, HttpServletResponse response)throws Exception
    {
        List<Picture> picList = albumService.getPictures(albumId);
        model.put("picsList",picList);
        return "myPic";
    }

}
