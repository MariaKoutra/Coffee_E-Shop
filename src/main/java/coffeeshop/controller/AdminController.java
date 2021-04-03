package coffeeshop.controller;

import coffeeshop.entity.Account;
import coffeeshop.entity.Address;
import coffeeshop.entity.CatA;
import coffeeshop.entity.CatB;
import coffeeshop.entity.Category;
import coffeeshop.entity.OrderDetails;
import coffeeshop.entity.Orders;
import coffeeshop.entity.Product;
import coffeeshop.service.AccountService;
import coffeeshop.service.AddressService;
import coffeeshop.service.CatAService;
import coffeeshop.service.CatBService;
import coffeeshop.service.CategoryService;
import coffeeshop.service.OrderDetailsService;
import coffeeshop.service.OrderService;
import coffeeshop.service.ProductService;
import java.util.List;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private ProductService productService;
    @Autowired
    private OrderService orderService;
    @Autowired
    private AccountService accountService;
    @Autowired
    private OrderDetailsService orderDetailsservice;
    @Autowired
    private AddressService addressService;
    @Autowired
    private CatAService catAService;
    @Autowired
    private CatBService catBService;
    @Autowired
    private CategoryService categoryService;

    @GetMapping
    public String adminHome() {
        return "admin/admin-home";
    }

    @GetMapping("/orders")
    public String showOrders(Model model) {
        List<Orders> orders = orderService.getAllOrders();
        model.addAttribute("orders", orders);
        return "admin/admin-orders";
    }

    @GetMapping("/admins")
    public String showAdmins(Model model) {
        List<Account> admins = accountService.getAdmins();
        model.addAttribute("admins", admins);
        return "admin/admin-admins";
    }

    @GetMapping("/users")
    public String showUsers(Model model) {
        List<Account> users = accountService.getUsers();
        model.addAttribute("users", users);
        return "admin/admin-users";
    }

    @GetMapping("/coffees")
    public String showCoffees(Model model) {
        List<Product> coffees = productService.findAllCoffees();
        model.addAttribute("coffees", coffees);
        return "admin/admin-coffees";
    }

    @GetMapping("/drinks")
    public String showDrinks(Model model) {
        List<Product> drinks = productService.findAllDrinks();
        model.addAttribute("drinks", drinks);
        return "admin/admin-drinks";
    }

    @GetMapping("/snacks")
    public String showSnacks(Model model) {
        List<Product> snacks = productService.findAllSnacks();
        model.addAttribute("snacks", snacks);
        return "admin/admin-snacks";
    }

    @GetMapping("/disabled")
    public String showDisabledProducts(Model model) {
        List<Product> disabled = productService.findAllDisabledProducts();
        model.addAttribute("disabled", disabled);
        return "admin/admin-disabledproducts";
    }

    @GetMapping("/orderdetails/{id}")
    public String showOrderDetails(@PathVariable(name = "id") int id, Model model) {
        List<OrderDetails> orderDetails = orderDetailsservice.getOrderDetailsByOrder(id);
        model.addAttribute("orderDetails", orderDetails);
        return ("admin/admin-orderdetails");
    }

    @GetMapping("/address/{addressid}")
    public String showAddress(@PathVariable(name = "addressid") int addressId, Model model) {
        Orders order = orderService.getAddress(addressId);
        model.addAttribute("orders", order);
        return ("admin/admin-address");
    }

    @GetMapping("/user/addresses/{accountid}")
    public String getAddresses(@PathVariable(name = "accountid") int accountid, Model model) {
        List<Address> addresses = addressService.getAddresses(accountid);
        model.addAttribute("address", addresses);
        return ("admin/admin-address");
    }

    @GetMapping("/user/orders/{accountid}")
    public String getOrdersByUser(@PathVariable(name = "accountid") int accountid, Model model) {
        List<Orders> orders = orderService.getOrdersByAccount(accountid);
        model.addAttribute("userOrders", orders);
        return ("admin/admin-orders");
    }

    @GetMapping("/order/user/{accountid}")
    public String getUserFromOrder(@PathVariable(name = "accountid") int accountid, Model model) {
        Account account = accountService.getUserByOrder(accountid);
        model.addAttribute("user", account);
        return ("admin/admin-orderuser");
    }

    @GetMapping("/product/create")
    public String showForm() {
        return ("admin/admin-productform");
    }

    @PostMapping("/product/create")
    public String createProduct(@Valid Product product, BindingResult result, RedirectAttributes attributes) {
        if (result.hasErrors()) {
            attributes.addFlashAttribute("errormsg", "Invalid name");
            return "redirect:/product/create";
        }
        productService.save(product);
        String message = "*Product " + product.getPname() + " added successfully!";
        attributes.addFlashAttribute("message", message);
        return "redirect:/admin/product/create";
    }

    @ModelAttribute("cata")
    public List<CatA> showCatA() {
        return catAService.getAllCatA();
    }

    @ModelAttribute("catb")
    public List<CatB> showCatB() {
        return catBService.getAllCatB();
    }

    @GetMapping("/product/update/{pid}")
    public String showFormUpdate(@PathVariable("pid") int pid, Model model) {
        Product product = productService.findById(pid);
        model.addAttribute("product", product);
        return "admin/admin-productform";
    }

    @PostMapping("/product/update")
    public String update(@Valid Product product, BindingResult result, RedirectAttributes attributes) {
        if (result.hasErrors()) {
            attributes.addFlashAttribute("errormsg", "*Invalid Credentials");
            return "redirect:/admin/product/create";
        }
        productService.save(product);
        String message = "*Product updated successfully!!";
        attributes.addFlashAttribute("message", message);
        return "admin/admin-coffees";
    }

    @GetMapping("/categories")
    public String showCategories(Model model) {
        List<Category> categories = categoryService.findAll();
        model.addAttribute("categories", categories);
        return "admin/admin-categories";
    }

    @GetMapping("/category/create")
    public String showCategoryForm() {
        return ("admin/admin-categoryform");
    }

    @PostMapping("/category/create")
    public String createCategory(@Valid Category category, BindingResult result, RedirectAttributes attributes) {
        if (result.hasErrors()) {
            attributes.addFlashAttribute("errormsg", "Invalid name");
            return "redirect:/product/create";
        }
        categoryService.save(category);
        String message = "*Category " + category.getCname() + " added successfully!";
        attributes.addFlashAttribute("message", message);
        return "redirect:/admin/category/create";
    }

    @GetMapping("/categories/update/{pid}")
    public String showFormCategoryUpdate(@PathVariable("pid") int cid, Model model) {
        Category category = categoryService.findById(cid);
        model.addAttribute("category", category);
        return "redirect:admin/categories";
    }

    @PostMapping("/category/update")
    public String updateCategory(@Valid Category category, BindingResult result, RedirectAttributes attributes) {
        if (result.hasErrors()) {
            attributes.addFlashAttribute("errormsg", "*Invalid Credentials");
            return "redirect:/admin/category/create";
        }
        categoryService.save(category);
        String message = "*Category updated successfully!!";
        attributes.addFlashAttribute("message", message);
        return "redirect:/admin/categories";
    }

    @ExceptionHandler(DataIntegrityViolationException.class)
    public String handleDataIntegrityViolationException(RedirectAttributes attributes) {
        String minima = "Could not commit transaction!!";
        attributes.addFlashAttribute("message", minima);
        return "redirect:/admin";
    }

}
