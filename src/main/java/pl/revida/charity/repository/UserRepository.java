package pl.revida.charity.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.revida.charity.entity.User;

public interface UserRepository extends JpaRepository<User, Long> {

    boolean existsByEmail(String email);

}