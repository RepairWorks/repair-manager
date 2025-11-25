package com.repairworks.repair_manager.mapper;

import com.repairworks.repair_manager.dto.DeviceDTO;
import com.repairworks.repair_manager.model.Device;
import org.mapstruct.Mapper;

@Mapper(componentModel = "spring")
public interface DeviceMapper {
    DeviceDTO toDTO(Device device);
    Device toEntity(DeviceDTO deviceDTO);
}
