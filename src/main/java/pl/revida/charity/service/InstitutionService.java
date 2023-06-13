package pl.revida.charity.service;

import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import pl.revida.charity.entity.Institution;
import pl.revida.charity.repository.InstitutionRepository;

import java.util.Collection;
import java.util.List;
@Service
public class InstitutionService {
    private final InstitutionRepository institutionRepository;
    public InstitutionService(InstitutionRepository institutionRepository) {
        this.institutionRepository = institutionRepository;
    }
    public List<Institution> getInstitutionsForIndexPage() {
        return institutionRepository.findAll(Pageable.ofSize(4)).getContent();
    }
    public Collection<Institution> findAll() {
        return institutionRepository.findAll();
    }
    public Institution findById(long id){return institutionRepository.findById(id);}
    public Institution createInstitution(Institution institution){return institutionRepository.save(institution);}
    public void deleteInstitution(Institution institution){institutionRepository.delete(institution);}
    public Institution updateInstitution(Institution institution) {
        institutionRepository.delete(institution);
        return institutionRepository.save(institution);
    }
}
