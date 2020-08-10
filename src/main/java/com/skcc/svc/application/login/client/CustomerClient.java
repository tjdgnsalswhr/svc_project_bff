package com.skcc.svc.application.login.client;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.skcc.svc.application.login.vo.CustomerResponseDTO;

@FeignClient(name = "customer-api", url="${feign.customer-api.url}")
public interface CustomerClient {
	
    @GetMapping(value="/customer/info/all")
    public ResponseEntity<Object> getAllCustomer();
    
    @GetMapping(value="/customer/info/{cid}")
    public ResponseEntity<CustomerResponseDTO> getOneCustomer(@PathVariable String cid);
    
}
