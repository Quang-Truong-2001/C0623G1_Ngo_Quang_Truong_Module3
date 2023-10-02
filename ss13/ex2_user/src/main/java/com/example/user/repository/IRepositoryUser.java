package com.example.user.repository;

import com.example.user.model.User;

import java.sql.SQLException;
import java.util.List;

public interface IRepositoryUser {
    List<User> getList();
    void save(User user);
    void update(User user);
    void delete(int id) throws SQLException;
    User detail(int id);

    List<User> find(String country) throws SQLException;
}
