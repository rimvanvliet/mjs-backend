package io.vliet.mjsbackend.domain

import com.fasterxml.jackson.annotation.JsonFormat
import java.time.Instant
import javax.persistence.*

@Entity
@Table(name = "measurement")
class Measurement(
    @Id @GeneratedValue(strategy = GenerationType.AUTO)
    val id: Long = 0,

    @JsonFormat(pattern = "yyyy-MM-dd'T'HH:mm:ssZ", timezone = "Europe/Amsterdam")
    val dateTime: Instant,
    val value: String,
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
}
