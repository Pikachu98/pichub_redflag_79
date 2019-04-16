package com.pichub.hello.dao;

import com.pichub.hello.bo.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.omg.PortableInterceptor.INACTIVE;

import java.util.List;

@Mapper
public interface UserDao {

    //关注用户功能
    boolean focusUser(@Param("userId1") Integer userId1,@Param("userId2") Integer userId2) throws Exception;
    //取消关注
    boolean delFocus(@Param("userId1") Integer userId1,@Param("userId2") Integer userId2) throws Exception;
    //查看关注
    int checkFocus(@Param("userId1") Integer userId1,@Param("userId2") Integer userId2) throws Exception;
    List<Integer> showMyFocus(@Param("userId") Integer userId) throws Exception;
    List<Integer> showFocusMe(@Param("userId")Integer userId) throws Exception;
    List<Integer> showMyLike(@Param("userId")Integer userId) throws Exception;
    List<Integer> showMyAlbum(@Param("userId")Integer userId) throws Exception;
    boolean changeUsername(@Param("userId")Integer userId, @Param("userName") String userName) throws Exception;

    int insertUser(@Param("user") User user)throws Exception;
    boolean existsByPhone(@Param("phone") String phone)throws Exception;
    List<User> existByUserName(@Param("userName")String userName);
    List<User> existByEmail(@Param("email")String email);

    User tOrfUser(@Param("userEmail")String userEmail,@Param("userPassword")String userPassword);
    User tOrfUserName(@Param("userEmail")String userEmail);
    String getUserName(@Param("userEmail") String userEmail);
    /*
    @修改密码
     */
    int changePassword(@Param("userEmail")String userEmail, @Param("userPassword")String userPassword);


    User getUser(@Param("userId")Long userId);
    //boolean focusUser(@Param("userId") Integer userId);
    int belikeCheck(@Param("userId") Long userId, @Param("pictureId") long pictureId)throws Exception;
    boolean deleteBelike(@Param("userId") Long  userId, @Param("pictureId") long pictureId)throws Exception;
    boolean insertBelike(@Param("userId") Long userId, @Param("pictureId") long pictureId)throws Exception;
    //int insertUser(@Param("user") User user) throws Exception;
    User checkEmail(@Param("email")String email);
    void changeEmail(@Param("oldEmail")String oldEmail,@Param("newEmail")String newEmail);

    void changeAvatarPath(@Param("userId") long userId, @Param("avatarPath") String avatarPath)throws Exception;
}
