package pl.revida.charity.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.revida.charity.entity.Role;
import pl.revida.charity.entity.User;
import pl.revida.charity.repository.RoleRepository;
import pl.revida.charity.service.UserService;

import javax.validation.Valid;
import java.util.Collection;

@Controller
public class AdminController {

    private final UserService userService;
    private final RoleRepository roleRepository;

    public AdminController(UserService userService, RoleRepository roleRepository) {
        this.userService = userService;
        this.roleRepository = roleRepository;
    }
    @ModelAttribute("users")
    public Collection<User> users() {
        return this.userService.findAll();
    }
    @ModelAttribute("roles")
    public Collection<Role> roles(){return this.roleRepository.findAll();}

    @RequestMapping("/admin")
        public String login() {
            return "indexAdmin";
        }

    @RequestMapping("/admin/users")
    public String findAll() {
        return "indexAdmin";
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

}
