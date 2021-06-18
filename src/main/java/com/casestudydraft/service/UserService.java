package com.casestudydraft.service;


import com.casestudydraft.model.User;

import org.springframework.stereotype.Service;

@Service
public interface UserService {
    void save(User user);

    User findByEmail(String email);
    User findByUsername(String username);
}
