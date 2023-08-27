package pl.revida.charity.repository;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import pl.revida.charity.entity.Donation;

import javax.validation.constraints.NotNull;
import java.util.List;
import java.util.Optional;


public interface DonationRepository extends JpaRepository<Donation, Long> {
    @Query("select sum(d.quantity) from Donation d")
    Optional<Long> totalQuantity();
    List<Donation> findAll();
    Donation findById(long id);
    List<Donation> findAllByUserId(long id);
    List<Donation> findAllByOrderByInstitutionNameAsc();
    List<Donation> findAllByOrderByInstitutionNameDesc();
    List<Donation> findAllByOrderByQuantityAsc();
    List<Donation> findAllByOrderByQuantityDesc();
    List<Donation> findAllByOrderByPickUpDateAsc();
    List<Donation> findAllByOrderByPickUpDateDesc();
    List<Donation> findAllByOrderByUserAsc();
    List<Donation> findAllByOrderByUserDesc();
    List<Donation> findAllByCollected(@NotNull boolean collected);
    List<Donation> findByUserEmailContaining(String username);



}
