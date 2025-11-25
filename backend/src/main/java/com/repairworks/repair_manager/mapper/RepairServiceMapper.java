package com.repairworks.repair_manager.mapper;

import com.repairworks.repair_manager.dto.RepairServiceDTO;
import com.repairworks.repair_manager.model.RepairService;
import org.mapstruct.Mapper;

@Mapper(componentModel = "spring")
public interface RepairServiceMapper {
    RepairServiceDTO toDTO(RepairService repairService);
    RepairService toEntity(RepairServiceDTO repairServiceDTO);
}
