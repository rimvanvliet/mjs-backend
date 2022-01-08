//package io.vliet.mjsbackend.init
//
//import io.vliet.mjsbackend.domain.Measurement
//import io.vliet.mjsbackend.domain.Variable
//import io.vliet.mjsbackend.repository.*
//import org.junit.Test
//import org.junit.runner.RunWith
//import org.springframework.beans.factory.annotation.Autowired
//import org.springframework.boot.test.context.SpringBootTest
//import org.springframework.test.context.junit4.SpringRunner
//import java.time.Instant
//import java.time.temporal.ChronoUnit
//import kotlin.random.Random
//
//@RunWith(SpringRunner::class)
//@SpringBootTest
//class GenerateMeasurementTestData {
//    @Autowired
//    lateinit var deviceRepository: DeviceRepository
//
//    @Autowired
//    lateinit var measurementRepository: MeasurementRepository
//
//    @Autowired
//    lateinit var variableRepository: VariableRepository
//
//    @Test
//    fun generateMeasurementTestData() {
//        val devices = deviceRepository.findAll()
//        val variables = variableRepository.findAll()
//        val initTime = Instant.now()
//
//        for (i in 1..5) {
//            val dateTime = initTime
//                .plus(i * 15L, ChronoUnit.MINUTES)
//                .plus(i * 7L, ChronoUnit.SECONDS)
//            for (device in devices) {
//                for (variable in variables) {
//                    val variableValue = getRandomVariableValue(variable)
//                    measurementRepository.save(
//                        Measurement(
//                            dateTime = dateTime,
//                            value = variableValue.value,
//                        ).with(
//                            device = device,
//                            variable = variableValue.variable
//                        )
//                    )
//                }
//            }
//        }
//    }
//
//    fun getRandomVariableValue(variable: Variable): VariableValue {
//
//        return when (variable.substance) {
//            "CO2" -> VariableValue(variable, (Random.nextInt(400, 950)).toString())
//            "temperature" -> VariableValue(variable, (Random.nextInt(10, 26)).toString())
//            "relative humidity" -> VariableValue(variable, (Random.nextInt(30, 90)).toString())
//            "PM2.5" -> VariableValue(variable, (Random.nextInt(7, 20)).toString())
//            "PM10" -> VariableValue(variable, (Random.nextInt(10, 40)).toString())
//            else -> {
//                VariableValue(variable, "ERROR")
//            }
//        }
//    }
//
//    data class VariableValue(val variable: Variable, val value: String)
//}
