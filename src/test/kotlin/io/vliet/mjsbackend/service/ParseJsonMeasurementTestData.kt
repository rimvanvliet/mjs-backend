//package io.vliet.mjsbackend.service
//
//import com.fasterxml.jackson.databind.ObjectMapper
//import io.vliet.mjsbackend.domain.Variable
//import io.vliet.mjsbackend.repository.DeviceRepository
//import io.vliet.mjsbackend.repository.VariableRepository
//import org.junit.Test
//import org.junit.runner.RunWith
//import org.springframework.beans.factory.annotation.Autowired
//import org.springframework.boot.test.context.SpringBootTest
//import org.springframework.test.context.junit4.SpringRunner
//import kotlin.random.Random
//
//@RunWith(SpringRunner::class)
//@SpringBootTest
//class ParseJsonMeasurementTestData {
//
//    @Autowired
//    lateinit var dataMessageService: DataMessageService
//
//    @Autowired
//    lateinit var variableRepository: VariableRepository
//
//    @Autowired
//    lateinit var deviceRepository: DeviceRepository
//
//    @Test
//    fun givenTheJsonNode_whenRetrievingDataFromId_thenCorrect() {
//        val jsonString = """{"k1":"v1","k2":"v2"}"""
//        val actualObj = ObjectMapper().readTree(jsonString);
//
//    }
//
//    @Test
//    fun fetchVariavble() {
//
//        val deviceOpt = deviceRepository.findByName("47")
//        val variableOpt: List<Variable> = variableRepository.findByDeviceAndKey(deviceOpt.get().id, 2)
//        variableOpt.forEach { println(it.uniqueName) }
//
//
//    }
//
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
