package pl.revida.charity.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.revida.charity.entity.User;
import pl.revida.charity.service.EmailService;
import pl.revida.charity.service.UserService;

import javax.validation.Valid;

@Controller
public class RegisterController {

    private final UserService userService;
    private final EmailService emailService;

    public RegisterController(UserService userService, EmailService emailService) {
        this.userService = userService;
        this.emailService = emailService;
    }

    @GetMapping("/register")
    public String showRegisterForm(Model model) {
        model.addAttribute("user", new User());
        return "mainSiteView/register";
    }

    @PostMapping("/register")
    public String addUser(@Valid User user, BindingResult result) {
        if (result.hasErrors()) {
            return "mainSiteView/register";
        }
        if (userService.isEmailExists(user.getEmail())) {
            result.rejectValue("email", "error.email.exists", "Adres e-mail już istnieje");
            return "mainSiteView/register";
        }
        user.setEnabled(true);
userService.addUserRole(user,"ROLE_USER");
        userService.createUser(user);
        emailService.sendSimpleMessage(user.getEmail(),"Witaj na stronie", "Możesz się zalogować");
        return "redirect:/register_confirmation";
    }

    @RequestMapping("/register_confirmation")
    public String confirmRegister() {
        return "mainSiteView/register-confirmation";
    }

}
