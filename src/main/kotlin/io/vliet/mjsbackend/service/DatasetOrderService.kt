package io.vliet.mjsbackend.service

import arrow.core.Either
import io.vliet.mjsbackend.controller.DatasetOrderController
import io.vliet.mjsbackend.messages.DatasetOrder
import io.vliet.mjsbackend.repository.DeviceRepository
import io.vliet.mjsbackend.repository.MeasurementDao
import io.vliet.mjsbackend.repository.VariableRepository
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Service
import java.time.LocalDate
import java.time.ZoneId

@Service
class DatasetOrderService {
    @Autowired
    lateinit var deviceRepository: DeviceRepository

    @Autowired
    lateinit var variableRepository: VariableRepository

    @Autowired
    lateinit var measurementDao: MeasurementDao

    @Autowired
    lateinit var measurementService: MeasurementService

    fun processDatasetOrderRequest(datasetOrderRequest: DatasetOrderController.DatasetOrderRequest): Either<String, Any> {
        val startDate = if (datasetOrderRequest.startDate != null) try {
            LocalDate.parse(datasetOrderRequest.startDate)
                .atStartOfDay()
                .atZone(ZoneId.of("Europe/Amsterdam"))
                .toInstant()
        } catch (e: Exception) {
            return Either.Left("Invalid startDate ${datasetOrderRequest.startDate}: ${e.message}")
        } else null

        val endDate = if (datasetOrderRequest.endDate != null) try {
            LocalDate.parse(datasetOrderRequest.endDate)
                .atTime(23, 59, 59, 999999)
                .atZone(ZoneId.of("Europe/Amsterdam"))
                .toInstant()
        } catch (e: Exception) {
            return Either.Left("Invalid endDate ${datasetOrderRequest.endDate}: ${e.message}")
        } else null

        val variables = variableRepository.findAll().filter {
            it.substance in datasetOrderRequest.variables
        }
        if (!variables.map { it.substance }.containsAll(datasetOrderRequest.variables)) {
            return Either.Left("Invalid variable ${datasetOrderRequest.variables.subtract(variables.map { it.substance }.toSet())}")
        }
        val devices = deviceRepository.findAll().filter {
            it.name in datasetOrderRequest.devices
        }
        if (!devices.map { it.name }.containsAll(datasetOrderRequest.devices)) {
            return Either.Left("Invalid deviceType ${datasetOrderRequest.devices.subtract(devices.map { it.name }.toSet())}")
        }

        val datasetOrder = DatasetOrder(
            startDate = startDate,
            endDate = endDate,
            variables = variables,
            devices = devices,
        )

        val measurements = measurementDao.fetchDatasetOrder(datasetOrder)

        return if (datasetOrderRequest.outputType == DatasetOrderController.OutputType.JSON)
            Either.Right(measurements)
        else
            Either.Right(measurementService.toCsv(measurements))
    }
}
