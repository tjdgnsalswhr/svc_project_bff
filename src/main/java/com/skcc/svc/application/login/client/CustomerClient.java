package com.skcc.svc.application.login.client;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;

@FeignClient(name = "customer-api", url="${feign.customer-api.url}")
public interface CustomerClient {
	
    @GetMapping(value="/customer/info/all")
    public ResponseEntity<Object> getAllStore();
    
    @GetMapping(value="/customer/info/")
    public ResponseEntity<Object> getOneCustomer();
    
}
