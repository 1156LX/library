package com.lixin.library.service;

import com.lixin.library.domain.User;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;

public interface IUserService {
    //用户登录
    public User userLogin(String username,String password);

    //用户注册
    public int userReg(MultipartFile file,HttpServletRequest request);

    //修改个人信息
    public int updateUser(MultipartFile file,HttpServletRequest request );

    //修改密码
    public int changePassword(HttpServletRequest request);

    //借书
    public void doBorrow(HttpServletRequest request );

    //还书
    public void doReturn(HttpServletRequest request );
}
