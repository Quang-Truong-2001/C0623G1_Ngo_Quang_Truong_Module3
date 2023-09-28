package com.example.again.service;

import com.example.again.model.Product;

import java.util.List;

public interface IServiceProduct {
    List<Product> getList();
    void save(Product product);
    void update(int id, Product product);
    void delete(int id);
    Product detail(int id);
    List<Product> find(String name);
}
