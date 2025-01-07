package com.spring.henallux.firstSpringProject.Controller;

import com.spring.henallux.firstSpringProject.dataAccess.dao.ProductDAO;
import com.spring.henallux.firstSpringProject.model.Product;
import com.spring.henallux.firstSpringProject.model.CartItem;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/cart")
public class CartController {

    private final ProductDAO productDAO;

    public CartController(ProductDAO productDAO) {
        this.productDAO = productDAO;
    }

    @GetMapping
    public String viewCart(HttpSession session, Model model) {
        // Récupérer le panier depuis la session.
        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
        if (cart == null) {
            cart = new ArrayList<>();
        }

        // Calculer le total général
        double total = cart.stream().mapToDouble(item -> item.getProduct().getPrice() * item.getQuantity()).sum();
        model.addAttribute("cart", cart);
        model.addAttribute("total", total);

        return "integrated:cart"; // Retourne la vue du panier
    }

    @PostMapping("/add")
    public String addToCart(@RequestParam("productId") Integer productId,
                            @RequestParam(value = "categoryId", required = false) Integer categoryId,
                            HttpSession session) {
        // Récupérer le produit via le DAO
        Product product = productDAO.getProductById(productId);

        // Récupérer ou initialiser le panier
        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
        if (cart == null) {
            cart = new ArrayList<>();
        }

        // Vérifier si le produit est déjà dans le panier
        CartItem existingItem = cart.stream()
                .filter(item -> item.getProduct().getId().equals(productId))
                .findFirst()
                .orElse(null);

        if (existingItem != null) {
            // Augmenter la quantité
            existingItem.setQuantity(existingItem.getQuantity() + 1);
        } else {
            // Ajouter un nouvel article
            cart.add(new CartItem(product, 1));
        }

        // Mettre à jour la session
        session.setAttribute("cart", cart);

        // Rediriger vers la page catalogue avec la catégorie sélectionnée (si applicable)
        if (categoryId != null) {
            return "redirect:/catalogue?categoryId=" + categoryId;
        }
        return "redirect:/catalogue";
    }




    @PostMapping("/update")
    public String updateCart(@RequestParam("productId") Integer productId,
                             @RequestParam("quantity") Integer quantity,
                             HttpSession session) {
        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
        if (cart != null) {
            cart.stream()
                    .filter(item -> item.getProduct().getId().equals(productId))
                    .findFirst()
                    .ifPresent(item -> item.setQuantity(quantity));
        }
        session.setAttribute("cart", cart);
        return "redirect:/cart";
    }

    @PostMapping("/remove")
    public String removeFromCart(@RequestParam("productId") Integer productId, HttpSession session) {
        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
        if (cart != null) {
            cart.removeIf(item -> item.getProduct().getId().equals(productId));
        }
        session.setAttribute("cart", cart);
        return "redirect:/cart";
    }

    @PostMapping("/clear")
    public String clearCart(HttpSession session) {
        session.removeAttribute("cart");
        return "redirect:/cart";
    }
}
