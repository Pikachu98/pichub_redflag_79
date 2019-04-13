package com.pichub.hello.bo;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Date;

public class User {
    private Long userId;
    private String userName;
    private String userEmail;
    private String userPassword;
    private Date createTime;
    private char userGender;
    private String userDescription;
    private String avatarPath;
    private Long userCapacity;
    private Long usedCapacity;
    private String wechatNum;
    private String qqNum;
    private String userPhone;

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }

    public String getUserPassword() {
        return userPassword;
    }

    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

//    public char getUserGender() {
//        return userGender;
//    }
//
//    public void setUserGender(char userGender) {
//        this.userGender = userGender;
//    }

    public String getUserDescription() {
        return userDescription;
    }

    public void setUserDescription(String userDescription) {
        this.userDescription = userDescription;
    }

    public String getAvatarPath() {
        return avatarPath;
    }

    public void setAvatarPath(String avatarPath) {
        this.avatarPath = avatarPath;
    }

    public Long getUserCapacity() {
        return userCapacity;
    }

    public void setUserCapacity(Long userCapacity) {
        this.userCapacity = userCapacity;
    }

    public Long getUsedCapacity() {
        return usedCapacity;
    }

    public void setUsedCapacity(Long usedCapacity) {
        this.usedCapacity = usedCapacity;
    }

    public String getWechatNum() {
        return wechatNum;
    }

    public void setWechatNum(String wechatNum) {
        this.wechatNum = wechatNum;
    }

    public String getQqNum() {
        return qqNum;
    }

    public void setQqNum(String qqNum) {
        this.qqNum = qqNum;
    }

    public String getUserPhone() {
        return userPhone;
    }

    public void setUserPhone(String userPhone) {
        this.userPhone = userPhone;
    }

    public static User getCurrentUser(HttpServletRequest request){
        return (User)request.getSession().getAttribute("user");
    }
}
