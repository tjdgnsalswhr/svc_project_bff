package com.skcc.svc.application.web.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.skcc.svc.application.login.service.CustomerService;
import com.skcc.svc.application.login.vo.CustomerResponseDTO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
public class LoginController {

    private final CustomerService customerService;

    @GetMapping("/login/home")
    public ModelAndView loginPate(Model model){
        List<CustomerResponseDTO> customerList = customerService.getAllCustomerData();

        ModelAndView modelAndView = new ModelAndView("login/loginhome");
        modelAndView.addObject("custList", customerList);
        return modelAndView;
    }
}
