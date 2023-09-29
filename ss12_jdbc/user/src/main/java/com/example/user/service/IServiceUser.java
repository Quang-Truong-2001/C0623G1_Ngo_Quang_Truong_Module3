package com.example.user.service;

import com.example.user.model.User;

import java.util.List;

public interface IServiceUser {
    List<User> getList();
    void save(User user);
    void update(User user);
    void delete(int id);

    User detail(int id);

    List<User> find(String country);
}
