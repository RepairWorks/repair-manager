package com.repairworks.repair_manager.dto;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.time.LocalDateTime;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class RepairDTO {
    private Long id;
    private Long deviceId;
    private Long customerId;
    private String status;
    private String problemDescription;
    private BigDecimal totalPrice;
    private LocalDateTime createdAt;
}
