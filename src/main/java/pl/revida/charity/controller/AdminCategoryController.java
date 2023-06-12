package pl.revida.charity.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.*;
import pl.revida.charity.entity.Category;
import pl.revida.charity.entity.Donation;
import pl.revida.charity.service.CategoryService;
import pl.revida.charity.service.DonationService;

import javax.validation.Valid;
import java.util.Collection;

@Controller
public class AdminCategoryController {

    private final CategoryService categoryService;
    private final DonationService donationService;

    public AdminCategoryController(CategoryService categoryService, DonationService donationService) {
        this.categoryService = categoryService;
        this.donationService = donationService;
    }

    @ModelAttribute("categories")
    public Collection<Category> categories() {
        return this.categoryService.findAll();
    }

    @ModelAttribute("donations")
    public Collection<Donation> donations() {
        return this.donationService.findAll();
    }

    @RequestMapping("/admin/category")
    public String getAllCategories() {
        return "categoryView/categoryIndexAdmin";
    }

    @RequestMapping("/admin/category/{id}")
    public String getCategory(Model model, @PathVariable long id) {
        Category category = categoryService.findById(id);
        model.addAttribute(category);
        return "categoryView/categoryViewForm";
    }

    @GetMapping("/admin/category/add")
    public String addCategoryForm(Model model) {
        model.addAttribute(new Category());
        return "categoryView/categoryAddForm";
    }

    @PostMapping("/admin/category/add")
    public String addCategory(@Valid Category category, BindingResult result) {
        if (result.hasErrors()) {
            for (ObjectError error : result.getAllErrors()) {
                return "categoryView/categoryAddForm";
            }
        }
        categoryService.createCategory(category);
        return "redirect:/admin/category";
    }

    @GetMapping("/admin/category/delete/{id}")
    public String deleteCategoryForm(Model model, @PathVariable long id) {
        Category category = categoryService.findById(id);
        model.addAttribute(category);
        return "categoryView/categoryDeleteForm";
    }

    @PostMapping("/admin/category/delete/{id}")
    public String deleteCategory(Category category) {

        categoryService.deleteCategory(category);
        return "redirect:/admin/category";
    }
}