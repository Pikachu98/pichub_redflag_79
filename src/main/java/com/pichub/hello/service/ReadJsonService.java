package com.pichub.hello.service;

import com.fasterxml.jackson.annotation.JsonCreator;
import org.json.JSONObject;

public interface ReadJsonService {
    String getBaiDuJson(int pictureId,String result);
    String getTecentJson(String result);
}
