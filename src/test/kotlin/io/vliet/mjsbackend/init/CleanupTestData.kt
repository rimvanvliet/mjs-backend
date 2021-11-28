//package io.vliet.mjsbackend.init
//
//import io.vliet.mjsbackend.repository.ArbeidRepository
//import org.springframework.beans.factory.annotation.Autowired
//import org.springframework.stereotype.Component
//import org.springframework.test.annotation.Rollback
//import org.springframework.transaction.annotation.Transactional
//
//@Component
//class CleanupTestData {
//
//  @Autowired
//  lateinit var arbeidRepository: ArbeidRepository
//
//  @Transactional
//  @Rollback(false)
//  fun cleanupTestData() {
//    arbeidRepository.deleteAll()
//
//  }
//}
