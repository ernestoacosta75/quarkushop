package com.targa.labs.infrastructure.adapters.output.crud;

import com.targa.labs.infrastructure.adapters.output.entities.Customer;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.UUID;

public interface ICustomerRepository extends JpaRepository<Customer, UUID> {
    List<Customer> findAllByEnabled(Boolean enabled);
}
