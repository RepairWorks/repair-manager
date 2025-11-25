package com.repairworks.repair_manager.mapper;

import com.repairworks.repair_manager.dto.CustomerDTO;
import com.repairworks.repair_manager.model.Customer;
import org.mapstruct.Mapper;

@Mapper(componentModel = "spring")
public interface CustomerMapper {
    CustomerDTO toDTO(Customer customer);
    Customer toEntity(CustomerDTO customerDTO);
}
