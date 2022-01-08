package io.vliet.mjsbackend.controller

import io.vliet.mjsbackend.domain.DataMessage
import io.vliet.mjsbackend.service.DataMessageService
import org.slf4j.Logger
import org.slf4j.LoggerFactory
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.web.bind.annotation.*
import javax.validation.Valid


@RestController
@RequestMapping("/datamessage")

class DataMessageController {
    @Autowired
    lateinit var dataMessageService: DataMessageService

    val logger: Logger = LoggerFactory.getLogger(this.javaClass.name)

    @PostMapping("")
    fun createNewDataPoints(@Valid @RequestBody dataMessage: DataMessage) =
        dataMessageService.parseAndStore(dataMessage)
}

