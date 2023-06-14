package pl.revida.charity.controller;

import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import pl.revida.charity.entity.User;
import pl.revida.charity.service.EmailService;
import pl.revida.charity.service.UserService;

@Controller
public class PasswordResetController {

    private final EmailService emailService;
    private final UserService userService;


    public PasswordResetController(EmailService emailService, UserService userService) {
        this.emailService = emailService;
        this.userService = userService;

    }

    @GetMapping("/passwordReset")
    public String passwordResetForm() {
        return "mainSiteView/passwordReset";
    }
    @PostMapping("/passwordReset")
    public String passwordReset(@RequestParam("email") String email, Model model) {

    User user = userService.findByEmail(email);
        if (user != null) {
            String randomPassword = RandomStringUtils.randomAlphanumeric(10);
            userService.updateUserPassword(user.getId(), randomPassword);

            String recipient = email;
            String subject = "Resetowanie hasła";
            String body = "Twoje nowe hasło to: " + randomPassword;

            emailService.sendSimpleMessage(recipient, subject, body);

            model.addAttribute("message", "Wiadomość z nowym hasłem została wysłana na adres " + email);
        }

        return "/index";
    }
    }

