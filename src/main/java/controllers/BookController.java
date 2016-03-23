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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import services.ServiceFacade;

/**
 *
 * @author Sander_2
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
    public String save(@ModelAttribute("book") Book book){
        service.addBook(book);
        return "redirect:/book.htm";
    }
    
    @RequestMapping(value="/delete/{ISBN}", method=RequestMethod.GET)
    public String deleteAuthor(@PathVariable String ISBN){
        service.deleteBook(ISBN);
        return "redirect:/author.htm";
    }
    
        @RequestMapping(value="/{ISBN}", method=RequestMethod.GET)
    public ModelAndView getBookEditForm(@PathVariable String ISBN){
        return new ModelAndView("updateBookForm","book",service.getBookByISBN(ISBN));
    }
    
    @RequestMapping(value="/update", method=RequestMethod.POST)
    public String updateBook(@ModelAttribute("book") Book book){
        service.updateBook(book);
        return "redirect:/book.htm";
    }
    
}
