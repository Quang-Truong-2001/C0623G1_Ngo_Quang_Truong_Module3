package com.example.product_manager.service.impl;

import com.example.product_manager.model.Product;
import com.example.product_manager.repository.IProductRepository;
import com.example.product_manager.repository.impl.ProductRepositoryImpl;
import com.example.product_manager.service.IProductService;

import java.util.ArrayList;
import java.util.List;

public class ProductServiceImpl implements IProductService {
    private static final IProductRepository repository=new ProductRepositoryImpl();
    @Override
    public List<Product> getList() {
        return repository.getList();
    }

    @Override
    public void save(Product product) {
        repository.save(product);
    }

    @Override
    public void update(int id, Product product) {
        repository.update(id, product);
    }


    @Override
    public void delete(int id) {
        repository.delete(id);

    }

    @Override
    public Product detail(int id) {
        return repository.detail(id);
    }

    @Override
    public List<Product> find(String name) {

        return repository.find(name);
    }


}
