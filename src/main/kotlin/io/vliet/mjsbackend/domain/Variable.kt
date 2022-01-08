package io.vliet.mjsbackend.domain

import org.hibernate.annotations.Fetch
import org.hibernate.annotations.FetchMode
import javax.persistence.*

@Entity
@Table(name = "variable")
class Variable(
    @Id @GeneratedValue(strategy = GenerationType.AUTO)
    val id: Long = 0,
    @Column(unique = true)
    val reuseName: String? = null,
    val key: Int, // must be unique in the context of 1 device
    val substance: String? = null, // TODO betere naam: wat wordt er gemeten, CO2, PM2.5, etc
    val unit: String? = null
){
    @Fetch(FetchMode.SUBSELECT)
    @OneToMany(mappedBy = "variable", cascade = [CascadeType.ALL], fetch = FetchType.LAZY)
    var devices: Set<DeviceVariabele> = mutableSetOf()

}

