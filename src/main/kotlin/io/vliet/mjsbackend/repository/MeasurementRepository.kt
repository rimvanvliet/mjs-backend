package io.vliet.mjsbackend.repository

import io.vliet.mjsbackend.domain.Measurement
import org.springframework.data.jpa.repository.JpaRepository
import org.springframework.stereotype.Repository

@Repository
interface MeasurementRepository : JpaRepository<Measurement, Long>
