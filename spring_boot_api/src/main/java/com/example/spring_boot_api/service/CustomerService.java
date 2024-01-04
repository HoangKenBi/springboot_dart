package com.example.spring_boot_api.service;

import com.example.spring_boot_api.entity.Customer;

import java.util.List;

public interface CustomerService {
    Customer addCustomer(Customer customer);
    List<Customer> getAllCustomers();
}
