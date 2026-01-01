package com.targa.labs.infrastructure.adapters.output.crud;

import com.targa.labs.infrastructure.adapters.output.entities.Payment;
import com.targa.labs.infrastructure.adapters.output.entities.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.math.BigDecimal;
import java.util.List;
import java.util.UUID;

public interface IProductRepository extends JpaRepository<Product, UUID> {
    List<Product> findByCategoryId(UUID CategoryId);
    Long countAllByCategoryId(UUID categoryId);

    @Query("SELECT p FROM Product p JOIN p.reviews r WHERE r.id >= ?1")
    Product findProductByReviewId(UUID reviewId);

    void deleteAllByCategoryId(UUID categoryId);

    List<Product> findAllByCategoryId(UUID categoryId);
}
