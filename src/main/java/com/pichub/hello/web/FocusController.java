package com.pichub.hello.web;

import com.pichub.hello.bo.User;
import com.pichub.hello.service.FocusService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;

@Controller
public class FocusController {
    @Autowired
    private FocusService focusService;

    @RequestMapping(value="/user/changeFocus")
    public String focusSave(ModelMap model, HttpServletRequest request, HttpServletResponse response)
            throws Exception
    {   /*
        boolean online = true;
        //如果用户已经登陆
        if (online){
            //在点击关注按钮前已经获取了此用户Id
            boolean hadFocus = true;
            if (hadFocus)//如果这个用户还没专注这个用户
            {
                int userId1=2;//获取当前登陆用户ID
                int userId2=3;//当前用户想要关注的用户的ID
                boolean focus = focusService.focusChange(userId1,userId2);//获得插入的结果，成功为true，失败为false
                model.put("focusId1",userId1);//将当前用户Id显示到页面上
                model.put("focusId2",userId2);//当前用户想关注的用户的ID
                model.put("result",focus);//将插入结果显示到页面上
            }
            else//当前用户已经关注了这个用户
            {
                //取消关注，从follower表中删除记录
            }
        }
        else
        {
            //提示用户登陆
        }
        */
        return "focus";//转到focus.jsp
    }


    @RequestMapping(value="/user/doInsertFocus")
    @ResponseBody
    public Map<String,Object> doInsertFocus(boolean loginState/*@SessionAttribute(value = "userId") long userIdNow*/, ModelMap model, HttpServletRequest request, HttpServletResponse response)
            throws Exception
    {
        //request.getSession().setAttribute("userId",1L);
        Map<String,Object> result = new HashMap<String,Object>();
        //loginState传递用户登陆状态
        if (loginState)//已登陆
        {
            int userIdNow = 2;
            //在点击关注按钮前已经获取了此用户Id
            boolean hadFocus = false;
            if (!hadFocus)//如果这个用户还没关注这个用户
            {
                Integer userId2=3;//当前用户想要关注的用户的ID
                boolean focus = focusService.focusChange(userIdNow,userId2);//获得插入的结果，成功为true，失败为false
                result.put("focusId1",userIdNow);//将当前用户Id显示到页面上
                result.put("focusId2",userId2);//当前用户想关注的用户的ID
                result.put("backMsg",focus);//将插入结果显示到页面上
            }
            else//当前用户已经关注了这个用户
            {
                //取消关注，从follower表中删除记录

                result.put("backMsg","取消关注");
            }
        }else//未登录
        {
            //提示用户登陆
            result.put("backMsg","请先登陆");
        }
        return result;
    }
}
