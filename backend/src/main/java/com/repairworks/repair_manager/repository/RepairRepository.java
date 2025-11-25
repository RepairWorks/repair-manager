package com.repairworks.repair_manager.repository;

import com.repairworks.repair_manager.model.Repair;
import org.springframework.data.jpa.repository.JpaRepository;

public interface RepairRepository extends JpaRepository<Repair, Long> {}
