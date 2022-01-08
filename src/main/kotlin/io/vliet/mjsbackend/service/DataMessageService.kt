package io.vliet.mjsbackend.service

import io.vliet.mjsbackend.domain.DataMessage
import io.vliet.mjsbackend.domain.Measurement
import io.vliet.mjsbackend.repository.DeviceRepository
import io.vliet.mjsbackend.repository.MeasurementRepository
import io.vliet.mjsbackend.repository.VariableRepository
import org.slf4j.Logger
import org.slf4j.LoggerFactory
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Service
import java.time.Instant


@Service
class DataMessageService {

    val logger: Logger = LoggerFactory.getLogger(this.javaClass.name)

    @Autowired
    lateinit var deviceRepository: DeviceRepository

    @Autowired
    lateinit var variableRepository: VariableRepository

    @Autowired
    lateinit var measurementRepository: MeasurementRepository

    fun parseAndStore(dataMessage: DataMessage) {
        val deviceOpt = deviceRepository.findByName(dataMessage.device)
        if (deviceOpt.isEmpty) {
            // TODO create new one?
            logger.error("Device ${dataMessage.device} not found")
            return
        }
        val device = deviceOpt.get()

        val timeStamp = if (dataMessage.timeStamp.isNullOrEmpty())
            Instant.now()
        else
            try {
                Instant.ofEpochMilli(dataMessage.timeStamp.toLong())
            } catch (e: Exception) {
                logger.error("Invalid time ${dataMessage.timeStamp}; now() used.")
                Instant.now()
            }
        dataMessage.dataPoints.forEach {
            val variableList = variableRepository.findByDeviceAndKey(device.id, it.variableKey.toInt())
            if (variableList.size == 0) {
                logger.error("Invalid variableKey ${it.variableKey} for device ${device.name}; now() used.")
                return@forEach
            }
            if (variableList.size > 1) {
                logger.warn("Multiple varibles found for variableKey ${it.variableKey} and device ${device.name}; ${variableList[0].uniqueName} used.")
            }
            // TODO add & check datatype of a variable
            measurementRepository.save(Measurement(
                value = it.value,
                dateTime = timeStamp
            ).with(
                device = device,
                variable = variableList[0]
            ))
        }
    }
}
