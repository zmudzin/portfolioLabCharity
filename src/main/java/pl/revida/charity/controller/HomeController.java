package pl.revida.charity.controller;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import pl.revida.charity.entity.Institution;
import pl.revida.charity.service.DonationService;
import pl.revida.charity.service.InstitutionService;

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
    public String homeAction(Model model) {

        Long totalQuantity = donationService.totalDonationQuantity();
        List<Institution> institutions = institutionService.getInstitutionsForIndexPage();
        Long donationSize = donationService.donationSize();
        model.addAttribute("institutions", institutions);
        model.addAttribute("totalQuantity", totalQuantity);
        model.addAttribute("donationSize", donationSize);
        return "index";
    }
    @GetMapping("/admin")
    @ResponseBody
    public String userInfo(@AuthenticationPrincipal UserDetails customUser) {
        return "You are logged as " + customUser;
    }

}
