package com.skcc.svc.application.web.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
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
public class TeamListInfoController {
	
    private final BalanceInfoService balanceInfoService;
    private final CustomerService customerService;
    private final StoreInfoService storeInfoService;
    private final StoreInfoService storeInfoService2;
    private final OrderInfoService orderInfoService;
    
    @GetMapping("/team/list-info/{cid}")
    public ModelAndView TeamListStorePage(Model model, @PathVariable String cid){
    	List<BalanceInfoResponseDTO> balanceInfoList = balanceInfoService.getAllBalanceByCustomer(cid);
    	List<String> storeNameList = new ArrayList<>();
    	//List<OrderResponseDTO> orderInfoList = orderInfoService.getRecentWeekOrderList(cid);
    	for(int i=0; i<balanceInfoList.size(); i++)
    	{
    		BalanceInfoResponseDTO balanceInfo = balanceInfoList.get(i);
    		StoreResponseDTO store = storeInfoService.getOneStore(balanceInfo.getSid());
    		storeNameList.add(store.getStorename());
    	}
    	/*
    	List<String> storeIdListForOrder = new ArrayList<>();
    	for(int j=0; j<orderInfoList.size(); j++)
    	{
    		OrderResponseDTO order = orderInfoList.get(j);
    		storeIdListForOrder.add(order.getStoreid());
    	}
    	*/
    	
    	CustomerResponseDTO customer = customerService.getOneCustomer(cid);
        ModelAndView modelAndView = new ModelAndView("team/team_list_info");
        //modelAndView.addObject("customerNameListForOrder", customerNameListForOrder);
        //modelAndView.addObject("storeIdListForOrder", storeIdListForOrder);
        //modelAndView.addObject("orderInfoList", orderInfoList);
        modelAndView.addObject("balanceInfoList", balanceInfoList);
        modelAndView.addObject("customerInfo", customer);
        modelAndView.addObject("storeNameList", storeNameList);
        modelAndView.addObject("cid", cid);
        return modelAndView;
    }
}
