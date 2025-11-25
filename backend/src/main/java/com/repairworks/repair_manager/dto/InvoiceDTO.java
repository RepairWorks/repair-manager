package com.repairworks.repair_manager.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class InvoiceDTO {
    private Long id;
    private Long repairId;
    private Long customerId;
    private BigDecimal totalAmount;
    private Boolean paid;
}