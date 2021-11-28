package io.vliet.mjsbackend.domain

import javax.persistence.*

@Entity
@Table(name = "variable")
class Variable(
    @Id @GeneratedValue(strategy = GenerationType.AUTO)
    val id: Long = 0,
    val name: String? = null,
    val unit: String? = null
)
