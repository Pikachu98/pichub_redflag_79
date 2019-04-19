package com.pichub.hello.service.impl;

import com.pichub.hello.dao.PictureDao;
import com.pichub.hello.service.BaiDuAiService;
import com.pichub.hello.service.ReadJsonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.stereotype.Component;

@Component
public class DoTagService implements ApplicationRunner {
    @Autowired
    PictureDao pictureDao;
    @Autowired
    ReadJsonService readJsonService;
    @Autowired
    BaiDuAiService baiDuAiService;

    @Override
    public void run(ApplicationArguments args) throws Exception {
        while(true) {
            this.doTag();
            //System.out.println("自动执行");
            Thread.sleep(10000);
        }
    }
    public void doTag() throws Exception{
        while(true){
            int MaxPictureTagId=pictureDao.checkMaxPictureTagId();
            int MaxPictureId=pictureDao.checkMaxPictureId();
            if(MaxPictureTagId<MaxPictureId){
                for (int i=MaxPictureTagId+1;i<=MaxPictureId;i++){//此处似乎会出现重复打标签的问题-ysh
                    if (pictureDao.getPicture(i)!=null) {
                        if(pictureDao.getPicture(i).getPicThumbnailPath()!=null){
                            //将路径放入百度接口识别//将识别结果写入数据库
                            System.out.println("处理picId="+i);
                            readJsonService.getBaiDuJson(pictureDao.getPicture(i).getPicId(),baiDuAiService.TongYongWuTi(pictureDao.getPicture(i).getPicThumbnailPath()));
                        }
                    }
                }
            }
            //进行一段时间的休眠
            System.out.println("图片ai打标签功能进入休眠》》》》》》》》稍后会自动运行");
            Thread.sleep(100000);
        }
    }
}
