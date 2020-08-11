package com.skcc.svc.application.login.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import com.skcc.svc.application.login.client.CustomerClient;
import com.skcc.svc.application.login.vo.CustomerResponseDTO;
import com.skcc.svc.common.vo.ResponseDto;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class CustomerService {
    @Autowired
    private CustomerClient customerClient;

    public List<CustomerResponseDTO> getAllCustomerData(){
        ResponseEntity<ResponseDto<CustomerResponseDTO>> responseDtoResponseEntity = null;
        log.info(customerClient.getAllCustomer().getBody().toString());
        if(customerClient.getAllCustomer().getStatusCode().is2xxSuccessful()){
            return (List<CustomerResponseDTO>) customerClient.getAllCustomer().getBody();
        }else{
            return null;
        }
    }
    
    public CustomerResponseDTO getOneCustomer(String cid)
    {
    	ResponseEntity<CustomerResponseDTO> customerResponseDTO = null;
    	log.info(customerClient.getOneCustomer(cid).getBody().toString());
        if(customerClient.getOneCustomer(cid).getStatusCode().is2xxSuccessful())
        {
            return (CustomerResponseDTO) customerClient.getOneCustomer(cid).getBody();
        }
        else
        	return null;
    }
    
}
