package com.repairworks.repair_manager.model;

import jakarta.persistence.*;

import java.math.BigDecimal;
import java.time.LocalDateTime;

@Entity
@Table(name = "repair_services")
public class RepairService {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private Integer quantity;
    private BigDecimal unitPrice;

    private LocalDateTime createdAt;

    @ManyToOne
    @JoinColumn(name = "repair_id", nullable = false)
    private Repair repair;

    @ManyToOne
    @JoinColumn(name = "service_id", nullable = false)
    private Service service;
}
