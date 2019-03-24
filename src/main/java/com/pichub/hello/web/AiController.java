package com.pichub.hello.web;

import com.pichub.hello.service.BaiDuAiService;
import com.pichub.hello.service.ReadJsonService;
import com.pichub.hello.service.TecentAiService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class AiController {

    @Autowired
    TecentAiService tecentAiService;
    @Autowired
    BaiDuAiService baiduAiService;
    @Autowired
    ReadJsonService readJsonService;


    @RequestMapping(value = "/ai")
    @ResponseBody
    public String abc(){

        //baiduAiService.getAuth("nTEvGCU4s8QboxwAYHr0DEjG","mzpshf9qwpeBiCvV75ylmtrtHLU0QH0f");
        //baiduAiService.TongYongWuTi();
        try {
            readJsonService.getJson(baiduAiService.TongYongWuTi());
            return "百度ai为为为为为为为为为为："+baiduAiService.TongYongWuTi();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}