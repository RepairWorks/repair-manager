package com.repairworks.repair_manager.repository;

import com.repairworks.repair_manager.model.Invoice;
import org.springframework.data.jpa.repository.JpaRepository;

public interface InvoiceRepository extends JpaRepository<Invoice, Long> {}
