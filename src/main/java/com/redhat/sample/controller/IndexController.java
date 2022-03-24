package com.redhat.sample.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;

/**
 * <pre>
 *     com.redhat.sample.controller.IndexController
 * </pre>
 *
 * @author Muhammad Edwin < edwin at redhat dot com >
 * 24 Mar 2022 13:26
 */
@RestController
public class IndexController {
    @GetMapping("/")
    public HashMap index() {
        return new HashMap<>() {{
            put("hello", "world");
        }};
    }
}