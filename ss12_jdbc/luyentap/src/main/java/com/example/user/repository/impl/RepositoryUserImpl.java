package com.example.user.repository.impl;

import com.example.user.model.User;
import com.example.user.repository.BaseRepository;
import com.example.user.repository.IRepositoryUser;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class RepositoryUserImpl implements IRepositoryUser {
    private static final String SELECT="select * from user_manager;";
    private static final String DELETE="delete from user_manager\n" +
            "where id=?;";
    private static final String UPDATE="update user_manager\n" +
            "set `name`=?, email=?, country=?\n" +
            "where id=?;";
    private static final String DETAIL="select * from user_manager\n" +
            "where id=?;";
    private static final String SAVE="insert into user_manager(`name`,email,country)\n" +
            "values (?,?,?);";

    @Override
    public List<User> getList() {
        Connection connection= BaseRepository.getConnection();
        List<User> list=new ArrayList<>();
        User user;
        try {
            Statement statement=connection.createStatement();
            ResultSet resultSet=statement.executeQuery(SELECT);
            while (resultSet.next()){
                int id = resultSet.getInt("id");
                String name=resultSet.getString("name");
                String email=resultSet.getString("email");
                String country=resultSet.getString("country");
                user=new User(id,name,email,country);
                list.add(user);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return list;
    }

    @Override
    public void save(User user) {
        Connection connection=BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement=connection.prepareStatement(SAVE);
            preparedStatement.setString(1, user.getName());
            preparedStatement.setString(2, user.getEmail());
            preparedStatement.setString(3, user.getCountry());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    @Override
    public void update(User user) {
        Connection connection=BaseRepository.getConnection();

        try {
            PreparedStatement preparedStatement=connection.prepareStatement(UPDATE);
            preparedStatement.setInt(4,user.getId());
            preparedStatement.setString(1, user.getName());
            preparedStatement.setString(2, user.getEmail());
            preparedStatement.setString(3, user.getCountry());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void delete(int id) throws SQLException {
        Connection connection=BaseRepository.getConnection();
        PreparedStatement preparedStatement=connection.prepareStatement(DELETE);
        preparedStatement.setInt(1,id);
        preparedStatement.executeUpdate();
    }

    @Override
    public User detail(int id) {
        User user = null;
        Connection connection=BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement=connection.prepareStatement(DETAIL);
            preparedStatement.setInt(1,id);
            ResultSet resultSet=preparedStatement.executeQuery();
            while (resultSet.next()){
                String name=resultSet.getString("name");
                String email=resultSet.getString("email");
                String country=resultSet.getString("country");
                user=new User(id,name,email,country);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return user;
    }

    @Override
    public List<User> find(String country) throws SQLException {
        return null;
    }
}
