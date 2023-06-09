package pl.revida.charity.service;

import org.springframework.stereotype.Service;
import pl.revida.charity.entity.User;
import pl.revida.charity.repository.UserRepository;
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

        return userRepository.existsByEmail(email);
    }




}
