package com.repairworks.repair_manager.service;


import com.repairworks.repair_manager.dto.CustomerDTO;
import com.repairworks.repair_manager.mapper.CustomerMapper;
import com.repairworks.repair_manager.repository.CustomerRepository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class CustomerService {
    private final CustomerRepository customerRepository;
    private final CustomerMapper mapper;

    public CustomerService(CustomerRepository customerRepository, CustomerMapper mapper) {
        this.customerRepository = customerRepository;
        this.mapper = mapper;
    }

    public List<CustomerDTO> findAll(){
        return customerRepository
                .findAll()
                .stream()
                .map(mapper::toDTO)
                .collect(Collectors.toList());
    }

    public CustomerDTO create(CustomerDTO dto){
        return mapper
                .toDTO(customerRepository.save(mapper.toEntity(dto)));
    }
}
