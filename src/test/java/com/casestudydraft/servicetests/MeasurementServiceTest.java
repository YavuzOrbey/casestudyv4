package com.casestudydraft.servicetests;
import static org.junit.jupiter.api.Assertions.*;
import com.casestudydraft.model.Measurement;
import com.casestudydraft.repository.MeasurementRepository;
import com.casestudydraft.service.MeasurementService;
import org.aspectj.lang.annotation.Before;
import org.hibernate.Hibernate;
import org.junit.jupiter.api.*;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mockito;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.junit.jupiter.SpringExtension;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.transaction.annotation.Transactional;

import static org.mockito.ArgumentMatchers.anyLong;
import java.util.Optional;



@SpringBootTest
@TestMethodOrder(MethodOrderer.OrderAnnotation.class)
public class MeasurementServiceTest {
    static Long testId;
    @Autowired
    private MeasurementService measurementService;

    @Autowired
    private MeasurementRepository measurementRepository;

    static final String name = String.valueOf(Math.random()*Integer.MAX_VALUE);
    @Test
    @Order(1)

    void testSave() {
        Measurement measurement = new Measurement(name);
        measurementService.save(measurement);
        testId = measurement.getId();
        System.out.println(testId);
        assertNotNull(measurement.getId());
    }

    @Test
    @Order(2)
    @Transactional
    void testGet() {
        Measurement expected = new Measurement(name);
        expected.setId(testId);
        Measurement proxy = measurementService.get(testId);

        // Don't ask me how this works but I've spent all day trying to figure out how to fix this method
        Object actual1 = Hibernate.unproxy(proxy);
        Measurement actual = (Measurement) actual1;
        assertEquals(expected, actual);
    }

    @Test
    @Order(3)
    void testUpdate(){

    }
}
