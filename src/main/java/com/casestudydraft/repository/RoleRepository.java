package com.casestudydraft.repository;

import com.casestudydraft.model.Role;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface RoleRepository extends JpaRepository<Role, Long> {
    public List<Role> findByName(String name);
}
