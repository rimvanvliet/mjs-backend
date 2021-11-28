package io.vliet.mjsbackend.controller

import io.vliet.mjsbackend.domain.DeviceType
import io.vliet.mjsbackend.repository.DeviceTypeRepository
import org.slf4j.Logger
import org.slf4j.LoggerFactory
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.http.ResponseEntity
import org.springframework.web.bind.annotation.*
import javax.validation.Valid


@RestController
@RequestMapping("/deviceType")

class DeviceTypeController {
    @Autowired
    lateinit var deviceTypeRepository: DeviceTypeRepository

    val logger: Logger = LoggerFactory.getLogger(this.javaClass.name)

    @GetMapping("")
    fun getAllDeviceType(
    ): ResponseEntity<Any> {
        logger.info("Endpoint access: /deviceType (getAllDeviceType)")
            return ResponseEntity.ok(deviceTypeRepository.findAll())
    }

    @PostMapping("")
    fun createNewDeviceType(@Valid @RequestBody deviceTypeList: List<DeviceType>): List<DeviceType> =
        deviceTypeRepository.saveAll(deviceTypeList)

    @GetMapping("/{id}")
    fun getDeviceTypeById(@PathVariable(value = "id") deviceTypeId: Long): ResponseEntity<DeviceType> {
        return deviceTypeRepository.findById(deviceTypeId).map { deviceType ->
            ResponseEntity.ok(deviceType)
        }.orElseGet({ ResponseEntity.notFound().build() })
    }

    @DeleteMapping("/{id}")
    fun deleteDeviceTypeById(@PathVariable(value = "id") deviceTypeId: Long): ResponseEntity<String> {
        return deviceTypeRepository.findById(deviceTypeId).map { deviceType ->
            deviceTypeRepository.deleteById(deviceTypeId)
            ResponseEntity.ok("DeviceType verwijderd")
        }.orElseGet({ ResponseEntity.notFound().build() })
    }
}

