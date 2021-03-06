package io.vliet.mjsbackend.controller

import io.vliet.mjsbackend.domain.Variable
import io.vliet.mjsbackend.repository.VariableRepository
import org.slf4j.Logger
import org.slf4j.LoggerFactory
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.http.ResponseEntity
import org.springframework.web.bind.annotation.*
import javax.validation.Valid


@RestController
@RequestMapping("/variable")

class VariableController {
    @Autowired
    lateinit var variableRepository: VariableRepository

    val logger: Logger = LoggerFactory.getLogger(this.javaClass.name)

    @GetMapping("")
    fun getAllVariable(
    ): ResponseEntity<Any> {
        logger.info("Endpoint access: /variable (getAllVariable)")
            return ResponseEntity.ok(variableRepository.findAll())
    }

    @GetMapping("/{id}")
    fun getVariableById(@PathVariable(value = "id") variableId: Long): ResponseEntity<Variable> {
        return variableRepository.findById(variableId).map { variable ->
            ResponseEntity.ok(variable)
        }.orElseGet { ResponseEntity.notFound().build() }
    }
}

