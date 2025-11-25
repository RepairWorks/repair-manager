package com.repairworks.repair_manager.mapper;

import com.repairworks.repair_manager.dto.InvoiceDTO;
import com.repairworks.repair_manager.model.Invoice;
import org.mapstruct.Mapper;

@Mapper(componentModel = "spring")
public interface InvoiceMapper {
    InvoiceDTO toDTO(Invoice invoice);
    Invoice toEntity(InvoiceDTO invoiceDTO);
}
