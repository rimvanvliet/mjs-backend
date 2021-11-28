package io.vliet.mjsbackend.repository

import io.vliet.mjsbackend.domain.Device
import io.vliet.mjsbackend.domain.DeviceType
import org.springframework.data.domain.Page
import org.springframework.data.domain.Pageable
import org.springframework.data.jpa.repository.JpaRepository
import org.springframework.data.jpa.repository.Query
import org.springframework.data.repository.query.Param
import org.springframework.stereotype.Repository
import java.util.*

@Repository
interface DeviceTypeRepository : JpaRepository<DeviceType, Long>