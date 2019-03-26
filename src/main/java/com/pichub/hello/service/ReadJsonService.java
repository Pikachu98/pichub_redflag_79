package com.pichub.hello.service;

import com.fasterxml.jackson.annotation.JsonCreator;
import org.json.JSONObject;

public interface ReadJsonService {
    String getBaiDuJson(String result);
    String getTecentJson(String result);
}
