package io.vliet.mjsbackend.domain

import javax.persistence.*

@Entity
@Table(name = "device_type")
class DeviceType(
    @Id @GeneratedValue(strategy = GenerationType.AUTO)
    val id: Long = 0,
    val name: String? = null,
)
