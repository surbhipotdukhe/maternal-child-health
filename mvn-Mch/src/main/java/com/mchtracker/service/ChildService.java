package com.mchtracker.service;

import com.mchtracker.model.Child;
import com.mchtracker.model.Mother;
import com.mchtracker.repository.ChildRepository;
import com.mchtracker.repository.MotherRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.Optional;

/**
 * Service class for Child-related operations.
 */
@Service
public class ChildService {

    @Autowired
    private ChildRepository childRepository;

    @Autowired
    private MotherRepository motherRepository;

    /** Save a child record linked to a mother */
    public Child saveChild(Child child, Long motherId) {
        Optional<Mother> mother = motherRepository.findById(motherId);
        mother.ifPresent(child::setMother);
        return childRepository.save(child);
    }

    /** Get all children */
    public List<Child> getAllChildren() {
        return childRepository.findAll();
    }

    /** Get a child by ID */
    public Child getChildById(Long id) {
        return childRepository.findById(id).orElse(null);
    }

    /** Get children by mother ID */
    public List<Child> getChildrenByMotherId(Long motherId) {
        return childRepository.findByMotherId(motherId);
    }

    /** Delete a child */
    public void deleteChild(Long id) {
        childRepository.deleteById(id);
    }

    /** Count total children */
    public long countChildren() {
        return childRepository.count();
    }
}
