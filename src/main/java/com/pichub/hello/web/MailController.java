package com.pichub.hello.web;

import com.pichub.hello.service.MailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Random;

@Controller
public class MailController {
    @Autowired
    private MailService mailService;

    @RequestMapping(value = "/MailCode",method = RequestMethod.GET)
    public String MailCode(HttpServletRequest request, HttpServletResponse response){
        return "MailCode";
    }

    @RequestMapping("getCheckCode")
    @ResponseBody
    public String getCheckCode(String email,HttpServletRequest request){
        String checkCode = String.valueOf(new Random().nextInt(899999) + 100000);
        String message = "您的注册验证码为："+checkCode;
        request.getSession().setAttribute(request.getParameter("key"),checkCode);
        try {
            mailService.sendSimpleMail(email, "注册验证码", message);
            return "1";
        }catch (Exception e){
            return null;
        }
    }

/*---------------------
    作者：梅比斯-维维亚米利欧
    来源：CSDN
    原文：https://blog.csdn.net/q1054733797/article/details/84763287
    版权声明：本文为博主原创文章，转载请附上博文链接！*/
}
