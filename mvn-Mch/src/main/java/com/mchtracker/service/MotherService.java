package com.mchtracker.service;

import com.mchtracker.model.Mother;
import com.mchtracker.repository.MotherRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.Optional;

/**
 * Service class for Mother-related operations.
 */
@Service
public class MotherService {

    @Autowired
    private MotherRepository motherRepository;

    /** Save or update a mother record */
    public Mother saveMother(Mother mother) {
        return motherRepository.save(mother);
    }

    /** Get all mothers */
    public List<Mother> getAllMothers() {
        return motherRepository.findAll();
    }

    /** Get a mother by ID */
    public Mother getMotherById(Long id) {
        Optional<Mother> mother = motherRepository.findById(id);
        return mother.orElse(null);
    }

    /** Search mothers by name */
    public List<Mother> searchByName(String name) {
        return motherRepository.findByNameContainingIgnoreCase(name);
    }

    /** Delete a mother by ID */
    public void deleteMother(Long id) {
        motherRepository.deleteById(id);
    }

    /** Count total registered mothers */
    public long countMothers() {
        return motherRepository.count();
    }
}
