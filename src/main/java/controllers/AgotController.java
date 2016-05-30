/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import services.ServiceFacade;

/**
 *
 * @author Sander_2
 */
@Controller
@RequestMapping(value="/agot")
public class AgotController {
    
    @Autowired
    ServiceFacade service;
    
    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView getAgotBooks(){
        return new ModelAndView("agotBooks","agotBooks",this.service.getAGOTBooks());
    }
}
