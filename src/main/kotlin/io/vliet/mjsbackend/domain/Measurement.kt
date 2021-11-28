package io.vliet.mjsbackend.domain

import java.time.Instant
import javax.persistence.*

@Entity
@Table(name = "measurement")
class Measurement(
    @Id @GeneratedValue(strategy = GenerationType.AUTO)
    val id: Long = 0,
    val dateTime: Instant? = null,
    val value: String? = null,
) {
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "device_id")
    var device: Device? = null

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "variable_id")
    var variable: Variable? = null

    fun with(
        device: Device? = this.device,
        variable: Variable? = this.variable,
    ): Measurement {
        this.device = device
        this.variable = variable
        return this
    }

    fun fullCopy(
        id: Long = this.id,
        dateTime: Instant? = this.dateTime,
        value: String? = this.value,
        device: Device? = this.device,
        variable: Variable? = this.variable
    ) =
        Measurement(id, dateTime, value).with(device, variable)
}
