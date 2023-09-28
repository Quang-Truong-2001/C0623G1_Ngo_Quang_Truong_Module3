package com.example.th1.repository.impl;

import com.example.th1.model.Customer;
import com.example.th1.repository.ICustomerRepository;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class CustomerRepository implements ICustomerRepository {
    private final static List<Customer> customers;

    static {
        customers=new ArrayList<>();
        customers.add(new Customer(1, "John", "john@codegym.vn", "Hanoi"));
        customers.add(new Customer(2, "Bill", "bill@codegym.vn", "Danang"));
        customers.add(new Customer(3, "Alex", "alex@codegym.vn", "Saigon"));
        customers.add(new Customer(4, "Adam", "adam@codegym.vn", "Beijin"));
        customers.add(new Customer(5, "Sophia", "sophia@codegym.vn", "Miami"));
        customers.add(new Customer(6, "Rose", "rose@codegym.vn", "Newyork"));
    }

    @Override
    public List<Customer> findAll() {
        return customers;
    }

    @Override
    public void addOne(Customer customer) {
        customers.add(customer);
    }

    @Override
    public Customer findById(int id) {
        return customers.get(id);
    }

    @Override
    public void update(int id, Customer customer) {
        for(int i=0;i< customers.size();i++){
            if(customers.get(i).getId()==id){
                customers.get(i).setName(customer.getName());
                customers.get(i).setEmail(customer.getEmail());
                customers.get(i).setAddress(customer.getAddress());
            }
            break;
        }
    }

    @Override
    public void remove(int id) {
        for(int i=0;i< customers.size();i++){
            if(customers.get(i).getId()==id){
                customers.remove(customers.get(i));
            }
            break;
        }
    }
}
