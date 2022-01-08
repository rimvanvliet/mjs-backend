package io.vliet.mjsbackend.messages

import io.vliet.mjsbackend.domain.Device
import io.vliet.mjsbackend.domain.Variable
import java.time.Instant

data class DatasetOrder(
    val startDate: Instant? = null,
    val endDate: Instant? = null,
    val variables: List<Variable>,
    val devices: List<Device>
)

