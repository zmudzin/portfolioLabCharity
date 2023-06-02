package pl.coderslab.charity.service;

import org.springframework.stereotype.Service;
import pl.coderslab.charity.entity.Donation;
import pl.coderslab.charity.repository.DonationRepository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

@Service
public class DonationService {
    @PersistenceContext
    EntityManager entityManager;
    private final DonationRepository donationRepository;

    public DonationService(DonationRepository donationRepository) {
        this.donationRepository = donationRepository;
    }

    public Long totalDonationQuantity() {
        Query query= entityManager.createQuery("select sum(d.quantity) from Donation d", Long.class);
    Long sum= (Long) query.getSingleResult();
        return sum;}
    public Long donationSize(){Query query = entityManager.createQuery("select count (d) from Donation d",Long.class);
    Long sum= (Long) query.getSingleResult();
    return sum;}

    public Donation createDonation(Donation donation) {
        return donationRepository.save(donation);
    }



}
