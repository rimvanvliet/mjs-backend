package io.vliet.mjsbackend.repository

import io.vliet.mjsbackend.domain.Device
import org.springframework.data.jpa.repository.JpaRepository
import org.springframework.stereotype.Repository

@Repository
interface DeviceRepository : JpaRepository<Device, Long>
