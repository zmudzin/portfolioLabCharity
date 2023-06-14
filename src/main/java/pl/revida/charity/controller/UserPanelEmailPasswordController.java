package pl.revida.charity.controller;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import pl.revida.charity.entity.User;
import pl.revida.charity.service.UserService;

import javax.servlet.http.HttpServletRequest;

@Controller
public class UserPanelEmailPasswordController {
    public UserPanelEmailPasswordController(UserService userService) {
        this.userService = userService;
    }

    private final UserService userService;

    @RequestMapping("/userPanel")
    public String userPanel(){
        return "userPanel/userPanelIndex";
    }
    @RequestMapping("/userPanel/{email}")
    public String getUserView(Model model, @PathVariable String email) {
        User user = userService.findByEmail(email);
        model.addAttribute("user", user);
        return "userPanel/userViewForm";
    }
    @PostMapping("/userPanel/updateEmail/{id}")
    public String updateUserEmail(@PathVariable Long id, @RequestParam("newEmail") String newEmail, HttpServletRequest request) {

        userService.updateUserEmail(id, newEmail);
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        authentication.setAuthenticated(false);
        SecurityContextHolder.clearContext();
        request.getSession().invalidate();

        return "redirect:/login?logout"; // Przekierowanie do strony logowania z informacją o wylogowaniu

    }
    @PostMapping("/userPanel/updatePassword/{id}")
    public String updateUserPassword(@PathVariable Long id, @RequestParam("newPassword") String newPassword) {
        userService.updateUserPassword(id, newPassword);
        return "redirect:/userPanel";
    }

}
