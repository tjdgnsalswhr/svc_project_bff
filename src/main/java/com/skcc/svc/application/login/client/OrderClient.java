package com.skcc.svc.application.login.client;

import java.util.List;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.skcc.svc.application.login.vo.BalanceInfoResponseDTO;
import com.skcc.svc.application.login.vo.OrderResponseDTO;
import com.skcc.svc.application.login.vo.StoreResponseDTO;

@FeignClient(name = "order-api", url="${feign.order-api.url}")
public interface OrderClient {
	
	/*
    @GetMapping(value="/store/info/all")
    public ResponseEntity<List<StoreResponseDTO>> getAllStore();
    
    @GetMapping(value="/store/info/{sid}")
    public ResponseEntity<StoreResponseDTO> getOneStore(@PathVariable String sid);
    */
	
	@GetMapping(value="/order/teamcustomer/list/{teamid}")
	public ResponseEntity<List<OrderResponseDTO>> getRecentWeekOrderList(@PathVariable String teamid);
	
	@GetMapping(value="/balance/info/customer/{cid}")
	public ResponseEntity<List<BalanceInfoResponseDTO>> getAllBalanceByCustomer(@PathVariable String cid);
	
	@GetMapping(value="/balance/info/store/{sid}")
	public ResponseEntity<List<BalanceInfoResponseDTO>> getAllBalanceByStore(@PathVariable String sid);
	
	@GetMapping(value="/order/store/list/{storeid}")
	public ResponseEntity<List<OrderResponseDTO>> getRecentWeekOrderListByStore(@PathVariable String storeid);
	
}
