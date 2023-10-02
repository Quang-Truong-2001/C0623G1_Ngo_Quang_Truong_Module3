package com.example.user.repository.impl;

import com.example.user.model.User;
import com.example.user.repository.BaseRepository;
import com.example.user.repository.IRepositoryUser;

import javax.xml.transform.Result;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class RepositoryUserImpl implements IRepositoryUser {
    private static final String SELECT="call getList()";
    private static final String DELETE="call delete_user(?);";
    private static final String INSERT="insert into user_manager(`name`,email,country) \n" +
            "values(?,?,?);";
    private static final String UPDATE="call update_user(?,?,?,?);";
    private static final String DETAIL="select * from user_manager \n" +
            "where id=?;";

    private static final String FIND="select * from user_manager \n" +
            "where country=?;";
    @Override
    public List<User> find(String country) throws SQLException {
        Connection connection=BaseRepository.getConnection();
        PreparedStatement preparedStatement=connection.prepareStatement(FIND);
        preparedStatement.setString(1,country);
        ResultSet resultSet=preparedStatement.executeQuery();
        List<User> list=new ArrayList<>();
        User user;
        while (resultSet.next()){
            int id= resultSet.getInt("id");
            String name=resultSet.getString("name");
            String email=resultSet.getString("email");
            String countryName=resultSet.getString("country");
            user=new User(id, name,email,countryName);
            list.add(user);
        }
        return list;
    }
    @Override
    public List<User> getList() {
        Connection connection=BaseRepository.getConnection();
        List<User> list=new ArrayList<>();
        User user;
        try {
            CallableStatement callableStatement=connection.prepareCall(SELECT);
            ResultSet resultSet=callableStatement.executeQuery();
            while (resultSet.next()){
                int id=resultSet.getInt("id");
                String name=resultSet.getString("name");
                String email=resultSet.getString("email");
                String country=resultSet.getString("country");
                user=new User(id,name,email,country);
                list.add(user);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            try {
                connection.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
        return list;
    }

    @Override
    public void save(User user) {
        Connection connection=BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement= connection.prepareStatement(INSERT);
            preparedStatement.setString(1, user.getName());
            preparedStatement.setString(2, user.getEmail());
            preparedStatement.setString(3, user.getCountry());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            try {
                connection.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
    }

    @Override
    public void update(User user) {
        Connection connection=BaseRepository.getConnection();
        try {
            CallableStatement callableStatement=connection.prepareCall(UPDATE);
            callableStatement.setString(1, user.getName());
            callableStatement.setString(2, user.getEmail());
            callableStatement.setString(3, user.getCountry());
            callableStatement.setInt(4,user.getId());
            callableStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void delete(int id) throws SQLException {
        Connection connection=BaseRepository.getConnection();
        CallableStatement callableStatement=connection.prepareCall(DELETE);
        callableStatement.setInt(1,id);
        callableStatement.executeUpdate();
    }

    @Override
    public User detail(int id) {
        Connection connection=BaseRepository.getConnection();
        User user = null;
        try {
            PreparedStatement preparedStatement=connection.prepareStatement(DETAIL);
            preparedStatement.setInt(1,id);
            ResultSet resultSet= preparedStatement.executeQuery();
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


}
