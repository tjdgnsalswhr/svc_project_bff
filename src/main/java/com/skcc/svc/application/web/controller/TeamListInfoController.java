package com.skcc.svc.application.web.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.ModelAndView;

import com.skcc.svc.application.login.service.CustomerService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
public class TeamListInfoController {

    private final CustomerService customerService;

    @GetMapping("/team/list-info/{cid}")
    public ModelAndView TeamListStorePage(Model model, @PathVariable String cid){
        ModelAndView modelAndView = new ModelAndView("team/team_list_info");
        modelAndView.addObject("cid", cid);
        return modelAndView;
    }
}
