package com.example.spring_boot_api.repository;

import com.example.spring_boot_api.entity.Customer;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CustomerRepository extends JpaRepository<Customer, Long> {
    // You can add custom query methods here if needed
}
