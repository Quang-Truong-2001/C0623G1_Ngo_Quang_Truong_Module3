package com.example.th1.service.impl;

import com.example.th1.model.Customer;
import com.example.th1.repository.ICustomerRepository;
import com.example.th1.repository.impl.CustomerRepository;
import com.example.th1.service.ICustomerService;

import java.util.List;

public class CustomerServiceImpl implements ICustomerService {
    private final ICustomerRepository repository = new CustomerRepository();

    @Override
    public List<Customer> findAll() {
        return repository.findAll();
    }

    @Override
    public void addOne(Customer customer) {
        repository.addOne(customer);
    }

    @Override
    public Customer findById(int id) {
        return repository.findById(id);
    }

    @Override
    public void update(int id, Customer customer) {
        repository.update(id,customer);
    }

    @Override
    public void remove(int id) {
        repository.remove(id);
    }
}
