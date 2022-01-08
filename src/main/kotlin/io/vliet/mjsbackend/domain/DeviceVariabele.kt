package io.vliet.mjsbackend.domain

import com.fasterxml.jackson.annotation.JsonIgnore
import javax.persistence.*

@Entity
@Table(name = "device_variable")
class DeviceVariabele(
    @Id @GeneratedValue(strategy = GenerationType.AUTO)
    val id: Long = 0,
) {
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "device_id")
    lateinit var device: Device

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "variable_id")
    lateinit var variable: Variable
}
