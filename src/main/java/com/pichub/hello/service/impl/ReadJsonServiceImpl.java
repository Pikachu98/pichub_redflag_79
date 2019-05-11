package com.pichub.hello.service.impl;

import com.pichub.hello.dao.PictureDao;
import com.pichub.hello.service.ReadJsonService;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.IOException;


@Service("readJsonService")
public class ReadJsonServiceImpl implements ReadJsonService {
    @Autowired
    PictureDao pictureDao;

    @Override
    public String getBaiDuJson(int pictureId,String result){
        if (result==null)
            return null;
        /*if (jsonObjName.get("error_code")!=null){
            if ((int)jsonObjName.get("error_code")==216200)
            System.out.println("pictureId="+pictureId+":"+"此图片路径正确但文件已损坏或此文件不是图片>>>"+"result="+result);
        }*/
        else {
            JSONObject jsonObjName = new JSONObject(result);
            int result_num=(int)jsonObjName.get("result_num");
            JSONArray true_result=(JSONArray)jsonObjName.get("result");
            for(int i=0;i<result_num;i++){
                JSONObject jsonObject_trueresult=true_result.getJSONObject(i);
                Double score=(Double)jsonObject_trueresult.get("score");
                //String root=(String)jsonObject_trueresult.get("root");
                String keyword=(String)jsonObject_trueresult.get("keyword");
                pictureDao.insertTag(pictureId,score,keyword);
                //System.out.println(score+keyword);//得到的值
            }
        }
        return null;
    }

    @Override
    public String getTecentJson(String result){
        JSONObject jsonObjName = new JSONObject(result);
        JSONObject tag_list=(JSONObject)jsonObjName.get("data");
        JSONArray true_result=(JSONArray)tag_list.get("tag_list");
        for(int i=0;i<10;i++) {
            JSONObject jsonObject_trueResult=true_result.getJSONObject(i);
            String tag_name=(String) jsonObject_trueResult.get("tag_name");
            int tag_confidence=(int) jsonObject_trueResult.get("tag_confidence");
            try {//通过异常捕获方法，先转成int，当捕获到转int异常时，执行转double方法
                double tag_confidence_f=(double) jsonObject_trueResult.get("tag_confidence_f");
                System.out.print(tag_confidence_f);
            }catch (ClassCastException e){
                int tag_confidence_f=(int) jsonObject_trueResult.get("tag_confidence_f");
                System.out.print(tag_confidence_f);
            }
            //String tag_confidence_f=(String) jsonObject_trueResult.get("tag_confidence_f");
            System.out.println(tag_name+tag_confidence);
        }
        return null;
    }
}