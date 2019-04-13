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
import java.util.List;
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
            Integer userIdNow = 2;
            Integer userId2=3;//当前用户想要关注的用户的ID
            //在点击关注按钮前已经获取了此用户Id
            //boolean hadFocus = true;
            int hadFocus = focusService.checkFocus(userIdNow,userId2);
            if (hadFocus==0)//如果这个用户还没关注这个用户
            {
                boolean focus = focusService.focusChange(userIdNow,userId2);//获得插入的结果，成功为true，失败为false
                result.put("focusId1",userIdNow);//将当前用户Id显示到页面上
                result.put("focusId2",userId2);//当前用户想关注的用户的ID
                result.put("backMsg",focus);//将插入结果显示到页面上
            }
            else//当前用户已经关注了这个用户
            {
                //取消关注，从follower表中删除记录
                boolean delfocus = focusService.delFocus(userIdNow,userId2);
                result.put("backMsg","取消关注"+delfocus);
            }
        }else//未登录时
        {
            //提示用户登陆
            result.put("backMsg","请先登陆");
        }
        return result;
    }

    @RequestMapping(value="/user/doShowMyFocus")
    @ResponseBody
    public Map<String,Object> doShowMyFocus(boolean loginState/*@SessionAttribute(value = "userId") long userIdNow*/, ModelMap model, HttpServletRequest request, HttpServletResponse response)
            throws Exception
    {
        Map<String,Object> result = new HashMap<String,Object>();
        int userIdNow = 2;

        String p = request.getParameter("page");
        int page;
        try {
            //当前页数
            page = Integer.valueOf(p);
        } catch (NumberFormatException e) {
            page = 1;
        }
        List<User> myFocus = focusService.showMyFocus(userIdNow);
        //用户总数
        int totalUser = myFocus.size();
        //每页显示数量
        int userPerPage = 10;
        //总页数
        int totalPages = totalUser % userPerPage == 0 ? totalUser / userPerPage : totalUser / userPerPage + 1;
        //本页起始用户序号
        int beginIndex = (page-1)*userPerPage;
        //本页末尾用户序号的下一个
        int endIndex = beginIndex + userPerPage;

        if(endIndex>totalUser)
            endIndex=totalUser;

        request.setAttribute("totalUsers",totalUser);
        request.setAttribute("usersPerPage",userPerPage);
        request.setAttribute("totalPages",totalPages);
        request.setAttribute("beginIndex",beginIndex);
        request.setAttribute("endIndex",endIndex);
        request.setAttribute("page",page);
        request.setAttribute("users",myFocus);
        request.getRequestDispatcher("list.jsp").forward(request, response);

        result.put("MyFocus",myFocus);
        return result;
    }

    @RequestMapping(value="/user/doShowFocusMe")
    @ResponseBody
    public Map<String,Object> doShowFocusMe(boolean loginState/*@SessionAttribute(value = "userId") long userIdNow*/, ModelMap model, HttpServletRequest request, HttpServletResponse response)
            throws Exception
    {
        Map<String,Object> result = new HashMap<String,Object>();
        int userIdNow = 2;
        List focusMe = focusService.showFocusMe(userIdNow);
        result.put("FocusMe",focusMe);
        return result;
    }

    @RequestMapping(value="/user/doShowMyLike")
    @ResponseBody
    public Map<String,Object> doShowMyLike(boolean loginState/*@SessionAttribute(value = "userId") long userIdNow*/, ModelMap model, HttpServletRequest request, HttpServletResponse response)
            throws Exception
    {
        Map<String,Object> result = new HashMap<String,Object>();
        int userIdNow = 2;
        List MyLike = focusService.showMyLike(userIdNow);
        result.put("MyLike",MyLike);
        return result;
    }

    @RequestMapping(value="/user/doShowMyAlbum")
    @ResponseBody
    public Map<String,Object> doShowMyAlbum(boolean loginState/*@SessionAttribute(value = "userId") long userIdNow*/, ModelMap model, HttpServletRequest request, HttpServletResponse response)
            throws Exception
    {
        Map<String,Object> result = new HashMap<String,Object>();
        int userIdNow = 1;
        List MyAlbum = focusService.showMyAlbum(userIdNow);
        result.put("MyAlbum",MyAlbum);
        return result;
    }

    @RequestMapping(value="/user/doChangeUserName")
    @ResponseBody
    public Map<String,Object> doChangeUserName(boolean loginState/*@SessionAttribute(value = "userId") long userIdNow*/,String newUsername, ModelMap model, HttpServletRequest request, HttpServletResponse response)
            throws Exception
    {
        Map<String,Object> result = new HashMap<String,Object>();
        int userIdNow = 1;
        boolean changeName = focusService.changeUsername(userIdNow,newUsername);
        result.put("changeName",changeName);
        return result;
    }
}
