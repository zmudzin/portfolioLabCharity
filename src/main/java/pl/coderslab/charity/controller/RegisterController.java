package pl.coderslab.charity.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.coderslab.charity.entity.User;
import pl.coderslab.charity.service.UserService;

import javax.validation.Valid;

@Controller

public class RegisterController {

    private final UserService userService;

    public RegisterController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("/register")
    public String showRegisterForm(Model model) {
        model.addAttribute("user", new User());
        return "register";
    }

    @PostMapping("/register")
    public String addUser(@Valid User user, BindingResult result) {
        if (result.hasErrors()) {
            return "/register";
        }
        if (userService.isEmailExists(user.getEmail())) {
            result.rejectValue("email", "error.email.exists", "Adres e-mail już istnieje");
            return "/register";
        }
        userService.createUser(user);
        return "redirect:/register_confirmation";
    }

    @RequestMapping("/register_confirmation")
    public String confirmRegister() {
        return "register-confirmation";
    }

}
