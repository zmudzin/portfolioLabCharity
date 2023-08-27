package pl.revida.charity.controller;

import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.*;
import pl.revida.charity.entity.*;
import pl.revida.charity.service.*;
import javax.validation.Valid;
import java.util.Collection;
import org.springframework.data.domain.Pageable;

@Controller
public class AdminDonationController {
    private final DonationService donationService;
    private CategoryService categoryService;
    private InstitutionService institutionService;

    public AdminDonationController(DonationService donationService, CategoryService categoryService, InstitutionService institutionService) {
        ;
        this.donationService = donationService;
        this.categoryService = categoryService;
        this.institutionService = institutionService;
    }

    @ModelAttribute("donations")
    public Collection<Donation> donations() {
        return this.donationService.findAll();
    }

    @ModelAttribute("institutions")
    public Collection<Institution> institutions() {
        return institutionService.findAll();
    }

    @ModelAttribute("categories")
    public Collection<Category> categories() {
        return categoryService.findAll();
    }

@RequestMapping("/admin/donations")
public String findAllDonations(@RequestParam(name = "sort", defaultValue = "name") String sort,
                               @RequestParam(name = "direction", defaultValue = "asc") String direction,
                               @RequestParam(name = "collected", required = false) Boolean collected,
                               @RequestParam(name = "userEmail", required = false) String userEmail,
                               Model model) {

    Collection<Donation> donations;
    if (collected != null) {
        donations = donationService.findAllByCollected(collected);

    } else if (userEmail != null && !userEmail.isEmpty()) {
            donations = donationService.findByUserEmailContaining(userEmail);

        } else {
            switch (sort) {
                case "name" -> {
                    if (direction.equals("asc")) {
                        donations = donationService.findAllSortedByNameAsc();
                    } else {
                        donations = donationService.findAllSortedByNameDesc();
                    }
                }
                case "quantity" -> {
                    if (direction.equals("asc")) {
                        donations = donationService.findAllSortedByQuantityAsc();
                    } else {
                        donations = donationService.findAllSortedByQuantityDesc();
                    }
                }
                case "pickUpDate" -> {
                    if (direction.equals("asc")) {
                        donations = donationService.findAllSortedByPickupDateAsc();
                    } else {
                        donations = donationService.findAllSortedByPickupDesc();
                    }
                }
                case "user" -> {
                    if (direction.equals("asc")) {
                        donations = donationService.findAllSortedByUserAsc();
                    } else {
                        donations = donationService.findAllSortedByUserDesc();
                    }
                }
                default -> donations = donationService.findAll();
            }
        }

           model.addAttribute("donations", donations);

        return "donationView/donationsIndex";
    }



    @RequestMapping("/admin/donations/{id}")
    public String getDonation(Model model, @PathVariable long id) {
        Donation donation = donationService.findById(id);
        model.addAttribute(donation);
        return "donationView/donationViewForm";
    }

    @GetMapping("/admin/donations/add")
    public String addDonationForm(Model model) {
        model.addAttribute(new Donation());
        return "donationView/donationAddForm";
    }

    @PostMapping("/admin/donations/add")
    public String addDonation(@Valid Donation donation, BindingResult result) {
        if (result.hasErrors()) {
            for (ObjectError error : result.getAllErrors()) {
                return "donationView/donationAddForm";
            }
        }
        donationService.createDonation(donation);
        return "redirect:/admin/donations";
    }

    @GetMapping("/admin/donations/delete/{id}")
    public String deleteDonationForm(Model model, @PathVariable long id) {
        Donation donation = donationService.findById(id);
        model.addAttribute("donation", donation);
        return "donationView/donationDeleteForm";
    }

    @PostMapping("/admin/donations/delete/{id}")
    public String deleteDonation(@PathVariable long id) {
        Donation donation1 = donationService.findById(id);
        try {
            donationService.deleteDonation(donation1);
            return "redirect:/admin/donations";
        }catch (DataIntegrityViolationException ex) {
            return "redirect:/admin/donations?deleteError=AssociatedItems";
        }
    }

    @GetMapping("/admin/donations/edit/{id}")
    public String updateDonationForm(Model model, @PathVariable long id) {
        Donation donation = donationService.findById(id);
        model.addAttribute(donation);
        return "/donationView/donationEditForm";
    }

    @PostMapping("/admin/donations/edit/{id}")
    public String updateDonation(@Valid Donation donation, BindingResult result) {
        if (result.hasErrors()) {
            return "/donationView/donationEditForm";
        }
        donationService.updateDonation(donation);
        return "redirect:/admin/donations";
    }
}