package coffeeshop.controller;

import coffeeshop.entity.Category;
import coffeeshop.entity.MyUserDetails;
import coffeeshop.entity.Product;
import coffeeshop.service.CategoryService;
import coffeeshop.service.ProductService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user/menu")
public class UserMenuController {

    @Autowired
    private ProductService productService;
    @Autowired
    private CategoryService categoryService;

    @ModelAttribute("coffeeTypes")
    public List<Product> getCoffeeTypes() {
        return productService.findAllCoffees();
    }

    @ModelAttribute("snackTypes")
    public List<Product> getSnackTypes() {
        return productService.findAllSnacks();
    }

    @ModelAttribute("drinkTypes")
    public List<Product> getDrinkTypes() {
        return productService.findAllDrinks();
    }

    @ModelAttribute("ingredients")
    public List<Category> getIngredients() {
        return categoryService.findAllIngredients();
    }


    @ModelAttribute("coffeeSugar")
    public List<Category> getCoffeeSugar() {
        return categoryService.findAllSugars();
    }

    @GetMapping()
    public String showUserMenu(@ModelAttribute("cart") Product product) {
        return "user/user-menu";
    }
    
  @ModelAttribute("user")
    public MyUserDetails fakes (@AuthenticationPrincipal MyUserDetails user){
        return user;
    }

}
