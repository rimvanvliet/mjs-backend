package io.vliet.mjsbackend.repository

import io.vliet.mjsbackend.domain.Variable
import org.springframework.data.jpa.repository.JpaRepository
import org.springframework.stereotype.Repository

@Repository
interface VariableRepository : JpaRepository<Variable, Long>
