package com.pichub.hello.service.impl;

import com.pichub.hello.dao.PictureDao;
import com.pichub.hello.service.BaiDuAiService;
import com.pichub.hello.service.ReadJsonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("doTagService")
public class DoTagService{
    @Autowired
    PictureDao pictureDao;
    @Autowired
    ReadJsonService readJsonService;
    @Autowired
    BaiDuAiService baiDuAiService;

    public void doTag() throws Exception{
        int MaxPictureTagId = pictureDao.checkMaxPictureTagId();
        int MaxPictureId = pictureDao.checkMaxPictureId();
        if (MaxPictureTagId < MaxPictureId) {
            for (int i = MaxPictureTagId + 1; i <= MaxPictureId; i++) {//此处似乎会出现重复打标签的问题-ysh
                if (pictureDao.getPicture(i) != null) {
                    if (pictureDao.getPicture(i).getPicThumbnailPath() != null) {
                        //将路径放入百度接口识别//将识别结果写入数据库
                        System.out.println("处理picId=" + i);
                        readJsonService.getBaiDuJson(pictureDao.getPicture(i).getPicId(), baiDuAiService.TongYongWuTi(pictureDao.getPicture(i).getPicPath()));
                    }
                }
            }
        }
        //进行一段时间的休眠
        System.out.println("图片ai打标签功能进入休眠状态》》》》》》》》10分钟会自动运行一次");
        //Thread.sleep(600000);
    }
}
