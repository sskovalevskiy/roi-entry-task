package com.roi.restapi.service;

import com.roi.restapi.entity.Product;
import com.roi.restapi.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import java.util.ArrayList;
import java.util.List;

import static com.roi.restapi.service.ProductSpecification.productCategoryContains;
import static com.roi.restapi.service.ProductSpecification.productTitleContains;

@Service
public class ProductServiceImpl implements ProductService {

    @Autowired
    private ProductRepository productRepository;

    @Override
    public List<Product> getAllProducts() {
        List<Product> products = new ArrayList<>();
        productRepository.findAll().forEach(product -> products.add(product));
        return products;
    }

    @Override
    public List<Product> getAllProductsByTitle(String partTitle) {
//        return productRepository.findAll(productTitleContains(partTitle));
        List<Product> productsFilteredByTitle = new ArrayList<>();
        productRepository.findAll().forEach(product -> {
            if (product.getTitle().contains(partTitle)){
                productsFilteredByTitle.add(product);
            }
        });
        return productsFilteredByTitle;
    }

    @Override
    public List<Product> getAllProductsByCategory(String category) {
//        return productRepository.findAll(productCategoryContains(category));
        List<Product> productsFilteredByCategory = new ArrayList<>();
        productRepository.findAll().forEach(product -> {
            if (product.getCategories().contains(category)){
                productsFilteredByCategory.add(product);
            }
        });
        return productsFilteredByCategory;
    }

    @Override
    public Product getProductById(long id) {
        return productRepository.findById(id).get();
    }

    @Override
    public synchronized boolean addProduct(Product product) {
        List<Product> products = productRepository.findProductByTitle(product.getTitle());

        if (products.isEmpty()){
            productRepository.save(product);
            return true;
        }

        return false;
    }

    @Override
    public void updateProduct(Product product) {
        productRepository.save(product);
    }

    @Override
    public void deleteProductById(long id) {
        productRepository.delete(getProductById(id));
    }
}
