package com.repairworks.repair_manager.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.time.LocalDateTime;

@Entity
@Table(name = "repair_products")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class RepairProduct {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private Integer quantity = 1;
    private BigDecimal unitPrice;

    private LocalDateTime createdAt;

    @ManyToOne
    @JoinColumn(name = "repair_id", nullable = false)
    private Repair repair;

    @ManyToOne
    @JoinColumn(name = "product_id", nullable = false)
    private Product product;
}
