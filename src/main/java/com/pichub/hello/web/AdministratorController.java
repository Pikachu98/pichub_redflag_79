package com.pichub.hello.web;

import com.pichub.hello.bo.Administrator;
import com.pichub.hello.service.AdministratorService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
@RequestMapping(value = "/administrator")
public class AdministratorController {
    @Autowired
    AdministratorService administratorService;

    @RequestMapping(value = "")
    public String login(){
        return "administrator/login";
    }


    @RequestMapping(value = "/doLogin",method = RequestMethod.POST)
    @ResponseBody
    public Boolean doLogin( HttpServletRequest request, HttpServletResponse response){
        return administratorService.doLoginStatus(request.getParameter("username"),request.getParameter("password"));
    }


    @RequestMapping(value = "/admincenter")
    public String adminCenter(){
        return "administrator/adminCenter";
    }


    @RequestMapping(value = "/doadmincenter")
    @ResponseBody
    public String doAdminCenter(HttpServletRequest request, HttpServletResponse response){
        return "做管理中心服务";
    }


    @RequestMapping(value = "/changePassword")
    public String changePassword(){
        return "administrator/changePassword";
    }

    @RequestMapping(value = "/doChangePassword",method = RequestMethod.POST)
    @ResponseBody
    public String doChangePassword(HttpServletRequest request, HttpServletResponse response){
        System.out.println(request.getParameter("old_pwd"));
        System.out.println(request.getParameter("new_pwd"));
        System.out.println(request.getParameter("con_new_pwd"));
        String result="hahaha";
        return result;
    }
}