package com.lixin.library.service.impl;

import com.lixin.library.domain.Book;
import com.lixin.library.domain.Record;
import com.lixin.library.domain.User;
import com.lixin.library.mapper.UserMapper;
import com.lixin.library.service.IUserService;
import com.lixin.library.util.FileUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.Date;

@Service
public class UserService implements IUserService {
    @Autowired
    private UserMapper userMapper;
    @Autowired
    private BookService bookService;
    @Autowired
    private RecordService recordService;

    /*
       登录
    */
    @Override
    public User userLogin(String username,String password) {
         User user=userMapper.findByUsername(username);
         if(null==user){
             return null;
         }
         else{
             if(user.getPassword().equals(password))return user;
             else return null;
         }
    }

    /*
    注册
     */
    @Override
    public int userReg(MultipartFile file,HttpServletRequest request) {
        String username=request.getParameter("username");
        String password1=request.getParameter("password1");
        String password2=request.getParameter("password2");
        if(username==null||password1==null )return -1;
        User user1=userMapper.findByUsername("username");
        if(null!=user1 || password1.equals(password2)==false ){
            return 0 ;
        }
        User user = new User();
        user.setUsername(username);
        user.setPassword(password1);
        user.setEmail(request.getParameter("email") );
        user.setPhone(request.getParameter("phone") );
        userMapper.addUser(user);
        User user2=userMapper.findByUsername(username);
        int id=user2.getId();
        String pic1="D:/img/"+id+".jpg";
        String pic="/images/"+id+".jpg";
        if(FileUtil.upload(file,pic1)==1){
            user2.setPic(pic);
        }else System.out.println("上传失败");
        userMapper.updateUser(user2);
        System.out.println(user2);
        return 1;
    }

    /*
    修改个人信息
     */
    @Override
    public int  updateUser(MultipartFile file,HttpServletRequest request) {
        User user= (User) request.getSession().getAttribute("user");
        String username=request.getParameter("username");
        if(username==null)return -1;
        User user1=userMapper.findByUsername(username);
        if(user1!=null)return 0;
        user.setUsername(request.getParameter("username") );
        user.setEmail(request.getParameter("email") );
        user.setPhone(request.getParameter("phone") );
        String pic1="D:/img/"+user.getId()+".jpg";
        String pic="/images/"+user.getId()+".jpg";
        if(FileUtil.upload(file,pic1)==1){
            user.setPic(pic);
        }else System.out.println("上传失败");
        System.out.println(user);
        userMapper.updateUser(user);
        return 1;

    }

    /*
    修改密码
     */
    @Override
    public int changePassword(HttpServletRequest request) {
        String password=request.getParameter("password");
        String password1=request.getParameter("password1");
        String password2=request.getParameter("password2");
        User user= (User) request.getSession().getAttribute("user");
        System.out.println(user);
        if(user.getPassword().equals(password)==false ){
            return -1;
        }
        else if(password1.equals(password2)==false ){
            return 0;
        }
        else{
             user.setPassword(password1);
             userMapper.updateUser(user);
             return 1;
        }
    }

    /*
    借书
     */
    @Override
    public void doBorrow(HttpServletRequest request ) {
        User user= (User) request.getSession().getAttribute("user");
        int id=Integer.parseInt(request.getParameter("bookId"));
        System.out.println(id);
        Book book=bookService.findById(id);
        System.out.println(book);
        book.setState(user.getId());
        bookService.updateBook(book);
        Date t=new Date();
        SimpleDateFormat format =new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String startDate=format.format(t.getTime());
        Record record=new Record();
        record.setBookName(book.getBookName());
        record.setBookId(book.getId());
        record.setPublish(book.getPublish());
        record.setAuthor(book.getAuthor());
        record.setStartDate(startDate);
        record.setState(user.getId());
        //record.setEndDate(null);
        System.out.println(record);
        recordService.addRecord(record);
    }
    /*
    还书
     */
    @Override
    public void doReturn(HttpServletRequest request) {
        int id=Integer.parseInt(request.getParameter("recordId"));
        Record record=recordService.findById(id);
        Date t=new Date();
        SimpleDateFormat format =new SimpleDateFormat("yyyy-MM-dd HH:mm");
        String endDate=format.format(t.getTime());
        record.setEndDate(endDate);
        System.out.println(record);
        recordService.updateRecord(record);
        int bookId=record.getBookId();
        Book book=bookService.findById(bookId);
        book.setState(0);
        bookService.updateBook(book);
        System.out.println(book);
    }



}
