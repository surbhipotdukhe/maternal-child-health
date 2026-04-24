package com.mchtracker.model;

import jakarta.persistence.*;
import java.time.LocalDate;
import java.util.List;

/**
 * Child entity - stores details about a child linked to a Mother.
 */
@Entity
@Table(name = "children")
public class Child {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private String name;

    private LocalDate dateOfBirth;

    private String gender;

    private double weightKg;

    private double heightCm;

    private String healthStatus; // e.g. Healthy, Under Observation

    // Many children belong to one mother
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "mother_id", nullable = false)
    private Mother mother;

    // One child can have many immunization records
    @OneToMany(mappedBy = "child", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private List<Immunization> immunizations;

    // ---- Constructors ----
    public Child() {}

    // ---- Getters & Setters ----
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public LocalDate getDateOfBirth() { return dateOfBirth; }
    public void setDateOfBirth(LocalDate dateOfBirth) { this.dateOfBirth = dateOfBirth; }

    public String getGender() { return gender; }
    public void setGender(String gender) { this.gender = gender; }

    public double getWeightKg() { return weightKg; }
    public void setWeightKg(double weightKg) { this.weightKg = weightKg; }

    public double getHeightCm() { return heightCm; }
    public void setHeightCm(double heightCm) { this.heightCm = heightCm; }

    public String getHealthStatus() { return healthStatus; }
    public void setHealthStatus(String healthStatus) { this.healthStatus = healthStatus; }

    public Mother getMother() { return mother; }
    public void setMother(Mother mother) { this.mother = mother; }

    public List<Immunization> getImmunizations() { return immunizations; }
    public void setImmunizations(List<Immunization> immunizations) { this.immunizations = immunizations; }
}
