package pl.coderslab.charity.service;

import org.springframework.stereotype.Service;
import pl.coderslab.charity.entity.User;
import pl.coderslab.charity.repository.UserRepository;
@Service
public class UserService {
    private final UserRepository userRepository;

    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }
    public User createUser(User user) {
        return userRepository.save(user);
    }

    public boolean isEmailExists (String email){
        User user = userRepository.findByEmail(email);
        return user != null;
    }




}
