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
import pl.revida.charity.entity.User;
import pl.revida.charity.service.CategoryService;
import pl.revida.charity.service.DonationService;
import pl.revida.charity.service.InstitutionService;
import pl.revida.charity.service.UserService;

import javax.validation.Valid;
import java.security.Principal;
import java.util.Collection;

@Controller
public class FormController {

    private final DonationService donationService;
    private final CategoryService categoryService;
    private final InstitutionService institutionService;
    private final UserService userService;

    public FormController(CategoryService categoryService, InstitutionService institutionService, DonationService donationService, UserService userService) {
        this.categoryService = categoryService;
        this.institutionService = institutionService;
        this.donationService = donationService;
        this.userService = userService;
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
    public String showDonation(Model model, Principal principal) {
        User user = userService.findByEmail(principal.getName());

        model.addAttribute("donation", new Donation());
        model.addAttribute("userId", user.getId());
        return "mainSiteView/form";
    }

    @PostMapping("/form")
    public String addDonation(@Valid Donation donation, BindingResult result) {
        if (result.hasErrors()) {
            return "mainSiteView/form";
        }
        donationService.createDonation(donation);
        return "redirect:/form_confirmation";
    }

    @RequestMapping("/form_confirmation")
    public String confirmDonation() {
        return "mainSiteView/form-confirmation";
    }

}