package com.skcc.svc.application.web.controller;

import java.util.List;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.ModelAndView;

import com.skcc.svc.application.login.service.CustomerService;
import com.skcc.svc.application.login.service.StoreInfoService;
import com.skcc.svc.application.login.vo.CustomerResponseDTO;
import com.skcc.svc.application.login.vo.StoreResponseDTO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
public class TeamListStoreController {

    private final StoreInfoService storeService;
    private final CustomerService customerService;


    @GetMapping("/team/list-store/{cid}")
    public ModelAndView TeamListStorePage(Model model, @PathVariable String cid){
    	
    	List<StoreResponseDTO> storeList = storeService.getAllStore();
        CustomerResponseDTO customer = customerService.getOneCustomer(cid);
        ModelAndView modelAndView = new ModelAndView("team/team_list_store");
        modelAndView.addObject("storeList", storeList);
        modelAndView.addObject("customerInfo", customer);
        modelAndView.addObject("cid", cid);
        return modelAndView;
    }
}
