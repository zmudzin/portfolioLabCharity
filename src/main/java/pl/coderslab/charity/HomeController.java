package pl.coderslab.charity;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.coderslab.charity.entity.Institution;
import pl.coderslab.charity.service.DonationService;
import pl.coderslab.charity.service.InstitutionService;

import java.util.List;


@Controller
public class HomeController {
private final InstitutionService institutionService;
private final DonationService donationService;

    public HomeController(InstitutionService institutionService, DonationService donationService) {
        this.institutionService = institutionService;
        this.donationService = donationService;
    }

    @RequestMapping("/")
    public String homeAction(Model model){
        Long totalQuantity= donationService.totalDonationQuantity();
        List<Institution> institutions = institutionService.getInstitutionsForIndexPage();
        Long donationSize = donationService.donationSize();
        model.addAttribute("institutions",institutions);
        model.addAttribute("totalQuantity",totalQuantity);
        model.addAttribute("donationSize",donationSize);
        return "index";
    }
}
