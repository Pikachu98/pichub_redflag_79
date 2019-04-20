package com.pichub.hello.web;

import com.pichub.hello.bo.User;
import com.pichub.hello.service.FocusService;
import com.pichub.hello.service.UserService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.jws.soap.SOAPBinding;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class FocusController {
    @Autowired
    private FocusService focusService;

    @Autowired
    private UserService userService;
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
    public Map<String,Object> doInsertFocus(HttpServletRequest request, HttpServletResponse response,String userId1)
            throws Exception
    {
        //request.getSession().setAttribute("userId",1L);
        Map<String,Object> result = new HashMap<String,Object>();
        //loginState传递用户登陆状态
        User user = User.getCurrentUser(request);
        int userId2 = Integer.parseInt(userId1);
        if (user != null)//已登陆
        {
            Integer userId = user.getUserId().intValue();
            //在点击关注按钮前已经获取了此用户Id
            //boolean hadFocus = true;
            int hadFocus = focusService.checkFocus(userId,userId2);
            if (hadFocus==0)//如果这个用户还没关注这个用户
            {
                boolean focus = focusService.focusChange(userId,userId2);//获得插入的结果，成功为true，失败为false
                result.put("focusId1",userId);//将当前用户Id显示到页面上
                result.put("focusId2",userId2);//当前用户想关注的用户的ID
                result.put("backMsg",focus);//将插入结果显示到页面上
            }
            else//当前用户已经关注了这个用户
            {
                //取消关注，从follower表中删除记录
                boolean delfocus = focusService.delFocus(userId,userId2);
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
    public Map<String,Object> doShowMyFocus(HttpServletRequest request, HttpServletResponse response)
            throws Exception
    {
        Map<String,Object> result = new HashMap<String,Object>();

        int userId = User.getCurrentUser(request).getUserId().intValue();
        List myFocus = focusService.showMyFocus(userId);
        List<User> myFocusList = new ArrayList<User>();
        int t;
        for (Object o :myFocus) {
            t = Integer.parseInt(o.toString());/////////////////////////////
            myFocusList.add(userService.getUser(t));
        }

        result.put("MyFocus",myFocus);
        result.put("MyFocusList", myFocusList);
        return result;
    }


    @RequestMapping(value="/list")
    public String showMyFocus(ModelMap model, HttpServletRequest request, HttpServletResponse response)
            throws Exception
    {
        int userIdNow = User.getCurrentUser(request).getUserId().intValue();
        List<Integer> myFocus = focusService.showMyFocus(userIdNow);

        List<User> myFocusList = new ArrayList<>();
        List<Integer> fansList = new ArrayList<>();

        for (int i:myFocus){
            myFocusList.add(userService.getUser(i));
            fansList.add(focusService.showFocusMe(i).size());
        }
        model.put("fansList",fansList);
        model.put("USERS",myFocusList);

        String p = request.getParameter("page");
        int page;
        try {
            //当前页数
            page = Integer.valueOf(p);
        } catch (NumberFormatException e) {
            page = 1;
        }
        //用户总数
        int totalUsers = myFocus.size();
        //每页用户数
        int usersPerPage = 10;
        //总页数
        int totalPages = totalUsers % usersPerPage == 0 ? totalUsers / usersPerPage : totalUsers / usersPerPage + 1;
        //本页起始用户序号
        int beginIndex = (page - 1) * usersPerPage;
        //本页末尾用户序号的下一个
        int endIndex = beginIndex + usersPerPage;
        if (endIndex > totalUsers)
            endIndex = totalUsers;
        request.setAttribute("totalUsers", totalUsers);
        request.setAttribute("usersPerPage", usersPerPage);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("beginIndex", beginIndex);
        request.setAttribute("endIndex", endIndex);
        request.setAttribute("page", page);
        request.setAttribute("users", myFocusList);

        model.put("MyFocus",focusService.showMyFocus(User.getCurrentUser(request).getUserId().intValue()).size());
        model.put("FocusMe",focusService.showFocusMe(User.getCurrentUser(request).getUserId().intValue()).size());

        return "myfocus";
    }

    @RequestMapping(value="/listFans")
    public String showMyFans(ModelMap model, HttpServletRequest request, HttpServletResponse response)
            throws Exception
    {
        int userIdNow = User.getCurrentUser(request).getUserId().intValue();
        List<Integer> myFans = focusService.showFocusMe(userIdNow);

        List<User> myFansList = new ArrayList<>();
        List<Integer> fansList = new ArrayList<>();

        for (int i:myFans){
            myFansList.add(userService.getUser(i));
            fansList.add(focusService.showFocusMe(i).size());
        }
        model.put("fansList",fansList);

        String p = request.getParameter("page");
        int page;
        try {
            //当前页数
            page = Integer.valueOf(p);
        } catch (NumberFormatException e) {
            page = 1;
        }
        //用户总数
        int totalUsers = myFans.size();
        //每页用户数
        int usersPerPage = 10;
        //总页数
        int totalPages = totalUsers % usersPerPage == 0 ? totalUsers / usersPerPage : totalUsers / usersPerPage + 1;
        //本页起始用户序号
        int beginIndex = (page - 1) * usersPerPage;
        //本页末尾用户序号的下一个
        int endIndex = beginIndex + usersPerPage;
        if (endIndex > totalUsers)
            endIndex = totalUsers;
        request.setAttribute("totalUsers", totalUsers);
        request.setAttribute("usersPerPage", usersPerPage);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("beginIndex", beginIndex);
        request.setAttribute("endIndex", endIndex);
        request.setAttribute("page", page);
        request.setAttribute("users", myFansList);


        model.put("USERS",myFansList);
        model.put("MyFocus",focusService.showMyFocus(User.getCurrentUser(request).getUserId().intValue()).size());
        model.put("FocusMe",focusService.showFocusMe(User.getCurrentUser(request).getUserId().intValue()).size());

        return "myfans";
    }



    @RequestMapping(value="/listmyLike")
    public String showMylike(ModelMap model, HttpServletRequest request, HttpServletResponse response)
            throws Exception
    {
        int userIdNow = User.getCurrentUser(request).getUserId().intValue();
        List<Integer> myLikeList = focusService.showMyLike(userIdNow);


        model.put("myikelist",myLikeList);

        String p = request.getParameter("page");
        int page;
        try {
            //当前页数
            page = Integer.valueOf(p);
        } catch (NumberFormatException e) {
            page = 1;
        }
        //用户总数
        int totalUsers = myLikeList.size();
        //每页用户数
        int usersPerPage = 10;
        //总页数
        int totalPages = totalUsers % usersPerPage == 0 ? totalUsers / usersPerPage : totalUsers / usersPerPage + 1;
        //本页起始用户序号
        int beginIndex = (page - 1) * usersPerPage;
        //本页末尾用户序号的下一个
        int endIndex = beginIndex + usersPerPage;
        if (endIndex > totalUsers)
            endIndex = totalUsers;
        request.setAttribute("totalUsers", totalUsers);
        request.setAttribute("usersPerPage", usersPerPage);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("beginIndex", beginIndex);
        request.setAttribute("endIndex", endIndex);
        request.setAttribute("page", page);
        request.setAttribute("photos", myLikeList);

        model.put("MyFocus",focusService.showMyFocus(User.getCurrentUser(request).getUserId().intValue()).size());
        model.put("FocusMe",focusService.showFocusMe(User.getCurrentUser(request).getUserId().intValue()).size());

        return "mylike";
    }



    @RequestMapping(value="/user/doShowFocusMe")
    @ResponseBody
    public Map<String,Object> doShowFocusMe(HttpServletRequest request, HttpServletResponse response)
            throws Exception
    {
        Map<String,Object> result = new HashMap<String,Object>();
        int userId = User.getCurrentUser(request).getUserId().intValue();
        List focusMe = focusService.showFocusMe(userId);
        result.put("FocusMe",focusMe);
        return result;
    }

    @RequestMapping(value="/user/doShowMyLike")
    @ResponseBody
    public Map<String,Object> doShowMyLike(HttpServletRequest request, HttpServletResponse response)
            throws Exception
    {
        Map<String,Object> result = new HashMap<String,Object>();
        int userId = User.getCurrentUser(request).getUserId().intValue();
        List MyLike = focusService.showMyLike(userId);
        result.put("MyLike",MyLike);
        return result;
    }

    @RequestMapping(value="/user/doShowMyAlbum")
    @ResponseBody
    public Map<String,Object> doShowMyAlbum(ModelMap model, HttpServletRequest request, HttpServletResponse response)
            throws Exception
    {
        Map<String,Object> result = new HashMap<String,Object>();
        int userId = User.getCurrentUser(request).getUserId().intValue();
        List MyAlbum = focusService.showMyAlbum(userId);
        result.put("MyAlbum",MyAlbum);
        return result;
    }

    @RequestMapping(value="/user/doChangeUserName")
    @ResponseBody
    public Map<String,Object> doChangeUserName(String newUsername, ModelMap model, HttpServletRequest request, HttpServletResponse response)
            throws Exception
    {
        Map<String,Object> result = new HashMap<String,Object>();
        int userId = User.getCurrentUser(request).getUserId().intValue();
        boolean changeName = focusService.changeUsername(userId,newUsername);
        result.put("changeName",changeName);
        return result;
    }
}
