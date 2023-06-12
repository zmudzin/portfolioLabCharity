package pl.revida.charity.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.revida.charity.entity.Category;
import pl.revida.charity.entity.Donation;
import pl.revida.charity.entity.Institution;
import pl.revida.charity.service.CategoryService;
import pl.revida.charity.service.DonationService;
import pl.revida.charity.service.InstitutionService;

import javax.validation.Valid;
import java.util.Collection;

@Controller
public class FormController {

    private DonationService donationService;
    private CategoryService categoryService;
    private InstitutionService institutionService;

    public FormController(CategoryService categoryService, InstitutionService institutionService, DonationService donationService) {
        this.categoryService = categoryService;
        this.institutionService = institutionService;
        this.donationService = donationService;
    }

    @ModelAttribute("institutions")
    public Collection<Institution> institutions() {
        return institutionService.findAll();
    }

    @ModelAttribute("categories")
    public Collection<Category> categories() {
        return categoryService.findAll();
    }

    @GetMapping("/form")
    public String showDonation(Model model) {
        model.addAttribute("donation", new Donation());
        return "form";
    }

    @PostMapping("/form")
    public String addDonation(@Valid Donation donation, BindingResult result) {
        if (result.hasErrors()) {
            return "/form";
        }
        donationService.createDonation(donation);
        return "redirect:/form_confirmation";
    }

    @RequestMapping("/form_confirmation")
    public String confirmDonation() {
        return "form-confirmation";
    }

}