package pl.revida.charity.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.revida.charity.entity.Institution;


public interface InstitutionRepository extends JpaRepository<Institution, Long> {
    Institution findById(long id);
}
