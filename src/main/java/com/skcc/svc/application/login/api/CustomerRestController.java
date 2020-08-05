package com.skcc.svc.application.login.api;

import com.skcc.svc.application.login.service.CustomerService;
import com.skcc.svc.application.login.vo.CustomerResponseDTO;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/rest/login")
@RequiredArgsConstructor
public class CustomerRestController {
    @Autowired
    CustomerService customerService;

    @GetMapping("/all")
    public List<Object> getAllInfo(){
        return customerService.getAllData();
    }
}
