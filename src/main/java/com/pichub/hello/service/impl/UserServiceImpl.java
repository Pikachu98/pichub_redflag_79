package com.pichub.hello.service.impl;

import com.pichub.hello.bo.Photo;
import com.pichub.hello.bo.User;
import com.pichub.hello.dao.UserDao;
import com.pichub.hello.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import sun.misc.BASE64Decoder;

import javax.servlet.http.HttpServletRequest;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.util.List;

@Service("userService")
public class UserServiceImpl implements UserService {
    @Autowired
    UserDao userDao;


    /*
     * @判断用户是否存在，以及密码是否正确
     * */
    @Override
    public int checkLogin(User user, HttpServletRequest request){
        String inputPsw = user.getUserPassword();
        User trueUser = userDao.tOrfUserName(user.getUserEmail());
        if(trueUser !=null){
            if (inputPsw.equals(trueUser.getUserPassword())) {
                request.getSession().setAttribute("userName", trueUser.getUserName());
                request.getSession().setAttribute("userId", trueUser.getUserId());
                request.getSession().setAttribute("user", trueUser);

                return 200;//欢迎登陆
            }
            else {
                return 150;//密码错误
            }
        }
        else
            return 100;//用户名不存在

    }


    @Override
    public User getUser(Long userId)throws Exception{
        return userDao.getUser(userId);
    }

//    @Override
//    public String getUserName(String userEmail) {
//        return userDao.getUserName(userEmail);
//    }

    @Override
    public int changePassword(String userEmail, String userPassword) throws Exception {
        if(userDao.changePassword(userEmail, userPassword) > 0 )
            return userDao.changePassword(userEmail,userPassword);
        else
            return 0;
    }

    @Override
    public int insertUser(User user) throws Exception {

        return userDao.insertUser(user);
    }

    public boolean belikeCheck(Long  userId, long pictureId)throws Exception{
        int flag = userDao.belikeCheck(userId, pictureId);
        if(flag > 0)    return true;
        else return false;

    }

    public boolean deleteBelike(Long  userId, long pictureId)throws Exception{
        return userDao.deleteBelike(userId, pictureId);
    }

    public boolean insertBelike(Long userId, long pictureId)throws Exception{
        return userDao.insertBelike(userId, pictureId);
    }

    @Override
    public String getUserName(String userEmail) {
        return userDao.getUserName(userEmail);
    }

    @Override
    public int checkEmail(String email) {
        if (userDao.checkEmail(email) != null)
            return 10;//10表示已有此email
        return 15;//15表示无此email
    }

    @Override
    public int doChangeEmail(String oldEmail, String oldCheckCode, String oldEmailCheckCode, String newEmail, String newCheckCode, String newEmailCheckCode) {
        if(oldCheckCode.equals(oldEmailCheckCode)!=true|| newCheckCode.equals(newEmailCheckCode)!=true)
            return 100;
        else if (checkEmail(oldEmail)==15)
            return 150;
        else if(checkEmail(newEmail)==10)
            return 200;
        else if(oldCheckCode.equals(oldEmailCheckCode)&&newCheckCode.equals(newEmailCheckCode)&&checkEmail(oldEmail)==10&&checkEmail(newEmail)==15){
            userDao.changeEmail(oldEmail,newEmail);
            return 250;
        }
        else
            return 0;
    }

    @Override
    public boolean checkUserName(String userName) throws Exception {
        List<User> userList = userDao.existByUserName(userName);
        //用户名已存在是true
        if(userList.size() > 0)
                return true;
        else
            return false;
    }

    @Override
    public boolean checkEmailExist(String email) throws Exception {
        List<User> emailList = userDao.existByEmail(email);
        //邮箱已存在是true
        if(emailList.size() > 0)
            return true;
        else
            return false;
    }

    public void changeAvatar(long userId, String avatarPath)throws Exception
    {
        userDao.changeAvatarPath(userId,avatarPath);
    }

    @Override
    public User getUser(long userId) throws Exception {
        return userDao.getUser(userId);
    }

    @Override
    public String getAvatarPath(long userId) {
        if(userDao.getUser(userId).getAvatarPath()==null||userDao.getUser(userId).getAvatarPath()=="")
            return "/111.jpg";
        return userDao.getUser(userId).getAvatarPath();
    }

    @Override
    //base64字符串转化成图片
    public boolean GenerateImage(String imgStr) {
        //对字节数组字符串进行Base64解码并生成图片
        if (imgStr == null) //图像数据为空
            return false;
        BASE64Decoder decoder = new BASE64Decoder();
        try
        {
            //Base64解码
            byte[] b = decoder.decodeBuffer(imgStr);
            for(int i=0;i<b.length;++i)
            {
                if(b[i]<0)
                {//调整异常数据
                    b[i]+=256;
                }
            }
            //生成jpeg图片
            String imgFilePath = "D:\\new.jpg";//新生成的图片
            OutputStream out = new FileOutputStream(imgFilePath);
            out.write(b);
            out.flush();
            out.close();
            return true;
        }
        catch (Exception e)
        {
            e.printStackTrace();
            return false;
        }
    }
}
