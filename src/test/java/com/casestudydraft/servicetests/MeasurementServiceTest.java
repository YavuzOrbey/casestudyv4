package com.casestudydraft.servicetests;
import static org.junit.jupiter.api.Assertions.*;
import com.casestudydraft.model.Measurement;
import com.casestudydraft.repository.MeasurementRepository;
import com.casestudydraft.service.MeasurementService;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.Mockito;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import static org.mockito.ArgumentMatchers.anyLong;
import java.util.Optional;
@SpringBootTest(classes = {MeasurementRepository.class, MeasurementService.class})
public class MeasurementServiceTest {
    @Autowired
    private MeasurementRepository measurementRepository;
    @Autowired
    private MeasurementService measurementService;

   /* @BeforeEach
    void setUp() throws Exception {
        measurementRepository = Mockito.mock(MeasurementRepository.class);
        measurementService = new MeasurementService(measurementRepository);
    }*/

    @Test
    void testGet(){
        Measurement expected = new Measurement("grams");
        expected.setId(1L);
        Mockito.when(measurementRepository.findById(anyLong())).thenReturn(Optional.of(expected));
        Measurement actual = measurementService.get(1L);
        assertEquals(expected, actual);
    }
}
