package pl.coderslab.charity.service;

import org.springframework.stereotype.Service;
import pl.coderslab.charity.entity.Donation;
import pl.coderslab.charity.repository.DonationRepository;


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
