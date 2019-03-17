package com.pichub.hello.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.constraints.Null;

@Controller
public class IndexController {
    @RequestMapping(value = "/")
    public String index(){
        return "index";
    }

    @RequestMapping(value = "/login")
    public String login(HttpServletRequest request, HttpServletResponse response){
        return "----待完善----";
    }

    @RequestMapping(value = "/zhuce")
    public String zhuce(HttpServletRequest request, HttpServletResponse response){
        return "------待完善-----";
    }
    @RequestMapping(value = "/chongzhimima")
    public String chongzhimima(HttpServletRequest request, HttpServletResponse response){
        return "------待完善-----";
    }


}
