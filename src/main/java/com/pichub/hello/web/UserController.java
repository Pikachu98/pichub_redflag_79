package com.pichub.hello.web;

import com.pichub.hello.bo.Photo;
import com.pichub.hello.bo.User;
import com.pichub.hello.service.UserService;
import com.sun.deploy.net.HttpResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@Controller
public class UserController
{
    @Autowired
    private UserService userService;
//    @RequestMapping(value = "/user/register", method = RequestMethod.GET)
//    public String register(ModelMap model, HttpServletRequest request, HttpServletResponse response) {
//        return  "/user/regdsfister";
//    }

//    @RequestMapping(value="/user/saveregister", method = RequestMethod.POST)
//    @ResponseBody
//    //spring 框架，request:请求的参数 (queryString,cookie,head)   response:响应参数
//    public String saveregister(User user, ModelMap model, HttpServletRequest request, HttpServletResponse response) {
//
//        boolean isSuccess=false;
//        String msg = "";
//        try {
//            isSuccess = userService.saveUser(user);
//        } catch (Exception e) {
//            msg = e.getMessage();
//        }
//
//        return "{success:"+isSuccess+",msg:"+msg+"}";
//
//    }

//    @RequestMapping(value="/login", method = RequestMethod.POST)
//    public String insert(ModelMap model, HttpServletRequest request, HttpServletResponse response) throws Exception {
//        return "/login";
//    }
    //Spring 语法

    @RequestMapping(value="/login", method = RequestMethod.GET)

    public String login(HttpServletRequest request, HttpServletResponse response){
        return "login";
    }
    @RequestMapping(value="/doLogin")
    @ResponseBody
    public User doLogin(String userEmail,String userPassword, ModelMap model, HttpServletRequest request, HttpServletResponse response) throws Exception{
        return null;
    }

    @RequestMapping(value = "/user/{userId}")
    public String getUser(@PathVariable long userId, ModelMap map,
                          HttpServletRequest request, HttpServletResponse response)throws Exception {
        User user = userService.getUser(userId);
        map.put("u", user);

        return "user";
    }

}



