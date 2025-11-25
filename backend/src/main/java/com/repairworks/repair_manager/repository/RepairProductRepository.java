package com.repairworks.repair_manager.repository;

import com.repairworks.repair_manager.model.RepairProduct;
import org.springframework.data.jpa.repository.JpaRepository;

public interface RepairProductRepository extends JpaRepository<RepairProduct, Long> {}
