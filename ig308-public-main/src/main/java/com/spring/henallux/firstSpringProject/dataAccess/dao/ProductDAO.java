package com.spring.henallux.firstSpringProject.dataAccess.dao;

import com.spring.henallux.firstSpringProject.dataAccess.entity.CategoryEntity;
import com.spring.henallux.firstSpringProject.dataAccess.entity.ProductEntity;
import com.spring.henallux.firstSpringProject.dataAccess.repository.ProductRepository;
import com.spring.henallux.firstSpringProject.dataAccess.util.ProviderConverter;
import com.spring.henallux.firstSpringProject.model.Category;
import com.spring.henallux.firstSpringProject.model.Product;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
@Transactional
public class ProductDAO implements ProductDataAccess{

    private ProductRepository productRepository;
    private ProviderConverter providerConverter;

    public ProductDAO(ProductRepository productRepository, ProviderConverter providerConverter) {
        this.productRepository = productRepository;
        this.providerConverter = providerConverter;
    }

    @Override
    public ArrayList<Product> getAllProducts() {
        List<ProductEntity> productEntities = productRepository.findAll();

        ArrayList<Product> products = new ArrayList<>();

        for (ProductEntity product : productEntities) {
            products.add(providerConverter.productEntityToProductModel(product));
        }

        return products;
    }


    public Product getProductById(Integer productId) {
        ProductEntity productEntity = productRepository.findById(productId)
                .orElseThrow(() -> new RuntimeException("Produit non trouvé"));
        return providerConverter.productEntityToProductModel(productEntity);
    }

}
