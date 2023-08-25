package com.example.algamoney.api.resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LoginResource {
    @GetMapping("/login")
    String login() {
        return "login/login";
    }
}
