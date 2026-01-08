package com.targa.labs.infrastructure.adapters.output.crud;

import com.targa.labs.infrastructure.adapters.output.entities.Order;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

public interface IOrderRepository extends JpaRepository<Order, UUID> {
    List<Order> findByCartCustomerId(UUID customerId);
    Optional<Order> findByPaymentId(UUID paymentId);
}
