package com.pichub.hello.service.impl;

import com.fasterxml.jackson.annotation.JsonCreator;
import com.pichub.hello.service.ReadJsonService;
import org.json.JSONArray;
import org.json.JSONObject;
import org.json.JSONString;
import org.springframework.stereotype.Service;

import java.io.FileReader;

@Service("readJsonService")
public class ReadJsonServiceImpl implements ReadJsonService {
    @Override
    public String getJson(String result) {
        JSONObject jsonObjName = new JSONObject(result);
        int result_num=(int)jsonObjName.get("result_num");
        JSONArray true_result=(JSONArray)jsonObjName.get("result");
        System.out.println("得到的result_num为"+jsonObjName.get("result_num"));
        System.out.println("得到的result为"+jsonObjName.get("result"));
        return null;
    }
}