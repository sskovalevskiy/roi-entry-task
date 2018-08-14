package com.roi.restapi.service;

import com.roi.restapi.entity.Product;

import java.util.List;

public interface ProductService {

    List<Product> getAllProducts();
    Product getProductById(long id);
    boolean addProduct(Product product);
    void updateProduct(Product product);
    void deleteProductById(long id);
    List<Product> getAllProductsByTitle(String partTitle);
    List<Product> getAllProductsByCategory(String category);
}
