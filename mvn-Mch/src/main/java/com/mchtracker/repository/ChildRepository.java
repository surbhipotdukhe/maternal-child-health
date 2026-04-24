package com.mchtracker.repository;

import com.mchtracker.model.Child;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.List;

/**
 * Repository interface for Child entity.
 */
@Repository
public interface ChildRepository extends JpaRepository<Child, Long> {
    List<Child> findByMotherId(Long motherId);
}
