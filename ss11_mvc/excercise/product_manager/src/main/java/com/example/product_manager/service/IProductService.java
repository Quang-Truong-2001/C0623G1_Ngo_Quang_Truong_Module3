package com.example.product_manager.service;

import com.example.product_manager.model.Product;

import java.util.List;

public interface IProductService {
    List<Product> getList();
    void save(Product product);
    void update(int id, Product product);
    void delete(int id);
    Product detail(int id);
    List<Product> find(String name);
}
