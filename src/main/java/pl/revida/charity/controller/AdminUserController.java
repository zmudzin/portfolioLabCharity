package pl.revida.charity.controller;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.*;
import pl.revida.charity.entity.Role;
import pl.revida.charity.entity.User;
import pl.revida.charity.service.RoleService;
import pl.revida.charity.service.UserService;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.security.Principal;
import java.util.Collection;

@Controller
public class AdminUserController {

    private final UserService userService;
    private final RoleService roleService;

    public AdminUserController(UserService userService, RoleService roleService) {
        this.userService = userService;
        this.roleService = roleService;
    }

    @ModelAttribute("users")
    public Collection<User> users() {
        return this.userService.findAll();
    }

    @ModelAttribute("roles")
    public Collection<Role> roles() {
        return this.roleService.findAll();
    }

    @RequestMapping("/admin")
    public String login() {
        return "userView/userIndexAdmin";
    }

    @RequestMapping("/admin/users")
    public String findAllUsers( @RequestParam(name = "email", required = false) String email,
                                Model model) {
        Collection<User> users;

        if (email != null && !email.isEmpty()) {
            users = userService.findByEmailContaining(email);
            model.addAttribute("users", users);
        }
            return "userView/userIndexAdmin";
    }
    @RequestMapping("/admin/users/{id}")
    public String getUser(Model model, @PathVariable long id) {
        User user = userService.findById(id);
        model.addAttribute(user);
        return "userView/userViewForm";
    }

    @GetMapping("/admin/users/add")
    public String addUserForm(Model model) {
        model.addAttribute(new User());
        return "userView/userAddForm";
    }

    @PostMapping("/admin/users/add")
    public String addUser(@Valid User user, BindingResult result) {
        if (result.hasErrors()) {
            for (ObjectError error : result.getAllErrors()) {
                return "userView/userAddForm";
            }
        }

        userService.createUser(user);
        return "redirect:/admin/users";
    }

    @GetMapping("/admin/users/delete/{id}")
        public String deleteUserForm(Model model, @PathVariable long id) {
        User user = userService.findById(id);
        model.addAttribute(user);
        return "userView/userDeleteForm";
    }
        @PostMapping("/admin/users/delete/{id}")
        public String deleteUser(User user, Principal principal) {
            if (user != null && !user.getEmail().equals(principal.getName())) {
                user.setEnabled(false);
                user.setRoles(null);
                userService.createUser(user);
               // userService.deleteUser(user);
            } else {
                return "redirect:/admin/users";
            }
        return "redirect:/admin/users";
    }

    @PostMapping("/admin/updateEmail/{id}")
    public String updateUserEmail(@PathVariable Long id, @RequestParam("newEmail") String newEmail, HttpServletRequest request) {

        userService.updateUserEmail(id, newEmail);
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        authentication.setAuthenticated(false);
        SecurityContextHolder.clearContext();
        request.getSession().invalidate();

        return "redirect:/login?logout"; // Przekierowanie do strony logowania z informacją o wylogowaniu

    }
    @PostMapping("/admin/updatePassword/{id}")
    public String updateUserPassword(@PathVariable Long id, @RequestParam("newPassword") String newPassword) {
        userService.updateUserPassword(id, newPassword);
        return "redirect:/admin/users";
    }

    @PostMapping("/admin/updateEnabled/{id}")
    public String updateUserPassword(@PathVariable Long id, @RequestParam("enabled") boolean enabled) {
        userService.updateUserEnabled(id, enabled);
        return "redirect:/admin/users";
    }

    @PostMapping("/admin/updateUserRole/{id}")
    public String updateUserRole(@PathVariable Long id, @RequestParam("roleName") String roleName) {
        User user = userService.findById(id);
        userService.updateUserRole(user,roleName);
        return "redirect:/admin/users";
    }


}