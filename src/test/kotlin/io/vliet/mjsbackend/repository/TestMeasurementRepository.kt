package io.vliet.mjsbackend.repository

import io.vliet.mjsbackend.domain.DatasetOrder
import org.junit.Test
import org.junit.runner.RunWith
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.boot.test.context.SpringBootTest
import org.springframework.test.context.junit4.SpringRunner
import java.time.Instant

@RunWith(SpringRunner::class)
@SpringBootTest
class TestMeasurementRepository {
    @Autowired
    lateinit var deviceTypeRepository: DeviceTypeRepository

    @Autowired
    lateinit var locationRepository: LocationRepository

    @Autowired
    lateinit var measurementDao: MeasurementDao

//    @Autowired
//    lateinit var variableRepository: VariableRepository

    @Test
    fun initSourceImportServiceTestData() {
        val deviceTypes = deviceTypeRepository.findAll()
//        val variables = variableRepository.findAll()
        val locations = locationRepository.findAll()//findById(2L)

        val datasetOrder = DatasetOrder(
            startDate = Instant.parse("2021-11-27T21:03:47.595761Z"),
            deviceTypes = deviceTypes,
            variables = emptyList(),//variables,
            locations = locations
        )

        measurementDao.fetchDatasetOrder(datasetOrder)
            .forEach {
                println("Measurement: ${it.value}${it.variable?.unit} ${it.variable?.name} at ${it.dateTime} on device ${it.device?.name} (type: ${it.device?.deviceType?.name}) in ${it.device?.location?.name}")
            }

    }
}
