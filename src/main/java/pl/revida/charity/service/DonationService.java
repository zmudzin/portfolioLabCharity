package pl.revida.charity.service;

import org.springframework.stereotype.Service;
import pl.revida.charity.entity.Donation;
import pl.revida.charity.repository.DonationRepository;


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



}
