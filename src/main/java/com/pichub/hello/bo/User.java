package com.pichub.hello.bo;

public class User {
    private  Long userId;
    private  String   userName;
  /*  email
            password
    create_time
            gender
    subscription
            avatar_path
    capacity
            used_capacity
    qq_num
            wechat_num
    phone*/

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
}
