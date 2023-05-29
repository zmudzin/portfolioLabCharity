package pl.coderslab.charity.repository;

import org.springframework.data.jpa.repository.EntityGraph;
import org.springframework.data.jpa.repository.JpaRepository;
import pl.coderslab.charity.entity.Donation;

import java.util.List;

public interface DonationRepository extends JpaRepository<Donation,Long> {

    @EntityGraph(attributePaths = {"institutions"})
    List<Donation> findAllByInstitutionId(Long id);
}
