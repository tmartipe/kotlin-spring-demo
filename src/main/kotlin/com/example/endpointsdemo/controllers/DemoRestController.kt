package com.example.endpointsdemo.controllers

import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RestController

@RestController
class DemoRestController {

    @GetMapping("/greeting")
    fun greeting() : String {
        return "Hola! Gracias por probar la demo! :)"
    }

}