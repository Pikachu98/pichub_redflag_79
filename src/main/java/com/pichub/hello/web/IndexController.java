package com.pichub.hello.web;

import com.pichub.hello.bo.Picture;
import com.pichub.hello.bo.User;
import com.pichub.hello.dao.PictureDao;
import com.pichub.hello.service.PictureService;
import com.pichub.hello.service.UserService;
import jdk.nashorn.internal.ir.RuntimeNode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.WriteListener;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.List;

@Controller
public class IndexController {
    @Autowired
    UserService userService;
    @Autowired
    PictureService pictureService;

    @Resource
    private PictureDao pictureDao;

    @RequestMapping("/index")
    public String index(){
        return "index";
    }

    @RequestMapping(value = "/e")
    public String register(){
        return "register";
    }

//    @RequestMapping("/loginIndex")
//    public String loginIndex(ModelMap user, HttpServletRequest request, HttpServletResponse response){
//        user.put("p",request.getSession().getAttribute("userName"));
//
//        return "loginIndex";
//    }

    @RequestMapping( "/getHotPicList")
   // @ResponseBody
    public String getHotList(ModelMap model) throws Exception{
        // List<Picture> picList = pictureService.getHotPicture();
        List<Picture> picList = new ArrayList<Picture>();
        List<User> users = new ArrayList<User>();
        List<Integer> hotPicIds = pictureService.getHotPicId();

        for(int i = 0; i < hotPicIds.size(); i++){
            picList.add(pictureService.getPicture(hotPicIds.get(i)));
            users.add(userService.getUser(picList.get(i).getUserId()));
        }

        List<Integer> likes = pictureService.getLike();
        model.put("picsList",picList);
        model.put("likeCount",likes);
        model.put("users",users);
        return "loginIndex";
    }


    @RequestMapping(value = "/show/{picId}",method = RequestMethod.GET)
    public void show(@PathVariable int picId, String pathName, HttpServletRequest request, HttpServletResponse response)throws Exception
    {
        response.reset();
        response.setContentType("image/jpeg");
        String path = pictureService.getPicture(picId).getPicName();
        path =  getParent(request.getServletContext().getRealPath("/")) + "/resources/originPictures/"+path ;
        outputFile(path,response);
    }

    @RequestMapping(value = "/showA/{userId}")
    public void showA(@PathVariable int userId,HttpServletRequest request, HttpServletResponse response)throws Exception
    {
        response.reset();
        response.setContentType("image/jpeg");
        String path =  getParent(request.getServletContext().getRealPath("/")) + "/resources/static/avatar/" + String.valueOf(userId) +"/square.jpg";
        outputFile(path,response);
    }

    @RequestMapping(value = "/showT/{userId}")
    public void showT(@PathVariable int userId,HttpServletRequest request, HttpServletResponse response)throws Exception
    {
        response.reset();
        response.setContentType("image/jpeg");
        String path =  getParent(request.getServletContext().getRealPath("/")) + "/resources/static/avatar/" + String.valueOf(userId) +"/thumbnail.jpg";
        outputFile(path,response);
    }

    private void outputFile(String path, HttpServletResponse response)
    {
        try {
            File file = new File(path);
            InputStream inputStream = new FileInputStream(file);
            OutputStream outputStream = response.getOutputStream();
            byte[] buffer = new byte[1024];
            int len = 0;
            while((len = inputStream.read(buffer)) > 0)
            {
                outputStream.write(buffer,0,len);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private String getParent(String realPath)
    {
        String str = realPath.substring(0,realPath.lastIndexOf(File.separator));
        return str.substring(0,str.lastIndexOf(File.separator) + 1);
    }

}


