package com.casestudydraft.repository;

import com.casestudydraft.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;

public interface UserRepository extends CrudRepository<User, Long> {
    User findByEmail(String email);
    User findByUsername(String username);
}
