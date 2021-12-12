package io.vliet.mjsbackend.repository

import io.vliet.mjsbackend.domain.DeviceType
import org.springframework.data.jpa.repository.JpaRepository
import org.springframework.stereotype.Repository

@Repository
interface DeviceTypeRepository : JpaRepository<DeviceType, Long>
