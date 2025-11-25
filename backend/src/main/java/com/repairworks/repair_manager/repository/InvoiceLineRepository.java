package com.repairworks.repair_manager.repository;

import com.repairworks.repair_manager.model.InvoiceLine;
import org.springframework.data.jpa.repository.JpaRepository;

public interface InvoiceLineRepository extends JpaRepository<InvoiceLine, Long> {}
