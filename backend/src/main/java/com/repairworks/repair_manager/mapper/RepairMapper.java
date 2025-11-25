package com.repairworks.repair_manager.mapper;

import com.repairworks.repair_manager.dto.RepairDTO;
import com.repairworks.repair_manager.model.Repair;
import org.mapstruct.Mapper;

@Mapper(componentModel = "spring")
public interface RepairMapper {
    RepairDTO toDTO(Repair repair);
    Repair toEntity(RepairDTO repairDTO);
}
