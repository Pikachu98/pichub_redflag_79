package com.pichub.hello.bo;

import java.util.Date;

public class Album {
    private Long albumId;
    private String albumName;
    private Date createTime;
    private Date updateTime;
    private int albumState;
    private Long userId;
    private String coverThumbnailPath;

    public Long getAlbumId() {
        return albumId;
    }

    public void setAlbumId(Long albumId) {
        this.albumId = albumId;
    }

    public String getAlbumName() {
        return albumName;
    }

    public void setAlbumName(String albumName) {
        this.albumName = albumName;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public int getAlbumState() {
        return albumState;
    }

    public void setAlbumState(int albumState) {
        this.albumState = albumState;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public String getCoverThumbnailPath() {
        return coverThumbnailPath;
    }

    public void setCoverThumbnailPath(String coverThumbnailPath) {
        this.coverThumbnailPath = coverThumbnailPath;
    }
}
