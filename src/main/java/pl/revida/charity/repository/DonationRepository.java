package pl.revida.charity.repository;


import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
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
    Page<Donation> findAllByOrderByInstitutionNameAsc(Pageable pageable);
    Page<Donation> findAllByOrderByInstitutionNameDesc(Pageable pageable);
    Page<Donation> findAllByOrderByQuantityAsc(Pageable pageable);
    Page<Donation> findAllByOrderByQuantityDesc(Pageable pageable);
    Page<Donation> findAllByOrderByPickUpDateAsc(Pageable pageable);
    Page<Donation> findAllByOrderByPickUpDateDesc(Pageable pageable);
    Page<Donation> findAllByOrderByUserAsc(Pageable pageable);
    Page<Donation> findAllByOrderByUserDesc(Pageable pageable);
    Page<Donation> findAllByCollected(@NotNull boolean collected, Pageable pageable);
    Page<Donation> findByUserEmailContaining(String username,Pageable pageable);

}
