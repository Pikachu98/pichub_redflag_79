package com.pichub.hello.web;

import com.pichub.hello.bo.Picture;
import com.pichub.hello.bo.User;
import com.pichub.hello.dao.PictureDao;
import com.pichub.hello.service.FocusService;
import com.pichub.hello.service.PictureService;
import com.pichub.hello.service.UserService;
import jdk.nashorn.internal.ir.RuntimeNode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.jws.soap.SOAPBinding;
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
    @Autowired
    FocusService focusService;

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

    @RequestMapping( "/")
   // @ResponseBody
    public String getHotList(ModelMap model, HttpServletRequest request) throws Exception{
        // List<Picture> picList = pictureService.getHotPicture();
        List<Picture> picList = new ArrayList<Picture>();
        List<User> users = new ArrayList<User>();
        List<Integer> hotPicIds = pictureService.getHotPicId();
        List<Integer> focusList = new ArrayList<Integer>();
        List<Integer> belikeList = new ArrayList<Integer>();
        User user = User.getCurrentUser(request);

        picList.clear();
        users.clear();
        focusList.clear();
        belikeList.clear();
        if(user != null)
        {
            for(int i = 0; i < hotPicIds.size(); i++){
                picList.add(pictureService.getPicture(hotPicIds.get(i)));
                users.add(userService.getUser(picList.get(i).getUserId()));
                int t = focusService.checkFocus(user.getUserId().intValue(),
                        users.get(i).getUserId().intValue());
                focusList.add(t);
                if(userService.belikeCheck(user.getUserId(),hotPicIds.get(i)))
                {
                    belikeList.add(1);
                }
                else
                {
                    belikeList.add(0);
                }
            }
        }
        else
        {
            for(int i = 0; i < hotPicIds.size(); i++){
                picList.add(pictureService.getPicture(hotPicIds.get(i)));
                users.add(userService.getUser(picList.get(i).getUserId()));
                focusList.add(0);
                belikeList.add(0);
            }
        }


        List<Integer> likes = pictureService.getLike();
        model.put("picsList",picList);
        model.put("likeCount",likes);
        model.put("users",users);
        model.put("focusList",focusList);
        model.put("belikeList",belikeList);
        return "loginIndex";
    }

    @RequestMapping(value="/album-pics/{userId}",method = RequestMethod.GET)
    public String showOtherAlbum(@PathVariable int userId, HttpServletRequest request, HttpServletResponse response, ModelMap model)throws Exception{
        List<Integer> albumPics = pictureService.getAlbumPics(userId);
        model.put("albumPics", albumPics);
        User user = userService.getUser(userId);

        model.put("checkFocus",focusService.checkFocus(User.getCurrentUser(request).getUserId().intValue(),userId));
        model.put("user",user);

        model.put("user_id",userId);

        model.put("MyFocus",focusService.showMyFocus(userId).size());

        model.put("FocusMe",focusService.showFocusMe(userId).size());

        return "otherAlbum";
    }



    @RequestMapping(value = "/show/{picId}",method = RequestMethod.GET)
    public void show(@PathVariable int picId, String pathName, HttpServletRequest request, HttpServletResponse response)throws Exception
    {
        response.reset();
        response.setContentType("image/jpeg");
        String path = pictureService.getPicture(picId).getPicName();
        /*this.getClass().getResource("/").getPath() + "*/
        path =  this.getClass().getResource("/").getPath() + "/originPictures/"+path ;
        outputFile(path,response);
    }

    @RequestMapping(value = "/showA/{userId}")
    public void showA(@PathVariable int userId,HttpServletRequest request, HttpServletResponse response)throws Exception
    {
        response.reset();
        response.setContentType("image/jpeg");
        String path =  this.getClass().getResource("/").getPath() + "/static/avatar/" + String.valueOf(userId) +"/square.jpg";
        outputFile(path,response);
    }

    @RequestMapping(value = "/showC/{userId}")
    public void showC(@PathVariable int userId, HttpServletRequest request, HttpServletResponse response)throws Exception
    {
        response.reset();
        response.setContentType("image/jpeg");
        String path = this.getClass().getResource("/").getPath() + "/static/avatar/" + String.valueOf(userId) + "/page.jpg";
        outputFile(path,response);
    }

    @RequestMapping(value = "/showT/{userId}")
    public void showT(@PathVariable int userId,HttpServletRequest request, HttpServletResponse response)throws Exception
    {
        response.reset();
        response.setContentType("image/jpeg");
        String path =  this.getClass().getResource("/").getPath() + "/static/avatar/" + String.valueOf(userId) +"/thumbnail.jpg";
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


