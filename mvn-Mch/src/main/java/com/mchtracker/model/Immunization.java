package com.mchtracker.model;

import jakarta.persistence.*;
import java.time.LocalDate;

/**
 * Immunization entity - tracks vaccine records for a child.
 */
@Entity
@Table(name = "immunizations")
public class Immunization {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private String vaccineName;

    private LocalDate dateGiven;

    private LocalDate dueDate;

    private String status; // Given, Pending, Overdue

    private String notes;

    // Many immunizations belong to one child
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "child_id", nullable = false)
    private Child child;

    // ---- Constructors ----
    public Immunization() {}

    // ---- Getters & Setters ----
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public String getVaccineName() { return vaccineName; }
    public void setVaccineName(String vaccineName) { this.vaccineName = vaccineName; }

    public LocalDate getDateGiven() { return dateGiven; }
    public void setDateGiven(LocalDate dateGiven) { this.dateGiven = dateGiven; }

    public LocalDate getDueDate() { return dueDate; }
    public void setDueDate(LocalDate dueDate) { this.dueDate = dueDate; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }

    public String getNotes() { return notes; }
    public void setNotes(String notes) { this.notes = notes; }

    public Child getChild() { return child; }
    public void setChild(Child child) { this.child = child; }
}
