package pl.revida.charity.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.revida.charity.entity.Donation;
import pl.revida.charity.entity.User;

import java.util.List;

public interface UserRepository extends JpaRepository<User, Long> {

    boolean existsByEmail(String email);
    User findByEmail(String email);
    List<User> findAll();
    User findById(long id);
    List<User> findByEmailContaining(String email);
}