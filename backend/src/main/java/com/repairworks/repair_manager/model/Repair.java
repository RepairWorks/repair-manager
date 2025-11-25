package com.repairworks.repair_manager.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;

@Entity
@Table(name = "repairs")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Repair {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "device_id", nullable = false)
    private Device device;

    @ManyToOne
    @JoinColumn(name = "customer_id", nullable = false)
    private Customer customer;

    @Enumerated(EnumType.STRING)
    private RepairStatus status;

    @Column(columnDefinition = "TEXT")
    private String problemDescription;


    private BigDecimal totalPrice;

    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;

    @OneToMany(mappedBy = "repair", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<RepairProduct> repairProducts;


    @OneToMany(mappedBy = "repair", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<RepairService> repairServices;


    @OneToMany(mappedBy = "repair", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Invoice> invoices;
}