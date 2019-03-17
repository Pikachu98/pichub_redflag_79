package com.pichub.hello.web;

import com.pichub.hello.bo.User;
import com.pichub.hello.service.FocusService;
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

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
public class UserController
{
    @Autowired
    private UserService userService;
    @RequestMapping(value = "/user/register")
    public String register(ModelMap model, HttpServletRequest request, HttpServletResponse response) {
        return  "/user/register";
    }

    @RequestMapping(value="/user/saveregister")
    @ResponseBody
    public String saveregister(User user, ModelMap model, HttpServletRequest request, HttpServletResponse response) {

        boolean isSuccess=false;
        String msg = "";
        try {
            isSuccess = userService.saveUser(user);
        } catch (Exception e) {
            msg = e.getMessage();
        }
        return "{success:"+isSuccess+",msg:"+msg+"}";
    }

    @RequestMapping(value = "/user/{userId}")
    public String getUser(@PathVariable long userId, ModelMap map,
                          HttpServletRequest request, HttpServletResponse response)throws Exception {
        User user = userService.getUser(userId);
        map.put("u", user);

        return "user";
    }
}
