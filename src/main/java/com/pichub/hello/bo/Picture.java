package com.pichub.hello.bo;

import java.util.Date;

/**
 * Created by root on 19-3-16.
 */
public class Picture {
    private long picId;
    private String picName;
    private Date uploadTime;
    private Date delTime;
    private String story;
    private long userId;
    private String picPath;
    private String picThumbnailPath;
    private byte size;

    public long getPicId(){return picId;}

    public void setPicId(long picId){this.picId = picId;}

    public String getPicName(){return picName;}

    public void setPicName(String picName){this.picName = picName;}

    public Date getUploadTime(){return uploadTime;}

    public void setUploadTime(Date uploadTime){this.uploadTime = uploadTime;}

    public Date getDelTime(){return  delTime;}

    public void setDelTime(Date delTime){this.delTime = delTime;}

    public String getStory(){return story;}

    public void setStory(String story){this.story = story;}

    public long getUserId(){return userId;}

    public void setUserId(long userId){this.userId = userId;}

    public String getPicPath(){return picPath;}

    public void setPicPath(String picPath){this.picPath = picPath;}

    public String getPicThumbnailPath(){return picThumbnailPath;}

    public void setPicThumbnailPath(String picThumbnailPath){this.picThumbnailPath = picThumbnailPath;}

    public byte getSize(){return size;}

    public void setSize(byte size){this.size = size;}
}
