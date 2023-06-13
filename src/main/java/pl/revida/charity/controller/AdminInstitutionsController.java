package pl.revida.charity.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.*;
import pl.revida.charity.entity.Donation;
import pl.revida.charity.entity.Institution;
import pl.revida.charity.service.DonationService;
import pl.revida.charity.service.InstitutionService;

import javax.validation.Valid;
import java.util.Collection;

@Controller
public class AdminInstitutionsController {

    private final InstitutionService institutionService;
    private final DonationService donationService;

    public AdminInstitutionsController(InstitutionService institutionService, DonationService donationService) {
        this.donationService = donationService;
        this.institutionService = institutionService;
    }

    @ModelAttribute("institutions")
    public Collection<Institution> institutions() {
        return this.institutionService.findAll();
    }

    @ModelAttribute("donations")
    public Collection<Donation> donations() {
        return this.donationService.findAll();
    }

    @RequestMapping("/admin/institutions")
    public String getAllInstitutions() {
        return "institutionView/institutionIndexAdmin";
    }

    @RequestMapping("/admin/institutions/{id}")
    public String getInstitution(Model model, @PathVariable long id) {
        Institution institution = institutionService.findById(id);
        model.addAttribute(institution);
        return "institutionView/institutionViewForm";
    }

    @GetMapping("/admin/institutions/add")
    public String addInstitutionForm(Model model) {
        model.addAttribute(new Institution());
        return "institutionView/institutionAddForm";
    }

    @PostMapping("/admin/institutions/add")
    public String addInstitution(@Valid Institution institution, BindingResult result) {
        if (result.hasErrors()) {
            for (ObjectError error : result.getAllErrors()) {
                return "institutionView/institutionAddForm";
            }
        }
        institutionService.createInstitution(institution);
        return "redirect:/admin/institutions";
    }

    @GetMapping("/admin/institutions/delete/{id}")
    public String deleteInstitutionForm(Model model, @PathVariable long id) {
        Institution institution = institutionService.findById(id);
        model.addAttribute(institution);
        return "institutionView/institutionDeleteForm";
    }

    @PostMapping("/admin/institutions/delete/{id}")
    public String deleteInstitution(Institution institution) {

        institutionService.deleteInstitution(institution);
        return "redirect:/admin/institutions";
    }

    @GetMapping("/admin/institutions/edit/{id}")
    public String updateInstitutionForm(Model model, @PathVariable long id) {
        Institution institution = institutionService.findById(id);
        model.addAttribute(institution);
        return "/institutionView/institutionEditForm";
    }

    @PostMapping("/admin/institutions/edit/{id}")
    public String updateInstitution(@Valid Institution institution, BindingResult result) {
        if (result.hasErrors()) {
            return "/institutionView/institutionEditForm";
        }
        institutionService.updateInstitution(institution);
        return "redirect:/admin/institutions";
    }
}