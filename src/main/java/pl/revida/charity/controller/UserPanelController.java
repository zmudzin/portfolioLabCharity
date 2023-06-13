package pl.revida.charity.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import pl.revida.charity.entity.User;
import pl.revida.charity.service.RoleService;
import pl.revida.charity.service.UserService;

@Controller
public class UserPanelController {
    private final UserService userService;
    private final RoleService roleService;

    public UserPanelController(UserService userService, RoleService roleService) {
        this.userService = userService;
        this.roleService = roleService;
    }


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
    public String updateUserEmail(@PathVariable Long id, @RequestParam("newEmail") String newEmail) {
        try {
            userService.updateUserEmail(id, newEmail);
            return "redirect:/userPanel";
        } catch (IllegalArgumentException e) {

            return "redirect:/userPanel/edit/{id}?error=" + e.getMessage();
        }
    }
    @PostMapping("/userPanel/updatePassword/{id}")
    public String updateUserPassword(@PathVariable Long id, @RequestParam("newPassword") String newPassword) {
        userService.updateUserPassword(id, newPassword);
        return "redirect:/userPanel";
    }

}
