package pl.coderslab.charity.service;

import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import pl.coderslab.charity.entity.Institution;
import pl.coderslab.charity.repository.InstitutionRepository;

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
    public Collection<Institution> getAllInstitutions() {
        return institutionRepository.findAll();
    }
}
