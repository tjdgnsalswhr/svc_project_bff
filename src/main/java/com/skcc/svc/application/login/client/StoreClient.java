package com.skcc.svc.application.login.client;

import java.util.List;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.skcc.svc.application.login.vo.StoreResponseDTO;

@FeignClient(name = "store-api", url="${feign.store-api.url}")
public interface StoreClient {
	
    @GetMapping(value="/store/info/all")
    public ResponseEntity<List<StoreResponseDTO>> getAllStore();
    
    @GetMapping(value="/store/info/bystoreid/{storeId}")
    public ResponseEntity<StoreResponseDTO> getOneStore(@PathVariable String storeId);
    
    @GetMapping(value="/store/info/byowner/{owid}")
    public ResponseEntity<StoreResponseDTO> getOneStoreByOwnerId(@PathVariable String owid);
    
}
