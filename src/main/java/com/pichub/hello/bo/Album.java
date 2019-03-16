package com.pichub.hello.bo;

import java.util.Date;

public class Album {
    private Long album_id;
    private String album_name;
    private Date create_time;
    private Date update_time;
    private int album_state;
    private Long user_id;
    private String cover_thumbnail_path;

    public Long getAlbum_id() {
        return album_id;
    }

    public void setAlbum_id(Long album_id) {
        this.album_id = album_id;
    }

    public String getAlbum_name() {
        return album_name;
    }

    public void setAlbum_name(String album_name) {
        this.album_name = album_name;
    }

    public Date getCreate_time() {
        return create_time;
    }

    public void setCreate_time(Date create_time) {
        this.create_time = create_time;
    }

    public Date getUpdate_time() {
        return update_time;
    }

    public void setUpdate_time(Date update_time) {
        this.update_time = update_time;
    }

    public int getAlbum_state() {
        return album_state;
    }

    public void setAlbum_state(int album_state) {
        this.album_state = album_state;
    }

    public Long getUser_id() {
        return user_id;
    }

    public void setUser_id(Long user_id) {
        this.user_id = user_id;
    }

    public String getCover_thumbnail_path() {
        return cover_thumbnail_path;
    }

    public void setCover_thumbnail_path(String cover_thumbnail_path) {
        this.cover_thumbnail_path = cover_thumbnail_path;
    }
}
