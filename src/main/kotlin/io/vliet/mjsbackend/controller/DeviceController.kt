package io.vliet.mjsbackend.controller

import io.vliet.mjsbackend.domain.Device
import io.vliet.mjsbackend.repository.DeviceRepository
import org.slf4j.Logger
import org.slf4j.LoggerFactory
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.http.ResponseEntity
import org.springframework.web.bind.annotation.*
import javax.validation.Valid


@RestController
@RequestMapping("/device")

class DeviceController {
    @Autowired
    lateinit var deviceRepository: DeviceRepository

    val logger: Logger = LoggerFactory.getLogger(this.javaClass.name)

    @GetMapping("")
    fun getAllDevice(
    ): ResponseEntity<Any> {
        logger.info("Endpoint access: /device (getAllDevice)")
            return ResponseEntity.ok(deviceRepository.findAll())
    }

    @PostMapping("")
    fun createNewDevice(@Valid @RequestBody deviceList: List<Device>): List<Device> =
        deviceRepository.saveAll(deviceList)

    @GetMapping("/{id}")
    fun getDeviceById(@PathVariable(value = "id") deviceId: Long): ResponseEntity<Device> {
        return deviceRepository.findById(deviceId).map { device ->
            ResponseEntity.ok(device)
        }.orElseGet({ ResponseEntity.notFound().build() })
    }

    @DeleteMapping("/{id}")
    fun deleteDeviceById(@PathVariable(value = "id") deviceId: Long): ResponseEntity<String> {
        return deviceRepository.findById(deviceId).map { device ->
            deviceRepository.deleteById(deviceId)
            ResponseEntity.ok("Device verwijderd")
        }.orElseGet({ ResponseEntity.notFound().build() })
    }
}

