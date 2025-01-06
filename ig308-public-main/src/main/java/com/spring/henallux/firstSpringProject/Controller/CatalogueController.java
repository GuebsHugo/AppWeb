package com.spring.henallux.firstSpringProject.Controller;

import com.spring.henallux.firstSpringProject.dataAccess.dao.CategoryDAO;
import com.spring.henallux.firstSpringProject.dataAccess.dao.ProductDAO;
import com.spring.henallux.firstSpringProject.model.Category;
import com.spring.henallux.firstSpringProject.model.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class CatalogueController {

    private final CategoryDAO categoryDAO;
    private final ProductDAO productDAO;

    @Autowired
    public CatalogueController(CategoryDAO categoryDAO, ProductDAO productDAO) {
        this.categoryDAO = categoryDAO;
        this.productDAO = productDAO;
    }

    @GetMapping("/catalogue")
    public String showCatalogue(@RequestParam(value = "categoryId", required = false) Integer categoryId, Model model) {
        // Récupérer toutes les catégories
        List<Category> categories = categoryDAO.getAllCategories();
        model.addAttribute("categories", categories);

        // Filtrage manuel si une catégorie est sélectionnée
        if (categoryId != null) {
            List<Product> allProducts = productDAO.getAllProducts();
            List<Product> products = allProducts.stream().filter(product -> product.getCategory().getId().equals(categoryId)).toList();
            model.addAttribute("products", products);
        }

        return "integrated:catalogue"; // Retourne la vue catalogue
    }
}
