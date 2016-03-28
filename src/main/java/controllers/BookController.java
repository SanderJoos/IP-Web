/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import entities.Author;
import entities.Book;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import services.ServiceFacade;

/**
 *
 * @author Sander Joos
 */

@Controller
@RequestMapping(value="/book")
public class BookController {
    
    @Autowired
    private ServiceFacade service;
        
    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView getBooks(){
        return new ModelAndView("bookOverview","books",service.getAllBooks());
    }
    
    @RequestMapping(value="/new", method=RequestMethod.GET)
    public ModelAndView getNewBookForm(){
        return new ModelAndView("bookForm","book",new Book());
    }
    
    @RequestMapping(method=RequestMethod.POST)
    public String save(@ModelAttribute("book") Book book, BindingResult result){
        if(result.hasErrors()){            
            return "bookForm";
        }
        service.addBook(book);
        return "redirect:/book.htm";
    }
      
    @RequestMapping(value="/delete/{id}", method=RequestMethod.GET)
    public String deleteBook(@PathVariable long id){
        service.deleteBook(id);
        return "redirect:/book.htm";
    }
    
    @RequestMapping(value="/{id}", method=RequestMethod.GET)
    public ModelAndView getdBookEditForm(@PathVariable long id){
        return new ModelAndView("updateBookForm","book",service.getBookById(id));
    }
    
    @RequestMapping(value="/update", method=RequestMethod.POST)
    public String updateBook(@ModelAttribute("book") Book book){
        service.updateBook(book);
        return "redirect:/book.htm";
    }
}
