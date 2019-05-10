package com.pichub.hello.service.impl;


import com.baidu.aip.util.Base64Util;
import com.pichub.hello.bo.FileUtil;
import com.pichub.hello.bo.HttpUtil;
import com.pichub.hello.dao.PictureDao;
import com.pichub.hello.service.BaiDuAiService;
import com.pichub.hello.service.ReadJsonService;
import com.pichub.hello.web.AlbumController;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

@Service("baiDuAiService")

public class BaiduAiServiceImpl implements BaiDuAiService {
    @Autowired
    PictureDao pictureDao;
    @Autowired
    ReadJsonService readJsonService;

    //图片地址
    //public String filePath="D:/123.jpg";

    //设置APPID/AK/SK
    public static final String APP_ID = "15830897";
    public static final String API_KEY = "nTEvGCU4s8QboxwAYHr0DEjG";
    public static final String SECRET_KEY = "mzpshf9qwpeBiCvV75ylmtrtHLU0QH0f";
    @Override
    /**
     * 获取token类
     */
    /**
     * 获取权限token
     * @return 返回示例：
     * {
     * "access_token": "24.460da4889caad24cccdb1fea17221975.2592000.1491995545.282335-1234567",
     * "expires_in": 2592000
     * }
     */
    public String getAuth() {
        // 官网获取的 API Key 更新为你注册的
        String clientId = API_KEY;
        // 官网获取的 Secret Key 更新为你注册的
        String clientSecret = SECRET_KEY;
        return getAuth(clientId, clientSecret);
    }
    /**
     * 获取API访问token
     * 该token有一定的有效期，需要自行管理，当失效时需重新获取.
     * @param ak - 百度云官网获取的 API Key
     * @param sk - 百度云官网获取的 Securet Key
     * @return assess_token 示例：
     * "24.460da4889caad24cccdb1fea17221975.2592000.1491995545.282335-1234567"
     */
    @Override
    public String getAuth(String ak, String sk) {
        // 获取token地址
        String authHost = "https://aip.baidubce.com/oauth/2.0/token?";
        String getAccessTokenUrl = authHost
                // 1. grant_type为固定参数
                + "grant_type=client_credentials"
                // 2. 官网获取的 API Key
                + "&client_id=" + ak
                // 3. 官网获取的 Secret Key
                + "&client_secret=" + sk;
        try {
            URL realUrl = new URL(getAccessTokenUrl);
            // 打开和URL之间的连接
            HttpURLConnection connection = (HttpURLConnection) realUrl.openConnection();
            connection.setRequestMethod("GET");
            connection.connect();
            // 获取所有响应头字段
            Map<String, List<String>> map = connection.getHeaderFields();
            // 遍历所有的响应头字段
            for (String key : map.keySet()) {
                System.err.println(key + "--->" + map.get(key));
            }
            // 定义 BufferedReader输入流来读取URL的响应
            BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream()));
            String result = "";
            String line;
            while ((line = in.readLine()) != null) {
                result += line;
            }
            /**
             * 返回结果示例
             */
            System.err.println("result:" + result);
            JSONObject jsonObject = new JSONObject(result);
            String access_token = jsonObject.getString("access_token");
            System.out.println("access_token为："+access_token);
            return access_token;
        } catch (Exception e) {
            System.err.printf("获取token失败！");
            e.printStackTrace(System.err);
        }
        System.out.println("access_token获取失败");
        return null;
    }

    @Override
    public String TongYongWuTi(String picturePath) {
        /**
         * 重要提示代码中所需工具类
         * FileUtil,Base64Util,HttpUtil,GsonUtils请从
         * https://ai.baidu.com/file/658A35ABAB2D404FBF903F64D47C1F72
         * https://ai.baidu.com/file/C8D81F3301E24D2892968F09AE1AD6E2
         * https://ai.baidu.com/file/544D677F5D4E4F17B4122FBD60DB82B3
         * https://ai.baidu.com/file/470B3ACCA3FE43788B5A963BF0B625F3
         * 下载
         */
        // 请求url
        String url = "https://aip.baidubce.com/rest/2.0/image-classify/v2/advanced_general";
        String path=picturePath.replace("main/resources\\originPictures\\","");
        path="originPictures/"+path;
        URL filePath =this.getClass().getClassLoader().getResource(path);
        String realPath="";
        if(filePath!=null)
            realPath=filePath.toString().replace("file:/","");
            try {
                // 本地文件路径
                //String path=Class.class.getClass().getResource("/").getPath();
                //String path=System.getProperty("user.dir");
                //String filePath = path+"\\src\\"+picturePath;
                //String filePath = "E:\\IdeaProjects\\hello\\src\\"+picturePath;//绝对路径，视自身情况而定
                byte[] imgData = FileUtil.readFileByBytes(realPath);
                String imgStr = Base64Util.encode(imgData);
                String imgParam = URLEncoder.encode(imgStr, "UTF-8");
                String param = "image=" + imgParam;
                // 注意这里仅为了简化编码每一次请求都去获取access_token，线上环境access_token有过期时间， 客户端可自行缓存，过期后重新获取。
                //String accessToken = "24.22bad803c294655d3a1f958545a5444f.2592000.1555945601.282335-15830897";
                String accessToken = "24.18751d0c6a6c2fa14e994764fef0f68c.2592000.1559146653.282335-15830897";
                String result = HttpUtil.post(url, accessToken, param);
                //System.out.println(result);
                return result;
            } catch (FileNotFoundException e) {
                System.out.println("Dotag操作-IO异常或没有此路径。");
                //e.printStackTrace();
                return null;
            }
            catch (Exception e) {
                e.printStackTrace();
            }
            return null;
    }

    @Override
    public void doTag() throws Exception{
        while(true){
            int MaxPictureTagId=pictureDao.checkMaxPictureTagId();
            int MaxPictureId=pictureDao.checkMaxPictureId();
            if(MaxPictureTagId<MaxPictureId){
                for (int i=MaxPictureTagId;i<MaxPictureId;i++){
                    if(pictureDao.getPicture(i).getPicPath()!=null){
                        //将路径放入百度接口识别//将识别结果写入数据库
                        readJsonService.getBaiDuJson(pictureDao.getPicture(i).getPicId(),TongYongWuTi(pictureDao.getPicture(i).getPicPath()));
                    }
                }
            }
            //进行一段时间的休眠
        }
    }
}
