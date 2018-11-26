package com.lixin.library.service;

import com.lixin.library.domain.Book;

import javax.servlet.http.HttpSession;
import java.util.List;

public interface IBookService {

    public void allBooks(HttpSession session );//所有书

    public void enableBorrow(HttpSession session );//可借书籍

    public Book findById(int id);//id查找

    public void updateBook(Book book );//更新书籍状态

    public void returnBook(HttpSession session );//还书
}
