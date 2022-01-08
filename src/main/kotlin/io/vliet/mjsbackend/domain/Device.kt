package io.vliet.mjsbackend.domain

import com.fasterxml.jackson.annotation.JsonIgnore
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
    @JsonIgnore
    @Fetch(FetchMode.SUBSELECT)
    @OneToMany(mappedBy = "device", cascade = [CascadeType.ALL])
    var variables: Set<DeviceVariabele> = mutableSetOf()
}
