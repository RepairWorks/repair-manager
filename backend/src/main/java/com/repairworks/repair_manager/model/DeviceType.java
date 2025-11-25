package com.repairworks.repair_manager.model;

import java.time.LocalDateTime;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.CreationTimestamp;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity
@Table(name = "device_types")
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class DeviceType {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    @Column(name = "name")
    private String name;
   
    @OneToMany(mappedBy = "deviceType")
    private List<Device> devices;

    @CreationTimestamp
    @Column(name = "created_at")
    private LocalDateTime createdAt;
}
