package com.repairworks.repair_manager.repository;

import com.repairworks.repair_manager.model.Device;
import org.springframework.data.jpa.repository.JpaRepository;

public interface DeviceRepository extends JpaRepository<Device, Long> {}
