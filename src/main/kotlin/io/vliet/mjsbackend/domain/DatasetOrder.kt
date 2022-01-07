package io.vliet.mjsbackend.domain

import java.time.Instant

data class DatasetOrder(
    val startDate: Instant? = null,
    val endDate: Instant? = null,
    val variables: List<Variable>,
    val devices: List<Device>
)

