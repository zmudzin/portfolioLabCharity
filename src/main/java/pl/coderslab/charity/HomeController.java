package pl.coderslab.charity;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.coderslab.charity.entity.Donation;
import pl.coderslab.charity.entity.Institution;
import pl.coderslab.charity.repository.DonationRepository;
import pl.coderslab.charity.repository.InstitutionRepository;

import java.util.Collection;


@Controller
public class HomeController {
private final InstitutionRepository institutionRepository;
private final DonationRepository donationRepository;

    public HomeController(InstitutionRepository institutionRepository, DonationRepository donationRepository) {
        this.institutionRepository = institutionRepository;
        this.donationRepository = donationRepository;
    }
    @ModelAttribute("institutions")
    public Collection<Institution> institutions() {
        return this.institutionRepository.findAll();
    }
    @ModelAttribute("donations")
    public Collection<Donation> donations(){return this.donationRepository.findAll();}

    @RequestMapping("/")
    public String homeAction(Model model){
        int totalQuantity= donations().stream().mapToInt(donation -> donation.getQuantity()).sum();
       model.addAttribute("totalQuantity",totalQuantity);
        return "index";
    }
}
