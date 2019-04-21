package com.pichub.hello.config.intercepors;

import com.pichub.hello.bo.User;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 *
 * @description 利用spring框架提供的HandlerInterceptorAdapter，实现自定义拦截器
 */
@Component
public class LoginInterceptor extends HandlerInterceptorAdapter{
    // 在业务处理器处理请求之前被调用
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception{
        User user = User.getCurrentUser(request);
        request.setAttribute("user",user);
        System.out.println(request.getRequestURI());
        String url=request.getRequestURI();
//        List<String> interList = new
        if(url.startsWith("/css/") ||url.startsWith("/picture-detail/") || url.startsWith("/js/")|| url.startsWith("/show/")|| url.startsWith("js/")
                || url.startsWith("/album-pics/") || url.startsWith("/showA/")|| url.startsWith("/default/")|| url.startsWith("/img/") || url.equals("/") || url.equals("/doLogin") || url.startsWith("/showT")) {
            return true;
        }
        if (user == null) {
//            System.out.println("尚未登录，调到登录页面");
            response.sendRedirect("/");
            return false;
        }
        else{

            return true;
        }
    }


    // 在业务处理器处理请求完成之后，生成视图之前执行
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception{
        System.out.println("postHandle...");
        if(modelAndView != null){
            Map<String, String> map = new HashMap<String, String>();
            modelAndView.addAllObjects(map);
        }
    }

    // 在DispatcherServlet完全处理完请求之后被调用，可用于清理资源
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception{
        System.out.println("afterCompletion...");
    }
}
