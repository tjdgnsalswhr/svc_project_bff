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

    public List<Object> getAllCustomerData(){
        ResponseEntity<ResponseDto<CustomerResponseDTO>> responseDtoResponseEntity = null;
        log.info(customerClient.getAllCustomer().getBody().toString());
        if(customerClient.getAllCustomer().getStatusCode().is2xxSuccessful()){
            return (List<Object>) customerClient.getAllCustomer().getBody();
        }else{
            return null;
        }
    }
    /*
    public Object getOneCustomer(String cid)
    {
    	ResponseEntity<CustomerResponseDTO> customerResponseDTO = null;
    	//if(customerClient.)
    	
    }
    */
    
}
