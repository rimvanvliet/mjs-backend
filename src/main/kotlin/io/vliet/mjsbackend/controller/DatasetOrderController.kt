package io.vliet.mjsbackend.controller

import io.vliet.mjsbackend.service.DatasetOrderService
import org.slf4j.Logger
import org.slf4j.LoggerFactory
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.http.HttpStatus
import org.springframework.http.ResponseEntity
import org.springframework.web.bind.annotation.*
import javax.validation.Valid


@RestController
@RequestMapping("/datasetorder")

class DatasetOrderController {

    @Autowired
    lateinit var datasetOrderService: DatasetOrderService

    val logger: Logger = LoggerFactory.getLogger(this.javaClass.name)

    @PostMapping("")
    fun createNewDatasetOrder(@Valid @RequestBody datasetOrderRequest: DatasetOrderRequest): ResponseEntity<Any> {
        logger.info("Endpoint access: /datasetOrders (createNewDatasetOrder)")
        return datasetOrderService.processDatasetOrderRequest(datasetOrderRequest).fold(
            { ResponseEntity(it, HttpStatus.BAD_REQUEST) },
            { ResponseEntity(it, HttpStatus.OK)})
    }

    data class DatasetOrderRequest(
        val startDate: String?,
        val endDate: String?,
        val variables: List<String> = emptyList(),
        val devices: List<String> = emptyList(),
        val outputType: OutputType = OutputType.CSV,
    )

    enum class OutputType {
        JSON, CSV
    }

}

