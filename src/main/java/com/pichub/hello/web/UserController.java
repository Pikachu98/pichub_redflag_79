package com.pichub.hello.web;

import com.pichub.hello.bo.User;
import com.pichub.hello.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;

@Controller

public class UserController
{
    @Autowired
    private UserService userService;

    @RequestMapping(value="/register", method = RequestMethod.GET)
    public String register(HttpServletRequest request, HttpServletResponse response){

        return "register";
    }

    @RequestMapping(value="/user/doRegister")
    @ResponseBody
    public Map<String,Object> doRegister(User user, ModelMap model, HttpServletRequest request, HttpServletResponse response) throws Exception {
        Map<String, Object> result = new HashMap<String, Object>();
        System.out.print(request.getParameter("inputCheckCode"));
        System.out.print(request.getSession().getAttribute("checkCode"));

        if (request.getParameter("inputCheckCode").equals(request.getSession().getAttribute("checkCode"))) {

            int count = userService.insertUser(user);
            result.put("meg", "创建成功");
            result.put("userId", user.getUserId());
            return result;
        }
        else{
            result.put("meg", "验证码错误");
            return result;
        }

    }


    @RequestMapping(value="/login")

    public String login(HttpServletRequest request, HttpServletResponse response){
        return "login";
    }

    @RequestMapping(value="/doLogin",method = RequestMethod.GET)
    @ResponseBody
    public int doLogin(User user, HttpServletRequest request, HttpServletResponse response){
        return userService.checkLogin(user, request);
    }

/*
* @重置密码+忘记密码
* */
    @RequestMapping(value = "/userChangePassword")
    public String userChangePassword(){
        return "userChangePassword";
    }

    @RequestMapping(value = "/doReset")
    @ResponseBody
    public Map<String,Object> doReset(User user, ModelMap model, HttpServletRequest request, HttpServletResponse response) throws Exception{
        Map<String, Object> result = new HashMap<String, Object>();
//        System.out.print("ssfgfhjiojd!!!!"+request.getParameter("inputCheckCode"));
//        System.out.print(request.getSession().getAttribute("checkCode"));

        if (request.getParameter("inputCheckCode").equals(request.getSession().getAttribute("a"))) {
            String userEmail = user.getUserEmail();
            String userPassword = user.getUserPassword();
            int a = userService.changePassword(userEmail,userPassword);
            System.out.println(a);
            String b = a + "";
            result.put("meg",b);
            return result;
        }
        else{
            result.put("meg", "验证码错误");
            return result;
        }
    }


    @RequestMapping(value = "/user/{userId}")
    public String getUser(@PathVariable Long userId, ModelMap map,
                          HttpServletRequest request, HttpServletResponse response)throws Exception {
        User user = userService.getUser(userId);
        map.put("u", user);
        return "index";
    }

    @RequestMapping(value = "/user/personalPage")
    public String personalPage(HttpServletRequest request, HttpServletResponse response){
        return "user/personalPage";
    }

    @RequestMapping(value = "/user/personalCenter")
    public String personalCenter(ModelMap map,HttpServletRequest request, HttpServletResponse response){
        map.put("u",userService.getAvatarPath(26));
        return "user/personalCenter";
    }

    @RequestMapping(value = "/user/changeEmail")
    public String getUser(HttpServletRequest request, HttpServletResponse response){
        return "user/changeEmail";
    }

    @RequestMapping(value = "/doCheckEmail/{email}")
    @ResponseBody
    public int getUser(@PathVariable String email, HttpServletRequest request, HttpServletResponse response){
        return userService.checkEmail(email);//返回值10表示已有此email,15表示无此email
    }

    @RequestMapping(value = "/user/doChangeEmail",method = RequestMethod.POST)
    @ResponseBody
    public int doChangeEmail(HttpServletRequest request, HttpServletResponse response){

        return userService.doChangeEmail(request.getParameter("oldEmail"), request.getParameter("oldCheckCode"),(String) request.getSession().getAttribute("oldEmailCheckCode"),
                request.getParameter("newEmail"), request.getParameter("newCheckCode"),(String)request.getSession().getAttribute("newEmailCheckCode"));
    }

    @RequestMapping(value = "/user/doChangeAvatar",method = RequestMethod.POST)
    @ResponseBody
    public String getAvatarPath(HttpServletRequest request){
        System.out.println(userService.GenerateImage(request.getParameter("avatar")));
        long userId=26;
        return "OK";
    }

}