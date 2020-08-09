package com.skcc.svc.application.login.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import com.skcc.svc.application.login.client.StoreClient;
import com.skcc.svc.application.login.vo.StoreResponseDTO;
import com.skcc.svc.common.vo.ResponseDto;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class StoreInfoService {
    @Autowired
    private StoreClient storeClient;
    
    /*
    public List<Object> getAllData(){
        ResponseEntity<ResponseDto<CustomerResponseDTO>> responseDtoResponseEntity = null;
        log.info(customerClient.getAllStore().getBody().toString());
        if(customerClient.getAllStore().getStatusCode().is2xxSuccessful()){
            return (List<Object>) customerClient.getAllStore().getBody();
        }else{
            return null;
        }
    }
    */
    
    
    public List<StoreResponseDTO> getAllStore()
    {
    	
    	ResponseEntity<ResponseDto<StoreResponseDTO>> responseDtoResponseEntity = null;
    	log.info(storeClient.getAllStore().getBody().toString());
    	if(storeClient.getAllStore().getStatusCode().is2xxSuccessful())
    	{
    		return (List<StoreResponseDTO>) storeClient.getAllStore().getBody();
    	}
    	else
    		return null;
    		
    }
    /*
    public Object getOneCustomer(String cid)
    {
    	ResponseEntity<CustomerResponseDTO> customerResponseDTO = null;
    	//if(customerClient.)
    	
    }
    */
    
}
