package pl.coderslab.charity.repository;

import org.springframework.data.jpa.repository.EntityGraph;
import org.springframework.data.jpa.repository.JpaRepository;
import pl.coderslab.charity.entity.Donation;
import pl.coderslab.charity.entity.Institution;

import java.util.List;

public interface InstitutionRepository extends JpaRepository<Institution, Long> {

}
