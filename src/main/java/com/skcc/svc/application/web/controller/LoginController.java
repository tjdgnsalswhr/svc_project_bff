package com.skcc.svc.application.web.controller;

import com.skcc.svc.application.login.service.CustomerService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Slf4j
@Controller
@RequiredArgsConstructor
public class LoginController {

    private final CustomerService customerService;

    @GetMapping("/login/home")
    public ModelAndView loginPate(Model model){
        List<Object> customerList = customerService.getAllCustomerData();

        ModelAndView modelAndView = new ModelAndView("login/loginhome");
        modelAndView.addObject("custList", customerList);
        return modelAndView;
    }
}
