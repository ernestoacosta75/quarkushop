package com.targa.labs.infrastructure.adapters.output.crud;

import com.targa.labs.infrastructure.adapters.output.entities.Payment;
import org.springframework.data.jpa.repository.JpaRepository;

import java.math.BigDecimal;
import java.util.List;
import java.util.UUID;

public interface IPaymentRepository extends JpaRepository<Payment, UUID> {
    List<Payment> findAllByAmountBetween(BigDecimal min, BigDecimal max);
}
