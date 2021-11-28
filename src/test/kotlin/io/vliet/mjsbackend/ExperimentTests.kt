//package io.vliet.mjsbackend
//
//import io.vliet.mjsbackend.domain.Device
//import io.vliet.mjsbackend.repository.DeviceRepository
//import io.vliet.mjsbackend.repository.KlantRepository
//import org.junit.Test
//import org.junit.runner.RunWith
//import org.springframework.beans.factory.annotation.Autowired
//import org.springframework.boot.test.context.SpringBootTest
//import org.springframework.data.domain.Page
//import org.springframework.data.domain.PageRequest
//import org.springframework.data.domain.Pageable
//import org.springframework.test.context.ActiveProfiles
//import org.springframework.test.context.junit4.SpringRunner
//
//
//@RunWith(SpringRunner::class)
//@SpringBootTest
//@ActiveProfiles(profiles = ["non-async"])
//class ExperimentTests {
//
//  @Autowired
//  lateinit var deviceRepository: DeviceRepository
//  @Autowired
//  lateinit var klantRepository: KlantRepository
//
////  @Test
//  fun getDeviceen() {
//
//    val pageable: Pageable = PageRequest.of(0, 10)
//    val klant = klantRepository.findById(2L).get()
//    val page: Page<Device> = deviceRepository.findAllByKlant(klant, pageable)
//
//    println(page.content.size)
//    page.content.forEach { println(it.merk) }
//
//
//  }
//}
