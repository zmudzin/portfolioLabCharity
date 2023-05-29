package pl.coderslab.charity;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FormConfirmController {
    @RequestMapping("/form-confirmation")
    public String formAction(Model model){
        return "form-confirmation";
    }
}
