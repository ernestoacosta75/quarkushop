package com.targa.labs.infrastructure.adapters.output.crud;

import com.targa.labs.domain.CartStatus;
import com.targa.labs.infrastructure.adapters.output.entities.Cart;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
public interface ICartRepository extends JpaRepository<Cart, UUID> {
    List<Cart> findByStatus(CartStatus status);
    List<Cart> findByStatusAndCustomerId(CartStatus status, UUID customerId);
}
