package com.targa.labs.infrastructure.adapters.output.entities;

import com.targa.labs.domain.PaymentStatus;
import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.math.BigDecimal;

@Getter
@NoArgsConstructor(force = true)
@ToString(callSuper = true)
@EqualsAndHashCode(callSuper = true)
@Entity
@Table(name = "payments")
public class Payment extends AbstractEntity {

    @Column(name = "paypal_payment_id")
    private String paypalPaymentId;

    @NotNull
    @Enumerated(EnumType.STRING)
    @Column(name = "status", nullable = false)
    private PaymentStatus paymentStatus;

    @NotNull
    @Column(name = "amount", nullable = false)
    private BigDecimal amount;

    public Payment(String paypalPaymentId, PaymentStatus paymentStatus, BigDecimal amount) {
        this.paypalPaymentId = paypalPaymentId;
        this.paymentStatus = paymentStatus;
        this.amount = amount;
    }
}
