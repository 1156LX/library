package com.lixin.library.mapper;

import com.lixin.library.domain.Book;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
@Mapper
public interface BookMapper {

    public void addBook(Book book);

    public List<Book>findAllBook();

    public void deleteBook(int id);

    public void updateBook(Book book);

    public List<Book>findByState(int state);

    public Book findById(int id);

}
