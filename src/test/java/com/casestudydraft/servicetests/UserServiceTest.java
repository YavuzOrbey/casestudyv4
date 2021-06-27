package com.casestudydraft.servicetests;

import com.casestudydraft.model.Measurement;
import com.casestudydraft.model.User;
import com.casestudydraft.service.MeasurementService;
import com.casestudydraft.service.UserService;
import org.junit.jupiter.api.MethodOrderer;
import org.junit.jupiter.api.Order;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestMethodOrder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

@SpringBootTest
@TestMethodOrder(MethodOrderer.OrderAnnotation.class)
public class UserServiceTest {
    static Long testId;


    @Autowired
    private UserService userService;

    final String randomName = "test user " + Math.random()* Long.MAX_VALUE;
    @Test
    @Order(1)
    void testSave(){
        User user = new User("yavuz@yavuz.com", "yavuz1", "password");
        userService.save(user);
        testId = user.getId();
        assertNotNull(user.getId());
    }


    @Test
    @Order(2)
    void testGet(){
    }
}
