package com.example.user.service;

import com.example.user.model.User;

import java.sql.SQLException;
import java.util.List;

public interface IServiceUser {
    List<User> getList();
    void save(User user);
    void update(User user) throws Exception;
    void delete(int id) throws Exception;

    User detail(int id);

    List<User> find(String country);

}
