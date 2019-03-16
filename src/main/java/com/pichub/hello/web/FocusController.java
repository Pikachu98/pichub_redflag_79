package com.pichub.hello.web;

import com.pichub.hello.service.FocusService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
public class FocusController {
    @Autowired
    private FocusService focusService;

    @RequestMapping(value="/user/changeFocus")
    public String focusSave(Integer userId, ModelMap model, HttpServletRequest request, HttpServletResponse response)
            throws Exception
    {

        return "focus";
    }
}
