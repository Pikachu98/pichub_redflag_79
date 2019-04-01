package com.pichub.hello.service;

import java.io.IOException;

public interface BaiDuAiService {
    String getAuth();
    String getAuth(String ak, String sk);
    String TongYongWuTi(String picturePath);
    void doTag() throws Exception;
}
