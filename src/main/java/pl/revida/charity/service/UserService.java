package pl.revida.charity.service;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import pl.revida.charity.entity.Role;
import pl.revida.charity.entity.User;
import pl.revida.charity.repository.UserRepository;

import javax.transaction.Transactional;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Service
@Transactional
public class UserService implements UserDetailsService {
    private final UserRepository userRepository;
    private final BCryptPasswordEncoder passwordEncoder;
    private final RoleService roleService;

    public UserService(UserRepository userRepository, BCryptPasswordEncoder passwordEncoder, RoleService roleService) {
        this.userRepository = userRepository;
        this.passwordEncoder = passwordEncoder;
        this.roleService = roleService;
    }

    public User findByEmail(String email) {
        return userRepository.findByEmail(email);
    }

    public User findById(long id) {
        return userRepository.findById(id);
    }

    public void createUser(User user) {
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        userRepository.save(user);
    }

    public boolean isEmailExists(String email) {

        return userRepository.existsByEmail(email);
    }

    public List<User> findAll() {

        return userRepository.findAll();
    }

    @Override
    public UserDetails loadUserByUsername(String email) {
        User user = findByEmail(email);
        if (user == null) {
            throw new UsernameNotFoundException(email);
        }
        Set<GrantedAuthority> grantedAuthorities = new HashSet<>();
        user.getRoles().forEach(r ->
                grantedAuthorities.add(new SimpleGrantedAuthority(r.getName())));
        return new CurrentUser(user.getEmail(), user.getPassword(),
                grantedAuthorities, user);
    }

    public void deleteUser (User user) {
        userRepository.delete(user);
    }

    public void updateUserEmail(Long userId, String newEmail) {
        User user = findById(userId);
        if (user == null) {
            throw new IllegalArgumentException("User not found");
        }
        boolean emailExists = isEmailExists(newEmail);
        if (emailExists) {
            throw new IllegalArgumentException("Email already exists");
        }
        user.setEmail(newEmail);
        userRepository.save(user);
        //updateUser(user);
    }
    public void updateUserPassword(Long userId, String newPassword) {
        User user = findById(userId);
        if (user != null) {
            BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
            String encodedPassword = passwordEncoder.encode(newPassword);
            user.setPassword(encodedPassword);
            userRepository.save(user);
        } else {
            throw new IllegalArgumentException("User not found with ID: " + userId);
        }
    }
    public void addUserRole(User user, String roleName) {
        Role role = roleService.findByName(roleName);

            roleService.save(role);

        Set<Role> userRoles = user.getRoles();
        if (userRoles == null) {
            userRoles = new HashSet<>();
            user.setRoles(userRoles);
        }

        userRoles.add(role);
        userRepository.save(user);
    }
}

