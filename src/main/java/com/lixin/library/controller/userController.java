package com.lixin.library.controller;

import com.lixin.library.service.impl.BookService;
import com.lixin.library.service.impl.RecordService;
import com.lixin.library.service.impl.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/user")
public class userController {
    @Autowired
    private UserService userService;
    @Autowired
    private BookService bookService;
    @Autowired
    private RecordService recordService;


    /*
    用户注册
     */
    @RequestMapping("/doReg")
    public String doReg(@RequestParam("file")MultipartFile file,HttpSession session , HttpServletRequest request ){
        int state=userService.userReg(file,request);
        if(state==-1){
            return "user/reg";
        }
        else if(state==0){
            return "user/reg";
        }
        else return"ss";
    }
    /*
    修改个人资料
     */
    @RequestMapping("/update")
    public String update(@RequestParam("file")MultipartFile file,HttpServletRequest request ){
        int state=userService.updateUser(file,request);
        if(state==-1){
            return "redict:user/update";
        }
        else if(state==0){
            return "user/update";
        }
        else return"ss";
    }
    /*
    修改密码
     */
    @RequestMapping("/changePassword")
    public String changePassword(HttpServletRequest request ){
        int state=userService.changePassword(request);
        System.out.println(state);
        if(state==-1){
            return "user/changePassword";
        }
        else if(state==0){
            return "user/changePassword";
        }
        else return"ss";
    }

    /*
    查看所有书籍
     */
    @RequestMapping("/allBooks")
    public String allBooks(HttpSession session ){
        bookService.allBooks(session);
        return "allBooks";
    }

    /*
     借书页面
     */
    @RequestMapping("/borrowBook")
    public String borrowBook(HttpServletRequest request ,HttpSession session ){
           bookService.enableBorrow(session);
           return "user/borrowBook";
    }
    /*
    借书
     */
    @RequestMapping("/doBorrow")
    public String doBorrow(HttpServletRequest request){
        userService .doBorrow(request );
        return "ss";
    }

    /*
    还书页面
     */
     @RequestMapping("/returnRecord")
     public String returnBook(HttpSession session){
         recordService.returnRecord(session);
         return "user/returnRecord";
     }

    /*
    还书
     */
    @RequestMapping("/doReturn")
    public String doReturn(HttpServletRequest request){
        userService.doReturn(request);
        return "ss";
    }
    /*
    查看记录
     */
     @RequestMapping("/allRecord")
    public String allRecord(HttpSession session){
         recordService.findAllRecord(session);
         return"user/allRecord";
     }


    /*
    退出登录
     */
    @RequestMapping("/downline")
    public String downline(HttpSession session ){
        session.invalidate();
        return "login";
    }
}
