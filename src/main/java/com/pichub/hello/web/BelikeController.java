package com.pichub.hello.web;

import com.pichub.hello.bo.User;
import com.pichub.hello.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by root on 19-3-17.
 */
@Controller
public class BelikeController {
    @Autowired
    private UserService userService;

    @RequestMapping(value = "/belike")
    public String belike(HttpServletRequest request, HttpServletResponse response)
    {
        return "belike";
    }

    @RequestMapping(value = "/belike/check")
    @ResponseBody
    public String checkBelike(long pictureId, HttpServletRequest request)throws Exception
    {
        return "{" + userService.belikeCheck(User.getCurrentUser(request).getUserId(),pictureId) + "}";
    }

    @RequestMapping(value = "/belike/reverseState")
    @ResponseBody
    public String reverseState(long pictureId,HttpServletRequest request, HttpServletResponse response)throws Exception
    {
        long userId = User.getCurrentUser(request).getUserId();

        if (userService.belikeCheck(userId,pictureId))
        {
            return "{" + userService.deleteBelike(userId,pictureId) + "}";
        }
        else
        {
            return "{" + userService.insertBelike(userId,pictureId) + "}";
        }
    }

}
