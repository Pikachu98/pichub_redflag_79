package com.pichub.hello.web;

import com.pichub.hello.bo.User;
import com.pichub.hello.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UserController
{
    @Autowired
    private UserService userService;
    @RequestMapping(value = "/user/register", method = RequestMethod.GET)
    public String register(ModelMap model, HttpServletRequest request, HttpServletResponse response) {
        return  "/user/reister";
    }

    @RequestMapping(value="/user/saveregister", method = RequestMethod.POST)
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
}
