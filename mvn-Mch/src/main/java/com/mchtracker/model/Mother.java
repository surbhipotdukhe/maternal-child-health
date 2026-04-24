package com.mchtracker.model;

import jakarta.persistence.*;
import java.time.LocalDate;
import java.util.List;

/**
 * Mother entity - stores details about the registered mother.
 */
@Entity
@Table(name = "mothers")
public class Mother {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private String name;

    private int age;

    private String contactNumber;

    private String address;

    private String bloodGroup;

    private String medicalHistory;

    private LocalDate registrationDate;

    @PrePersist
    public void prePersist() {
        this.registrationDate = LocalDate.now();
    }

    // One mother can have many children
    @OneToMany(mappedBy = "mother", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private List<Child> children;

    // ---- Constructors ----
    public Mother() {}

    // ---- Getters & Setters ----
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public int getAge() { return age; }
    public void setAge(int age) { this.age = age; }

    public String getContactNumber() { return contactNumber; }
    public void setContactNumber(String contactNumber) { this.contactNumber = contactNumber; }

    public String getAddress() { return address; }
    public void setAddress(String address) { this.address = address; }

    public String getBloodGroup() { return bloodGroup; }
    public void setBloodGroup(String bloodGroup) { this.bloodGroup = bloodGroup; }

    public String getMedicalHistory() { return medicalHistory; }
    public void setMedicalHistory(String medicalHistory) { this.medicalHistory = medicalHistory; }

    public LocalDate getRegistrationDate() { return registrationDate; }
    public void setRegistrationDate(LocalDate registrationDate) { this.registrationDate = registrationDate; }

    public List<Child> getChildren() { return children; }
    public void setChildren(List<Child> children) { this.children = children; }
}
