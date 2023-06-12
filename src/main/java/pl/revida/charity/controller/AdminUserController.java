package pl.revida.charity.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.*;
import pl.revida.charity.entity.*;
import pl.revida.charity.service.*;

import javax.validation.Valid;
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
        return "userIndexAdmin";
    }

    @RequestMapping("/admin/users")
    public String findAllUsers() {
        return "userIndexAdmin";
    }

    @RequestMapping("/admin/users/{id}")
    public String getUser(Model model, @PathVariable long id) {
        User user = userService.findById(id);
        model.addAttribute(user);
        return "/userViewForm";
    }

    @GetMapping("/admin/users/add")
    public String addUserForm(Model model) {
        model.addAttribute(new User());
        return "/userAddForm";
    }

    @PostMapping("/admin/users/add")
    public String addUser(@Valid User user, BindingResult result) {
        if (result.hasErrors()) {
            for (ObjectError error : result.getAllErrors()) {
                return "userAddForm";
            }
        }
        userService.createUser(user);
        return "redirect:/admin/users";
    }

    @GetMapping("/admin/users/delete/{id}")
    public String deleteUserForm(Model model, @PathVariable long id) {
        User user = userService.findById(id);
        model.addAttribute(user);
        return "/userDeleteForm";
    }

    @PostMapping("/admin/users/delete/{id}")
    public String deleteUser(User user) {
        userService.deleteUser(user);
        return "redirect:/admin/users";
    }
}