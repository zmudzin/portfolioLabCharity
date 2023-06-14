package pl.revida.charity.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import pl.revida.charity.service.EmailService;

@Controller
public class ContactController {

    private final EmailService emailService;

    public ContactController(EmailService emailService) {
        this.emailService = emailService;
    }

    @PostMapping("/sendEmail")
//    @ResponseBody
    public String sendEmail(@RequestParam("name") String name,
                            @RequestParam("surname") String surname,
                            @RequestParam("message") String message) {

        String recipient = "biuro@revida.pl";
        String subject = "Wiadomość z formularza kontaktowego";
        String body = "Imię: " + name + "\nNazwisko: " + surname + "\nWiadomość: " + message;

        emailService.sendSimpleMessage(recipient, subject, body);

        return "/index";
    }
}