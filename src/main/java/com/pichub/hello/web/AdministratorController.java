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
        if(administratorService.doLoginStatus(request.getParameter("username"),request.getParameter("password"))==true)
            //增加seesion
        {
            request.getSession().setAttribute("username", request.getParameter("username"));
            System.out.println(request.getSession().getAttribute("username"));
        }
        return administratorService.doLoginStatus(request.getParameter("username"),request.getParameter("password"));
    }


    @RequestMapping(value = "/admincenter")
    public String adminCenter(HttpServletRequest request){
        if (request.getSession().getAttribute("username")!=null)
            return "administrator/adminCenter";
        else
            return "administrator/login";
    }

    @RequestMapping(value = "/loginOut")
    public String loginOut(HttpServletRequest request){
        request.getSession().removeAttribute("username");
        return "administrator/login";
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
    public int doChangePassword(HttpServletRequest request, HttpServletResponse response){
        if (request.getSession().getAttribute("username")!=null){
            /*  "100","原密码输入错误，请联系后台管理员更改"
                        "150","请重新登陆"
                        "200","修改成功请重新登录"*/
            if (administratorService.checkOldPwd((String)request.getSession().getAttribute("username"),request.getParameter("old_pwd"))){
                //密码检查函数对或者错
                //update旧密码
                administratorService.updatePwd((String)request.getSession().getAttribute("username"),request.getParameter("new_pwd"));
                return 200;
            }
            else
                return 100;
        }
        else
            return 150;
    }
}