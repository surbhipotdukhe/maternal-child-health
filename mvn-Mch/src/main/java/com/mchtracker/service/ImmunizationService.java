package com.mchtracker.service;

import com.mchtracker.model.Child;
import com.mchtracker.model.Immunization;
import com.mchtracker.repository.ChildRepository;
import com.mchtracker.repository.ImmunizationRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

/**
 * Service class for Immunization-related operations.
 */
@Service
public class ImmunizationService {

    @Autowired
    private ImmunizationRepository immunizationRepository;

    @Autowired
    private ChildRepository childRepository;

    /** Save an immunization record linked to a child */
    public Immunization saveImmunization(Immunization immunization, Long childId) {
        Optional<Child> child = childRepository.findById(childId);
        child.ifPresent(immunization::setChild);
        return immunizationRepository.save(immunization);
    }

    /** Get all immunization records */
    public List<Immunization> getAllImmunizations() {
        return immunizationRepository.findAll();
    }

    /** Get immunizations for a specific child */
    public List<Immunization> getImmunizationsByChildId(Long childId) {
        return immunizationRepository.findByChildId(childId);
    }

    /** Get immunizations by status */
    public List<Immunization> getByStatus(String status) {
        return immunizationRepository.findByStatus(status);
    }

    /** Get immunizations due within the next N days */
    public List<Immunization> getUpcomingImmunizations(int days) {
        LocalDate today = LocalDate.now();
        LocalDate future = today.plusDays(days);
        return immunizationRepository.findByDueDateBetween(today, future);
    }

    /** Save an existing immunization (no child re-linking, used by scheduler) */
    public Immunization saveImmunization(Immunization immunization) {
        return immunizationRepository.save(immunization);
    }

    /** Delete an immunization record */
    public void deleteImmunization(Long id) {
        immunizationRepository.deleteById(id);
    }

    /** Count all immunization records */
    public long countImmunizations() {
        return immunizationRepository.count();
    }

    /** Count pending immunizations */
    public long countPending() {
        return immunizationRepository.findByStatus("Pending").size();
    }
}
