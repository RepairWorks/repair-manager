package com.repairworks.repair_manager.repository;

import com.repairworks.repair_manager.model.Service;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ServiceRepository extends JpaRepository<Service, Long> {}
