package com.skcc.svc.application.web.controller;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.logging.Log;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.ModelAndView;

import com.skcc.svc.application.login.service.BalanceInfoService;
import com.skcc.svc.application.login.service.CustomerService;
import com.skcc.svc.application.login.service.OrderInfoService;
import com.skcc.svc.application.login.service.StoreInfoService;
import com.skcc.svc.application.login.vo.BalanceInfoResponseDTO;
import com.skcc.svc.application.login.vo.CustomerResponseDTO;
import com.skcc.svc.application.login.vo.OrderResponseDTO;
import com.skcc.svc.application.login.vo.StoreResponseDTO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
public class OwnerListInfoController {

    private final BalanceInfoService balanceInfoService;
    private final CustomerService customerService;
    private final StoreInfoService storeInfoService;
    private final OrderInfoService orderInfoService;
    
    @GetMapping("/owner/list-info/{cid}")
    public ModelAndView TeamListStorePage(Model model, @PathVariable String cid){
    	List<CustomerResponseDTO> TeamList = customerService.getAllCustomerData();
    	
    	
    	CustomerResponseDTO owner = customerService.getOneCustomer(cid);
    	StoreResponseDTO owstore = storeInfoService.getOneStoreByOwnerid(cid);    	
    	String sid = owstore.getSid();
    	String sname = owstore.getStorename();
    	
    	//List<OrderResponseDTO> orderInfoList = orderInfoService.getRecentWeekOrkderListByStore(sid);
    	
    	ModelAndView modelAndView = new ModelAndView("owner/owner_list_info");
    	modelAndView.addObject("TeamList", TeamList);
    	modelAndView.addObject("cid", cid);
    	modelAndView.addObject("sid", sid);
    	modelAndView.addObject("sname", sname);
    	modelAndView.addObject("owner", owner);
    	//modelAndView.addObject("orderInfoList", orderInfoList);
    	
    	/*
    	List<String> storeNameList = new ArrayList<>();
    	List<OrderResponseDTO> orderInfoList = orderInfoService.ggetRecentWeekOrderList(cid);
    	for(int i=0; i<balanceInfoList.size(); i++)
    	{
    		BalanceInfoResponseDTO balanceInfo = balanceInfoList.get(i);
    		StoreResponseDTO store = storeInfoService.getOneStore(balanceInfo.getSid());
    		storeNameList.add(store.getStorename());
    	}
    	
    	List<String> customerNameListForOrder = new ArrayList<>();
    	List<String> storeNameListForOrder = new ArrayList<>();
    	for(int i=0; i<orderInfoList.size(); i++)
    	{
    		OrderResponseDTO order = orderInfoList.get(i);
    		CustomerResponseDTO cust = customerService.getOneCustomer(order.getTeamid());
    		//StoreResponseDTO st = storeInfoService.getOneStore(order.getStoreid());
    		customerNameListForOrder.add(cust.getCname());
    		//storeNameListForOrder.add(st.getStorename());
    	}
    	*/
    	//CustomerResponseDTO customer = customerService.getOneCustomer(cid);
        //ModelAndView modelAndView = new ModelAndView("team/team_list_info");
        //modelAndView.addObject("customerNameListForOrder", customerNameListForOrder);
       // modelAndView.addObject("storeNameListForOrder", storeNameListForOrder);
        //modelAndView.addObject("orderInfoList", orderInfoList);
        //modelAndView.addObject("storeNameList", storeNameList);
        //modelAndView.addObject("balanceInfoList", balanceInfoList);
       // modelAndView.addObject("customerInfo", customer);
       // modelAndView.addObject("cid", cid);
        return modelAndView;
    }
}
