package com.pichub.hello.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {
    @RequestMapping(value = "/")
    public String index(){
        return "index";
    }
//hahahahha
    @RequestMapping(value = "/register")
    public String register(){
        return "register";
    }
}


