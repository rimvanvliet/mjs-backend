package io.vliet.mjsbackend.domain

import org.hibernate.annotations.Fetch
import org.hibernate.annotations.FetchMode
import javax.persistence.*

@Entity
@Table(name = "variable_meta_data")
class VariableMetaData(
    @Id @GeneratedValue(strategy = GenerationType.AUTO)
    val id: Long = 0,
    val key: String,
    val value: String
){
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "variable_id")
    lateinit var variable: Variable
}
