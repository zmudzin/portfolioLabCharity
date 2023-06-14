package pl.revida.charity.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
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
public class UserPanelDonationController {
    private final UserService userService;
    private final DonationService donationService;
    private CategoryService categoryService;
    private InstitutionService institutionService;

    public UserPanelDonationController(UserService userService, DonationService donationService, CategoryService categoryService, InstitutionService institutionService) {
        this.userService = userService;
        this.donationService = donationService;
        this.categoryService = categoryService;
        this.institutionService = institutionService;
    }


    @ModelAttribute("donations")
    public Collection<Donation> donations(Principal principal) {
       User user = userService.findByEmail(principal.getName());
        return this.donationService.getDonationsByUserId(user.getId());
    }
    @ModelAttribute("institutions")
    public Collection<Institution> institutions() {
        return institutionService.findAll();
    }

    @ModelAttribute("categories")
    public Collection<Category> categories() {
        return categoryService.findAll();
    }

@RequestMapping("/userPanel/donations")
public String userPanel(){
        return "userPanel/userPanelDonationIndex";
}
    @RequestMapping("/userPanel/donations/{id}")
    public String getDonation(Model model, @PathVariable long id) {
        Donation donation = donationService.findById(id);
        model.addAttribute(donation);
        return "userPanel/donationViewForm";
    }
    @GetMapping("/userPanel/donations/edit/{id}")
    public String updateDonationForm(Model model, @PathVariable long id,Principal principal) {
        Donation donation = donationService.findById(id);
        model.addAttribute(donation);
        User user = userService.findByEmail(principal.getName());
        model.addAttribute("userId", user.getId());
        return "/userPanel/donationEditForm";
    }

    @PostMapping("/userPanel/donations/edit/{id}")
    public String updateDonation(@Valid Donation donation, BindingResult result) {
        if (result.hasErrors()) {
            return "/userPanel/donationEditForm";
        }
        donationService.updateDonation(donation);
        return "redirect:/userPanel/donations";
    }
    @GetMapping("/userPanel/donations/delete/{id}")
    public String deleteDonationForm(Model model, @PathVariable long id) {
        Donation donation = donationService.findById(id);
        model.addAttribute("donation", donation);
        return "userPanel/donationDeleteForm";
    }

    @PostMapping("/userPanel/donations/delete/{id}")
    public String deleteDonation(@PathVariable long id) {
        Donation donation1 = donationService.findById(id);
        donationService.deleteDonation(donation1);
        return "redirect:/userPanel/donations";
    }
}
