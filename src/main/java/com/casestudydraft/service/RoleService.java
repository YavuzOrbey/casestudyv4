package com.casestudydraft.service;

import com.casestudydraft.model.Role;
import com.casestudydraft.model.User;
import com.casestudydraft.repository.RoleRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RoleService {

    @Autowired
    RoleRepository roleRepository;

    public void save(Role role){
        roleRepository.save(role);
    }

    public void giveUserRole(User user, Role role){
        //roleRepository
    }
}
