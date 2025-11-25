package com.repairworks.repair_manager.mapper;

import com.repairworks.repair_manager.dto.ServiceDTO;
import com.repairworks.repair_manager.model.Service;
import org.mapstruct.Mapper;

@Mapper(componentModel = "spring")
public interface ServiceMapper {
    ServiceDTO toDTO(Service service);
    Service toEntity(ServiceDTO serviceDTO);
}
