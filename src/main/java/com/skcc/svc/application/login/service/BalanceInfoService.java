package com.skcc.svc.application.login.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import com.skcc.svc.application.login.client.OrderClient;
import com.skcc.svc.application.login.vo.BalanceInfoResponseDTO;
import com.skcc.svc.application.login.vo.StoreResponseDTO;
import com.skcc.svc.common.vo.ResponseDto;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class BalanceInfoService {
    @Autowired
    private OrderClient orderClient;
    
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
    
    
    public List<BalanceInfoResponseDTO> getAllBalanceByCustomer(String cid)
    {
    	
    	ResponseEntity<ResponseDto<BalanceInfoResponseDTO>> responseDtoResponseEntity = null;
    	log.info(orderClient.getAllBalanceByCustomer(cid).getBody().toString());
    	if(orderClient.getAllBalanceByCustomer(cid).getStatusCode().is2xxSuccessful())
    	{
    		return (List<BalanceInfoResponseDTO>) orderClient.getAllBalanceByCustomer(cid).getBody();
    	}
    	else
    		return null;
    		
    }
    
    public List<BalanceInfoResponseDTO> getAllBalanceByStore(String sid)
    {
    	
    	ResponseEntity<ResponseDto<BalanceInfoResponseDTO>> responseDtoResponseEntity = null;
    	log.info(orderClient.getAllBalanceByStore(sid).getBody().toString());
    	if(orderClient.getAllBalanceByStore(sid).getStatusCode().is2xxSuccessful())
    	{
    		return (List<BalanceInfoResponseDTO>) orderClient.getAllBalanceByStore(sid).getBody();
    	}
    	else
    		return null;
    		
    }
    
    /*

    public StoreResponseDTO getOneStore(String sid)
    {
    	ResponseEntity<StoreResponseDTO> storeResponseDTO = null;
    	log.info(storeClient.getOneStore(sid).getBody().toString());
        if(storeClient.getOneStore(sid).getStatusCode().is2xxSuccessful())
        {
            return (StoreResponseDTO) storeClient.getOneStore(sid).getBody();
        }
        else
        	return null;
    }
    */
    /*
    public Object getOneCustomer(String cid)
    {
    	ResponseEntity<CustomerResponseDTO> customerResponseDTO = null;
    	//if(customerClient.)
    	
    }
    */
    
}
