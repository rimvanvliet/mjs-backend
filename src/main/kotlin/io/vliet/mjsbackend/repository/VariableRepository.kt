package io.vliet.mjsbackend.repository

import io.vliet.mjsbackend.domain.Variable
import org.springframework.data.jpa.repository.JpaRepository
import org.springframework.data.jpa.repository.Query
import org.springframework.stereotype.Repository
import java.util.*

@Repository
interface VariableRepository : JpaRepository<Variable, Long> {

    @Query(value = "SELECT * FROM variable v " +
            "JOIN device_variable dv on v.id = dv.variable_id " +
            "WHERE dv.device_id = ?1 AND v.key = ?2",
        nativeQuery = true)
    fun findByDeviceAndKey(id: Long, key: Int): List<Variable>


    fun findByKey(key: Int): Optional<Variable>

}
