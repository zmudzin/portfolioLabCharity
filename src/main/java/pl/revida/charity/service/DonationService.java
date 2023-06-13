package pl.revida.charity.service;

import org.springframework.stereotype.Service;
import pl.revida.charity.entity.Donation;
import pl.revida.charity.repository.DonationRepository;

import java.util.Collection;
import java.util.List;


@Service
public class DonationService {
    private final DonationRepository donationRepository;

    public DonationService(DonationRepository donationRepository) {
        this.donationRepository = donationRepository;
    }

    public long totalDonationQuantity() {
    return donationRepository.totalQuantity().orElse(0L);}
    public long donationSize(){
    return donationRepository.count();
    }

    public Donation createDonation(Donation donation) {
        return donationRepository.save(donation);
    }
    public void deleteDonation(Donation donation){donationRepository.delete(donation);}
    public Donation updateDonation(Donation donation) {
        donationRepository.delete(donation);
        return donationRepository.save(donation);
    }

public Collection<Donation> findAll(){return donationRepository.findAll();}
    public Donation findById(long id){return donationRepository.findById(id);}
    public List<Donation> getDonationsByUserId(long userId) {
        return donationRepository.findAllByUserId(userId);
    }
}
