package pl.coderslab.charity.service;

import org.springframework.stereotype.Service;
import pl.coderslab.charity.entity.Institution;
import pl.coderslab.charity.repository.InstitutionRepository;
import java.util.List;
import java.util.Optional;
@Service
public class InstitutionService {
    private final InstitutionRepository institutionRepository;

    public InstitutionService(InstitutionRepository institutionRepository) {
        this.institutionRepository = institutionRepository;
    }

    public List<Institution> getAllInstitutions() {
        return institutionRepository.findAll();
    }
    public Optional<Institution> getInstitutionById(Long id) {
        return institutionRepository.findById(id);
    }
    public Institution createInstitution(Institution institution) {
        return institutionRepository.save(institution);
    }
    public void deleteInstitution(Long id) {
        institutionRepository.deleteById(id);
    }
}
