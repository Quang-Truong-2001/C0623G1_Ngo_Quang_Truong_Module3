package com.example.user.service.impl;

import com.example.user.model.User;
import com.example.user.repository.IRepositoryUser;
import com.example.user.repository.impl.RepositoryUserImpl;
import com.example.user.service.IServiceUser;

import java.sql.SQLException;
import java.util.List;

public class ServiceUserImpl implements IServiceUser {
    private final static IRepositoryUser repository = new RepositoryUserImpl();

    @Override
    public List<User> getList() {
        return repository.getList();
    }

    @Override
    public void save(User user) {
        repository.save(user);

    }

    @Override
    public void update(User user) {
        repository.update(user);
    }

    @Override
    public void delete(int id) throws Exception {
        repository.delete(id);
    }

    @Override
    public User detail(int id) {
        return repository.detail(id);
    }

    @Override
    public List<User> find(String country) {
        try {
            return repository.find(country);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
