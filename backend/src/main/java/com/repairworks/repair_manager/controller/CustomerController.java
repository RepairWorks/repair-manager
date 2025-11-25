package com.repairworks.repair_manager.controller;

import com.repairworks.repair_manager.dto.CustomerDTO;
import com.repairworks.repair_manager.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/customers")
public class CustomerController {
    private final CustomerService customerService;

    @Autowired
    public CustomerController(CustomerService customerService) {
        this.customerService = customerService;
    }

    @GetMapping
    public List<CustomerDTO> findALL() {
        return customerService.findAll();
    }

    @PostMapping("/customerId")
    public CustomerDTO create(@RequestBody CustomerDTO customerDTO) {
        return customerService.create(customerDTO);
    }
}
