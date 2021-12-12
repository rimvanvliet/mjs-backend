package io.vliet.mjsbackend.service

import io.vliet.mjsbackend.domain.Device
import io.vliet.mjsbackend.domain.Measurement
import org.springframework.stereotype.Service
import java.time.Instant
import java.time.ZoneId
import java.time.temporal.ChronoUnit


@Service
class MeasurementService {

    fun toCsv(measurements: List<Measurement>): String {

        val groupedMeasurementsByDateAndDevice = measurements.groupBy { it.toKey() }

        val orderedVariables = groupedMeasurementsByDateAndDevice
            .values
            .flatMap { ml -> ml.map { it.variable?.name } }
            .mapNotNull { it }
            .toSet()
            .sortedBy { it }
            .map { it.uppercase() }

        val csvRowHeader = listOf("DEVICE_ID", "DATE_TIME") + orderedVariables

        val csvRows = groupedMeasurementsByDateAndDevice.map {
            val tz = ZoneId.of("Europe/Amsterdam")
            val date = it.key.dateTime.truncatedTo(ChronoUnit.SECONDS).atZone(tz)
            return@map listOf(it.key.device?.name, date) +
                    collectOnIndex(
                        CollectableValues(orderedVariables,
                            it.value.sortedBy { msrmnt -> msrmnt.variable?.name },
                            emptyList()))
                        .accumulator
        }

        return csvRowHeader.joinToString("\", \"", "\"", "\"") + "\n" +
                csvRows.joinToString("\n") { it.joinToString("\", \"", "\"", "\"") }
    }

    fun collectOnIndex(collectableValues: CollectableValues): CollectableValues {
        if (collectableValues.orderedVariables.isEmpty())
            return CollectableValues(emptyList(), emptyList(), collectableValues.accumulator)
        else {
            return if (collectableValues.sortedMeasurements.isNotEmpty()
                && collectableValues.sortedMeasurements.first().variable?.name?.uppercase() == collectableValues.orderedVariables.first().uppercase())
                collectOnIndex(
                    CollectableValues(
                        collectableValues.orderedVariables.drop(1),
                        collectableValues.sortedMeasurements.drop(1),
                        collectableValues.accumulator + listOf(collectableValues.sortedMeasurements.first().value)
                    )
                )
            else
                collectOnIndex(
                    CollectableValues(
                        collectableValues.orderedVariables.drop(1),
                        collectableValues.sortedMeasurements,
                        collectableValues.accumulator + listOf("")
                    )
                )
        }
    }

    data class Key(val dateTime: Instant, val device: Device?)

    fun Measurement.toKey() = Key(this.dateTime, this.device)

    data class CollectableValues(
        val orderedVariables: List<String>,
        val sortedMeasurements: List<Measurement>,
        val accumulator: List<String>
    )
}
