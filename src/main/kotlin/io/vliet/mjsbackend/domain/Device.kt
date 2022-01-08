package io.vliet.mjsbackend.domain

import org.hibernate.annotations.Fetch
import org.hibernate.annotations.FetchMode
import javax.persistence.*

@Entity
@Table(name = "device")
class Device(
    @Id @GeneratedValue(strategy = GenerationType.AUTO)
    val id: Long = 0,
    @Column(unique = true)
    val name: String? = null,
){
    @Fetch(FetchMode.SUBSELECT)
    @OneToMany(mappedBy = "device", cascade = [CascadeType.ALL], fetch = FetchType.EAGER)
    var variables: List<DeviceVariabele> = mutableListOf()
}
