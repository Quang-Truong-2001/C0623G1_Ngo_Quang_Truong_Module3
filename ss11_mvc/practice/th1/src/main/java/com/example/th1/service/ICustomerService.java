package com.example.th1.service;

import com.example.th1.model.Customer;

import java.util.List;

public interface ICustomerService {
    List<Customer> findAll();
    void addOne(Customer customer);
    Customer findById(int id);
    void update(int id, Customer customer);
    void remove(int id);
}
