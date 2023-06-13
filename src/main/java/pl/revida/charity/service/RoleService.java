package pl.revida.charity.service;

import org.springframework.stereotype.Service;
import pl.revida.charity.entity.Role;
import pl.revida.charity.repository.RoleRepository;

import java.util.List;
@Service
public class RoleService {
    private final RoleRepository roleRepository;

    public RoleService(RoleRepository roleRepository) {
        this.roleRepository = roleRepository;
    }
    public List<Role> findAll (){
        return roleRepository.findAll();
    }
    public Role findByName(String name){return roleRepository.findByName(name);}
}
