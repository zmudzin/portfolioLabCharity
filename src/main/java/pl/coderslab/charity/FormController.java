package pl.coderslab.charity;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import pl.coderslab.charity.entity.Donation;

@Controller
public class FormController {
    @GetMapping("/form")
    public String formAction(Model model){
model.addAttribute("donation", new Donation());
        return "form";
    }
    @PostMapping("/form")
    public String formAction(Donation donation){return "redirect:/";}

}
