package com.pichub.hello.web;

import com.pichub.hello.service.AlbumService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class AlbumController {
    @Autowired
    AlbumService albumService;

}
