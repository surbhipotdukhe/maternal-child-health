package com.mchtracker.repository;

import com.mchtracker.model.Mother;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.List;

/**
 * Repository interface for Mother entity.
 */
@Repository
public interface MotherRepository extends JpaRepository<Mother, Long> {
    List<Mother> findByNameContainingIgnoreCase(String name);
}
