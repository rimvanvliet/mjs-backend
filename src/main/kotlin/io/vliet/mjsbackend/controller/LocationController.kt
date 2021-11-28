package io.vliet.mjsbackend.controller

import io.vliet.mjsbackend.domain.Location
import io.vliet.mjsbackend.repository.LocationRepository
import org.slf4j.Logger
import org.slf4j.LoggerFactory
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.http.ResponseEntity
import org.springframework.web.bind.annotation.*
import javax.validation.Valid


@RestController
@RequestMapping("/location")

class LocationController {
    @Autowired
    lateinit var locationRepository: LocationRepository

    val logger: Logger = LoggerFactory.getLogger(this.javaClass.name)

    @GetMapping("")
    fun getAllLocation(
    ): ResponseEntity<Any> {
        logger.info("Endpoint access: /location (getAllLocation)")
            return ResponseEntity.ok(locationRepository.findAll())
    }

    @PostMapping("")
    fun createNewLocation(@Valid @RequestBody locationList: List<Location>): List<Location> =
        locationRepository.saveAll(locationList)

    @GetMapping("/{id}")
    fun getLocationById(@PathVariable(value = "id") locationId: Long): ResponseEntity<Location> {
        return locationRepository.findById(locationId).map { location ->
            ResponseEntity.ok(location)
        }.orElseGet({ ResponseEntity.notFound().build() })
    }

    @DeleteMapping("/{id}")
    fun deleteLocationById(@PathVariable(value = "id") locationId: Long): ResponseEntity<String> {
        return locationRepository.findById(locationId).map { location ->
            locationRepository.deleteById(locationId)
            ResponseEntity.ok("Location verwijderd")
        }.orElseGet({ ResponseEntity.notFound().build() })
    }
}

