package com.redhat.sample.controller;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;


@RestController
public class IndexController {
    @Value("${message}")
	private String message;

    @GetMapping("/")
    public HashMap index() {
        return new HashMap<>() {{
            put("message", message);
        }};
    }
}