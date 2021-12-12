package io.vliet.mjsbackend.controller

import io.vliet.mjsbackend.domain.Measurement
import io.vliet.mjsbackend.repository.MeasurementRepository
import org.slf4j.Logger
import org.slf4j.LoggerFactory
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.http.ResponseEntity
import org.springframework.web.bind.annotation.*
import javax.validation.Valid


@RestController
@RequestMapping("/measurement")

class MeasurementController {
    @Autowired
    lateinit var measurementRepository: MeasurementRepository

    val logger: Logger = LoggerFactory.getLogger(this.javaClass.name)

    @GetMapping("")
    fun getAllMeasurement(
    ): ResponseEntity<Any> {
        logger.info("Endpoint access: /measurement (getAllMeasurement)")
            return ResponseEntity.ok(measurementRepository.findAll())
    }

    @PostMapping("")
    fun createNewMeasurement(@Valid @RequestBody measurementList: List<Measurement>): List<Measurement> =
        measurementRepository.saveAll(measurementList)

    @GetMapping("/{id}")
    fun getMeasurementById(@PathVariable(value = "id") measurementId: Long): ResponseEntity<Measurement> {
        return measurementRepository.findById(measurementId).map { measurement ->
            ResponseEntity.ok(measurement)
        }.orElseGet { ResponseEntity.notFound().build() }
    }

    @DeleteMapping("/{id}")
    fun deleteMeasurementById(@PathVariable(value = "id") measurementId: Long): ResponseEntity<String> {
        return measurementRepository.findById(measurementId).map { measurement ->
            measurementRepository.deleteById(measurementId)
            ResponseEntity.ok("Measurement verwijderd")
        }.orElseGet { ResponseEntity.notFound().build() }
    }
}

