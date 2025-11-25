package com.repairworks.repair_manager.mapper;

import com.repairworks.repair_manager.dto.ProductDTO;
import com.repairworks.repair_manager.model.Product;
import org.mapstruct.Mapper;

@Mapper(componentModel = "spring")
public interface ProductMapper {
    ProductDTO toDTO(Product product);
    Product toProduct(ProductDTO productDTO);
}
