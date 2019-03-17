package com.pichub.hello.web;

import com.pichub.hello.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by root on 19-3-17.
 */
@Controller
public class BelikeController {
    @Autowired
    private UserService userService;

    //@RequestMapping(value = "/belike/")
}
