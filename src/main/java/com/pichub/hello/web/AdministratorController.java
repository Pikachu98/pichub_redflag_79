package com.pichub.hello.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
@RequestMapping(value = "/administrator")
public class AdministratorController {
    @RequestMapping(value = "/")
    public String login(){
        return "administrator/login";
    }
    @RequestMapping(value = "/dologin",method = RequestMethod.POST)
    @ResponseBody
    public String doLogin(){
        return "做登录服务";
    }
    @RequestMapping(value = "/admincenter")
    public String adminCenter(){
        return "administrator/adminCerter";
    }
    @RequestMapping(value = "/doadmincenter")
    @ResponseBody
    public String doAdminCenter(){
        return "做管理中心服务";
    }
    @RequestMapping(value = "/changepassword")
    public String changePassword(){
        return "administrator/changePassword";
    }

    @RequestMapping(value = "/dochangepassword",method = RequestMethod.POST)
    @ResponseBody
    public String dochangePassword(HttpServletRequest request, HttpServletResponse response){
        System.out.println(request.getParameter("oldpwd"));
        System.out.println(request.getParameter("newpwd"));
        System.out.println(request.getParameter("connewpwd"));
        String result="hahaha";
        return result;
    }
}