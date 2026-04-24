package com.mchtracker.repository;

import com.mchtracker.model.Immunization;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.time.LocalDate;
import java.util.List;

/**
 * Repository interface for Immunization entity.
 */
@Repository
public interface ImmunizationRepository extends JpaRepository<Immunization, Long> {
    List<Immunization> findByChildId(Long childId);
    List<Immunization> findByStatus(String status);
    List<Immunization> findByDueDateBetween(LocalDate start, LocalDate end);
}
