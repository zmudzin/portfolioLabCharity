package pl.coderslab.charity;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import pl.coderslab.charity.entity.Category;
import pl.coderslab.charity.entity.Donation;
import pl.coderslab.charity.entity.Institution;
import pl.coderslab.charity.service.CategoryService;
import pl.coderslab.charity.service.DonationService;
import pl.coderslab.charity.service.InstitutionService;

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
    public Collection<Institution> institutions(){return institutionService.getAllInstitutions();}

    @ModelAttribute("categories")
    public Collection<Category> categories(){return categoryService.getAllCategories();}
    @GetMapping("/form")
    public String addDonation(Model model){
        model.addAttribute("donation", new Donation());
        return "form";
    }
    @PostMapping("/form")
    public String addDonation(Donation donation){
        donationService.createDonation(donation);
        return "form-confirmation";}

}
