package com.pichub.hello.service.impl;

import cn.xsshome.taip.imageclassify.TAipImageClassify;
import cn.xsshome.taip.util.FileUtil;
import cn.xsshome.taip.vision.TAipVision;
import com.pichub.hello.service.TecentAiService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.UUID;

@Service("tecentAiService")
public class TecentAiServiceImpl implements TecentAiService {
    @Autowired
    TecentAiService tecentAiService;


    public static final String APP_ID = "2112712233";
    public static final String APP_KEY = "vjIZc5AMcXEYm5qy";
    @Override
    public String MutiTagShiBie() {
        // 初始化一个TAipImageClassify
        TAipImageClassify aipImageClassify = new TAipImageClassify(APP_ID, APP_KEY);
        String filePath = "D:/123.jpg";//本地文件路径
        byte[] image = new byte[1000000];//获取文件的byte数据
        try {
            image = FileUtil.readFileByBytes(filePath);
        } catch (IOException e) {
            e.printStackTrace();
        }
        //String result = aipImageClassify.visionScener(image, 1, 5);//场景识别
        //String result = aipImageClassify.visionObjectr(image, 1, 5);//物体识别
        try {
            String result = aipImageClassify.imageTag(image);//图像标签识别
            return result;
        } catch (Exception e) {
            e.printStackTrace();
        }
        //String result = aipImageClassify.visionImgidentify(image, 1);//车辆识别
        //String result = aipImageClassify.visionImgidentify(image, 2);//花草识别
        //String result = aipImageClassify.flowersAndPlant(image);//花草识别
        //String result = aipImageClassify.vehicle(image);//车辆识别
        //String result = aipImageClassify.visionImgtotext(image, RandomNonceStrUtil.getRandomString());//看图说话
        //String result = aipImageClassify.imageFuzzy(image);//模糊图片检测
        //String result = aipImageClassify.imageFood(image);//美食图片识别
        return null;
    }
    public String jianHuang() {

        TAipVision aipVision = new TAipVision(APP_ID, APP_KEY);
        String filePath = "D:/123.jpg";
        //String imageUrl = "https://www.xsshome.cn/xxx.jpg";//图片的网络路径地址
        //String result = aipVision.imageTerrorism(imageUrl);//暴恐图片
        //String result = aipVision.imageTerrorismByURL(filePath);//暴恐图片ByURL
        String result = null;//智能鉴黄
        try {
            result = aipVision.visionPorn(filePath);
        } catch (Exception e) {
            e.printStackTrace();
        }
        //String result = aipVision.visionPornByURL(imageUrl);//智能鉴黄ByURL
        //String speech_url = "https://www.xsshome.cn/output.mp3";
        //String result = aipVision.aaiEvilAudio(UUID.randomUUID().toString().replace("-", ""), speech_url);//音频鉴黄
        //System.out.println(result);
        return result;
    }
}
