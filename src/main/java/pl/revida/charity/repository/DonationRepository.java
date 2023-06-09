package pl.revida.charity.repository;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import pl.revida.charity.entity.Donation;

import java.util.Optional;


public interface DonationRepository extends JpaRepository<Donation, Long> {
    @Query("select sum(d.quantity) from Donation d")
    Optional<Long> totalQuantity();
}
