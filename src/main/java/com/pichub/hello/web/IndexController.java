package com.pichub.hello.web;

import com.fasterxml.jackson.databind.util.JSONPObject;
import com.pichub.hello.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
public class IndexController {
    @RequestMapping(value = "/")
    public String index(){
        return "index";
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String login(HttpServletRequest request, HttpServletResponse response){
        return null;
    }

    @RequestMapping(value = "/rigister", method = RequestMethod.POST)
    public String rigister(HttpServletRequest request, HttpServletResponse response){
        return null;
    }
    @RequestMapping(value = "/resetPassword", method = RequestMethod.POST)
    public String resetPassword(HttpServletRequest request, HttpServletResponse response){
        return null;
    }



}
