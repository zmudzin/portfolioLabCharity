package pl.revida.charity.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
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
       // donationRepository.delete(donation);
        return donationRepository.save(donation);
    }

    public List<Donation> findAll(){return donationRepository.findAll();}
    public Donation findById(long id){return donationRepository.findById(id);}
    public List<Donation> getDonationsByUserId(long userId) {
        return donationRepository.findAllByUserId(userId);
    }
    public Page<Donation> findAllSortedByNameAsc(Pageable pageable) {
        return donationRepository.findAllByOrderByInstitutionNameAsc(pageable);
    }
    public Page<Donation> findAllSortedByNameDesc(Pageable pageable) {
        return donationRepository.findAllByOrderByInstitutionNameDesc(pageable);
    }
    public Page<Donation> findAllSortedByQuantityAsc(Pageable pageable) {
        return donationRepository.findAllByOrderByQuantityAsc(pageable);
    }
    public Page<Donation> findAllSortedByQuantityDesc(Pageable pageable) {
        return donationRepository.findAllByOrderByQuantityDesc(pageable);
    }
    public Page<Donation> findAllSortedByPickupDateAsc(Pageable pageable) {
        return donationRepository.findAllByOrderByPickUpDateAsc(pageable);
    }
    public Page<Donation> findAllSortedByPickupDesc(Pageable pageable) {
        return donationRepository.findAllByOrderByPickUpDateDesc(pageable);
    }
    public Page<Donation> findAllSortedByUserAsc(Pageable pageable) {
        return donationRepository.findAllByOrderByUserAsc(pageable);
    }
    public Page<Donation> findAllSortedByUserDesc(Pageable pageable) {
        return donationRepository.findAllByOrderByUserDesc(pageable);
    }
    public Page<Donation> findAllByCollected(boolean collected, Pageable pageable) {
        return donationRepository.findAllByCollected(collected,pageable);
    }
    public Page<Donation> findByUserEmailContaining(String userEmail,Pageable pageable) {
        return donationRepository.findByUserEmailContaining(userEmail,pageable);
    }


}
