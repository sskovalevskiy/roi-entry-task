package com.roi.restapi.controller;

import com.roi.restapi.entity.Product;
import com.roi.restapi.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("products")
public class ProductsController {

    @Autowired
    private ProductService productService;


    @GetMapping(params = "title")
    public List<Product> getAllProductsByTitle(@RequestParam("title") String partTitle){
        return productService.getAllProductsByTitle(partTitle);
    }

    @GetMapping(params = "category")
    public List<Product> getAllProductsByCategory(@RequestParam("category") String category){
        return productService.getAllProductsByCategory(category);
    }

    @GetMapping
    public List<Product> getAllProducts(){
        return productService.getAllProducts();
    }

    @GetMapping("{id}")
    public Product getProductById(@PathVariable String id){
        return productService.getProductById(Long.parseLong(id));
    }

//    fetch('/products', {method:'POST', headers:{'Content-Type':'application/json'}, body: JSON.stringify({title: 'Yandex', description:'Lorem ipsum dolor si amet...'})}).then(result => console.log(result))
    @PostMapping
    public boolean addProduct(@RequestBody Product product){
        return productService.addProduct(product);
    }

//    fetch('/products/3', {method:'PUT', headers:{'Content-Type':'application/json'}, body: JSON.stringify({title: 'Yahoo', description:'Lorem ipsum dolor si amet...'})}).then(result => console.log(result))
    @PutMapping("{id}")
    public void updateProduct(@PathVariable String id, @RequestBody Product product) {
        product.setProductId(Long.parseLong(id));
        productService.updateProduct(product);
    }

//    fetch('/products/2', {method:'DELETE'}).then(result => console.log(result))
    @DeleteMapping("{id}")
    public void deleteProductById(@PathVariable String id){
        productService.deleteProductById(Long.parseLong(id));
    }

}
