package com.pichub.hello.service.impl;

import cn.xsshome.taip.imageclassify.TAipImageClassify;
import cn.xsshome.taip.util.FileUtil;
import com.pichub.hello.service.TecentAiService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.IOException;

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
        String result = null;//图像标签识别
        try {
            result = aipImageClassify.imageTag(image);
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
}
