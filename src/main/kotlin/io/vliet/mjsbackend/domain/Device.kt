package io.vliet.mjsbackend.domain

import javax.persistence.*

@Entity
@Table(name = "device")
class Device(
    @Id @GeneratedValue(strategy = GenerationType.AUTO)
    val id: Long = 0,
    val name: String? = null,
) {
    companion object {
        val sortableFields = listOf("name")
    }

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "device_type_id")
    var deviceType: DeviceType? = null

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "location_id")
    var location: Location? = null

    fun with(
        deviceType: DeviceType? = this.deviceType,
    ): Device {
        this.deviceType = deviceType
        return this
    }

    fun fullCopy(
        id: Long = this.id,
        name: String? = this.name,
        deviceType: DeviceType? = this.deviceType
    ) =
        Device(id, name).with(deviceType)
}
