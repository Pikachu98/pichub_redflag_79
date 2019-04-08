package com.pichub.hello.bo;

import java.util.Date;

/**
 * Created by root on 19-3-16.
 */
public class Picture {
    private int picId;
    private String picName;
    private Date uploadTime;
    private int delState;
    private String picStory;
    private long userId;
    private String picPath;
    private String picThumbnailPath;
    private long picSize;

    public int getPicId(){return picId;}

    public void setPicId(int picId){this.picId = picId;}

    public String getPicName(){return picName;}

    public void setPicName(String picName){this.picName = picName;}

    public Date getUploadTime(){return uploadTime;}

    public void setUploadTime(Date uploadTime){this.uploadTime = uploadTime;}

    public int getDelState(){return  delState;}

    public void setDelState(int delState){this.delState = delState;}

    public String getStory(){return picStory;}

    public void setPicStory(String picStory){this.picStory = picStory;}

    public long getUserId(){return userId;}

    public void setUserId(long userId){this.userId = userId;}

    public String getPicPath(){return picPath;}

    public void setPicPath(String picPath){this.picPath = picPath;}

    public String getPicThumbnailPath(){return picThumbnailPath;}

    public void setPicThumbnailPath(String picThumbnailPath){this.picThumbnailPath = picThumbnailPath;}

    public long getPicSize(){return picSize;}

    public void setPicSize(long picSize){this.picSize = picSize;}

}
