package com.repairworks.repair_manager.mapper;

import com.repairworks.repair_manager.dto.RepairProductDTO;
import com.repairworks.repair_manager.model.RepairProduct;
import org.mapstruct.Mapper;

@Mapper(componentModel = "spring")
public interface RepairProductMapper {
    RepairProductDTO toDTO(RepairProduct repairProduct);
    RepairProduct toEntity(RepairProductDTO repairProductDTO);
}
