package io.vliet.mjsbackend.domain

import org.hibernate.annotations.Fetch
import org.hibernate.annotations.FetchMode
import javax.persistence.*

@Entity
@Table(name = "device_meta_data")
class DeviceMetaData(
    @Id @GeneratedValue(strategy = GenerationType.AUTO)
    val id: Long = 0,
    val key: String,
    val value: String
){
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "device_id")
    lateinit var device: Device
}
