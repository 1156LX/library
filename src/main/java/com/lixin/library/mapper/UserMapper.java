package com.lixin.library.mapper;

import com.lixin.library.domain.User;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserMapper {

    public User findByUsername(String username);

    public void addUser(User user);

    public void updateUser(User user);
}
