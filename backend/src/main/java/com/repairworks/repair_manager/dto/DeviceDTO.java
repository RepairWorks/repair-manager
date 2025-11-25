package com.repairworks.repair_manager.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class DeviceDTO {
    private Long id;
    private String brand;
    private String model;
    private String serialNumber;
    private String notes;
    private Long customerId;
    private Long deviceTypeId;
}