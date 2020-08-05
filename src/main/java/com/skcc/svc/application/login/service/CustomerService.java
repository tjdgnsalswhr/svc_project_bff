package com.skcc.svc.application.login.service;

import com.skcc.svc.application.login.client.CustomerClient;
import com.skcc.svc.application.login.vo.CustomerResponseDTO;
import com.skcc.svc.common.vo.ResponseDto;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Slf4j
public class CustomerService {
    @Autowired
    private CustomerClient customerClient;

    public List<Object> getAllData(){
        ResponseEntity<ResponseDto<CustomerResponseDTO>> responseDtoResponseEntity = null;
        log.info(customerClient.getAllStore().getBody().toString());
        if(customerClient.getAllStore().getStatusCode().is2xxSuccessful()){
            return (List<Object>) customerClient.getAllStore().getBody();
        }else{
            return null;
        }

    }
}
