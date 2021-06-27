package com.casestudydraft.servicetests;

import com.casestudydraft.repository.MeasurementRepository;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import static org.junit.jupiter.api.Assertions.*;
@DataJpaTest
public class MeasurementRepositoryTest {



    @Autowired
    MeasurementRepository measurementRepository;

    @Test
    public void testFindByUsername() {
        assertNotNull(measurementRepository.findByName("grams"));
    }

    /*
     * @Test to check if FindByUsername works in UserRepository
     * success if test returns null for the given value that is currently NOT in the database
     */
    /*@Test
    public void testFindByUsernameIsNull() {
        assertNull(userRepo.findByUsername("drewparso"));

    }*/
}
