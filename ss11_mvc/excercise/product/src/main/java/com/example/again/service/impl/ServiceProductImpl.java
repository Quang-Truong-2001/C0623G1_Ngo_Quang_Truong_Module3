package com.example.again.service.impl;

import com.example.again.model.Product;
import com.example.again.repository.IRepositoryProduct;
import com.example.again.repository.impl.RepositoryProductImpl;
import com.example.again.service.IServiceProduct;

import java.util.List;

public class ServiceProductImpl implements IServiceProduct {
    private static final IRepositoryProduct repository=new RepositoryProductImpl();
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
