package com.example.product_manager.repository.impl;

import com.example.product_manager.model.Product;
import com.example.product_manager.repository.IProductRepository;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProductRepositoryImpl implements IProductRepository {
//    private static List<Product> products;
    private static Map<Integer,Product> products;
    static {
        products=new HashMap<>();
        products.put(1,new Product(1,"gao",100000,"ngon","Quảng Trị"));
        products.put(2,new Product(2,"hoa",100000,"ngon","Quảng Trị"));
        products.put(3,new Product(3,"qua",100000,"ngon","Quảng Trị"));
        products.put(4,new Product(4,"keo",100000,"ngon","Quảng Trị"));
    }
    @Override
    public List<Product> getList() {
        List<Product> list=new ArrayList<>(products.values());
        return list;
    }

    @Override
    public void save(Product product) {
        product.setId(products.size()+1);
        products.put(products.size()+1,product);
    }

    @Override
    public void update(int id, Product product) {
        products.put(id,product);
    }


    @Override
    public void delete(int id) {
        products.remove(id);
    }

    @Override
    public Product detail(int id) {
        return products.get(id);
    }

    @Override
    public List<Product> find(String name) {
        List<Product> list=new ArrayList<>();
        for(Map.Entry<Integer,Product> entry: products.entrySet()){
            if(entry.getValue().getName().equals(name)){
                list.add(entry.getValue());
            }
        }
        return list;
    }
}
