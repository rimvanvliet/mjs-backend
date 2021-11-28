package io.vliet.mjsbackend.init

import io.vliet.mjsbackend.domain.Measurement
import io.vliet.mjsbackend.domain.Variable
import io.vliet.mjsbackend.repository.*
import org.junit.Test
import org.junit.runner.RunWith
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.boot.test.context.SpringBootTest
import org.springframework.test.context.junit4.SpringRunner
import java.time.Instant
import kotlin.random.Random

@RunWith(SpringRunner::class)
@SpringBootTest
class InitializeTestData {
    @Autowired
    lateinit var deviceRepository: DeviceRepository

    @Autowired
    lateinit var deviceTypeRepository: DeviceTypeRepository

    @Autowired
    lateinit var locationRepository: LocationRepository

    @Autowired
    lateinit var measurementRepository: MeasurementRepository

    @Autowired
    lateinit var variableRepository: VariableRepository

    @Test
    fun initSourceImportServiceTestData() {
        val devices = deviceRepository.findAll()
        val variables = variableRepository.findAll()

        val variableValue = getRandomVariableValue(variables)
        measurementRepository.save(
            Measurement(
                dateTime = Instant.now(),
                value = variableValue.value,
            ).with(
                device = devices.random(),
                variable = variableValue.variable
            )
        )
    }

    fun getRandomVariableValue(variables: List<Variable>): VariableValue {
        val variable = variables.random()

        return when (variable.name) {
            "CO2" -> VariableValue(variable, (Random.nextInt(400, 950)).toString())
            "temperatuur" -> VariableValue(variable, (Random.nextInt(10, 26)).toString())
            "luchtvochtigheid" -> VariableValue(variable, (Random.nextInt(30, 90)).toString())
            else -> { // Note the block
                VariableValue(variable, (Random.nextInt(400, 950)).toString())
            }
        }
    }

    data class VariableValue(val variable: Variable, val value: String)
}
