package com.lixin.library.service.impl;

import com.lixin.library.domain.Book;
import com.lixin.library.domain.User;
import com.lixin.library.mapper.BookMapper;
import com.lixin.library.service.IBookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.util.List;

@Service
public class BookService implements IBookService{
    @Autowired
    private BookMapper bookMapper;


    @Override
    public void allBooks(HttpSession session) {
        List<Book>allBooks=bookMapper.findAllBook();
        session.setAttribute("allBooks",allBooks);
    }

    @Override
    public void enableBorrow(HttpSession session) {
        List<Book>enableBooks=bookMapper.findByState(0);
        session.setAttribute("enableBooks",enableBooks );
    }

    @Override
    public Book findById(int id) {
        return bookMapper.findById(id);
    }

    @Override
    public void updateBook(Book book) {
        bookMapper.updateBook(book);
    }

    @Override
    public void returnBook(HttpSession session) {
        User user= (User) session.getAttribute("user");
        List <Book>borrowedBook=bookMapper.findByState(user.getId());
        session.setAttribute("borrowedBook",borrowedBook);
    }


}
