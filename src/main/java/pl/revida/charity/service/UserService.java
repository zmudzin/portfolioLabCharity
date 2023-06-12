package pl.revida.charity.service;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import pl.revida.charity.entity.User;
import pl.revida.charity.repository.RoleRepository;
import pl.revida.charity.repository.UserRepository;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Service
public class UserService implements UserDetailsService {
    private final UserRepository userRepository;
    private final RoleRepository roleRepository;
    private final BCryptPasswordEncoder passwordEncoder;
    public UserService(UserRepository userRepository, RoleRepository roleRepository, BCryptPasswordEncoder passwordEncoder) {
        this.userRepository = userRepository;
        this.roleRepository=roleRepository;
        this.passwordEncoder=passwordEncoder;
    }

    public User findByEmail(String email) {
        return userRepository.findByEmail(email);
    }

    public void createUser(User user) {
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        userRepository.save(user);    }

    public boolean isEmailExists (String email){

        return userRepository.existsByEmail(email);
    }
    public List<User> findAll (){

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
        return new CurrentUser(user.getEmail(),user.getPassword(),
                grantedAuthorities, user);
    }

}
