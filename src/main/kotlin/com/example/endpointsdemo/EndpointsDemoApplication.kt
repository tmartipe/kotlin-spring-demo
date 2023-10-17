package com.example.endpointsdemo

import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication
import org.springframework.context.annotation.Profile

@SpringBootApplication
@Profile("!docker-compose")
class EndpointsDemoApplication

fun main(args: Array<String>) {
    runApplication<EndpointsDemoApplication>(*args)
}
