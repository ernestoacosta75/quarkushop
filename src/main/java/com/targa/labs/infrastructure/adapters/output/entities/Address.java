package com.targa.labs.infrastructure.adapters.output.entities;

import jakarta.persistence.Column;
import jakarta.persistence.Embeddable;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.*;

@Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
@Embeddable
@EqualsAndHashCode
public class Address {

    @Column(name = "address_1")
    private String address1;

    @Column(name = "address_2")
    private String address2;

    @Column(name = "city")
    private String city;

    @NotNull
    @Size(max = 10)
    @Column(name = "postcode", nullable = false, length = 10)
    private String postCode;

    @NotNull
    @Size(max = 2)
    @Column(name = "country", nullable = false, length = 2)
    private String country;
}
