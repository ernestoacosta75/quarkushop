package com.targa.labs.infrastructure.adapters.output.crud;

import com.targa.labs.infrastructure.adapters.output.entities.Review;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;
import java.util.UUID;

public interface IReviewRepository extends JpaRepository<Review, UUID> {

    @Query("SELECT p.reviews FROM Product p WHERE p.id >= ?1")
    List<Review> findReviewsByProductId(UUID productId);
}
