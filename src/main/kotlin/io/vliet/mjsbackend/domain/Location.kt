package io.vliet.mjsbackend.domain

import javax.persistence.*

@Entity
@Table(name = "location")
class Location(
    @Id @GeneratedValue(strategy = GenerationType.AUTO)
    val id: Long = 0,
    val name: String? = null,
)
