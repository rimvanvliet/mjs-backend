package io.vliet.mjsbackend.service

import arrow.core.Either
import io.vliet.mjsbackend.controller.DatasetOrderController
import io.vliet.mjsbackend.domain.DatasetOrder
import io.vliet.mjsbackend.repository.DeviceTypeRepository
import io.vliet.mjsbackend.repository.LocationRepository
import io.vliet.mjsbackend.repository.MeasurementDao
import io.vliet.mjsbackend.repository.VariableRepository
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Service
import java.time.LocalDate
import java.time.ZoneId

@Service
class DatasetOrderService {
    @Autowired
    lateinit var deviceTypeRepository: DeviceTypeRepository

    @Autowired
    lateinit var variableRepository: VariableRepository

    @Autowired
    lateinit var locationRepository: LocationRepository

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
            return Either.left("Invalid startDate ${datasetOrderRequest.startDate}: ${e.message}")
        } else null

        val endDate = if (datasetOrderRequest.endDate != null) try {
            LocalDate.parse(datasetOrderRequest.endDate)
                .atTime(23, 59, 59, 999999)
                .atZone(ZoneId.of("Europe/Amsterdam"))
                .toInstant()
        } catch (e: Exception) {
            return Either.left("Invalid endDate ${datasetOrderRequest.endDate}: ${e.message}")
        } else null

        val variables = variableRepository.findAll().filter {
            it.name in datasetOrderRequest.variables
        }
        if (!variables.map { it.name }.containsAll(datasetOrderRequest.variables)) {
            return Either.left("Invalid variable ${datasetOrderRequest.variables.subtract(variables.map { it.name }.toSet())}")
        }
        val locations = locationRepository.findAll().filter {
            it.name in datasetOrderRequest.locations
        }
        if (!locations.map { it.name }.containsAll(datasetOrderRequest.locations)) {
            return Either.left("Invalid location ${datasetOrderRequest.locations.subtract(locations.map { it.name }.toSet())}")
        }
        val deviceTypes = deviceTypeRepository.findAll().filter {
            it.name in datasetOrderRequest.deviceTypes
        }
        if (!deviceTypes.map { it.name }.containsAll(datasetOrderRequest.deviceTypes)) {
            return Either.left("Invalid deviceType ${datasetOrderRequest.deviceTypes.subtract(deviceTypes.map { it.name }.toSet())}")
        }

        val datasetOrder = DatasetOrder(
            startDate = startDate,
            endDate = endDate,
            variables = variables,
            locations = locations,
            deviceTypes = deviceTypes,
        )

        val measurements = measurementDao.fetchDatasetOrder(datasetOrder)

        return if (datasetOrderRequest.outputType == DatasetOrderController.OutputType.JSON)
            Either.right(measurements)
        else
            Either.right(measurementService.toCsv(measurements))
    }
}
