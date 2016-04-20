package controllers;

/**
 * @author Sander Joos
 */

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

@Controller
@RequestMapping(value="/author")
public class AuthorController {
    
    @Autowired
    private ServiceFacade service;
        
    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView getAuthors(){
        return new ModelAndView("authorOverview","authors",service.getAllAuthors());
    }
    
    @RequestMapping(value="/new", method=RequestMethod.GET)
    public ModelAndView getNewAuthorForm(){
        return new ModelAndView("authorForm","author",new Author());
    }
    
    @RequestMapping(method=RequestMethod.POST)
    public String save(@ModelAttribute("author") Author author, BindingResult result){
        if(result.hasErrors()){            
            return "authorForm";
        }
        service.addAuthor(author);
        return "redirect:/author.htm";
    }
      
    @RequestMapping(value="/delete/{id}", method=RequestMethod.GET)
    public String deleteAuthor(@PathVariable long id){
        service.deleteAuthor(id);
        return "redirect:/author.htm";
    }
    
    @RequestMapping(value="/{id}", method=RequestMethod.GET)
    public ModelAndView getAuthorEditForm(@PathVariable long id){
        return new ModelAndView("updateAuthorForm","author",service.getAuthorById(id));
    }
    
    @RequestMapping(value="/update", method=RequestMethod.POST)
    public String updateAuthor(@ModelAttribute("author") Author author){
        service.updateAuthor(author);
        return "redirect:/author.htm";
    }
    
    @RequestMapping(value="/books/{id}",method=RequestMethod.GET)
    public ModelAndView getBooks(@PathVariable long id){
        return new ModelAndView("redirect:/book.htm","books",service.getAuthorById(id).getBooks());
    }
    
    @RequestMapping(value="/addBookForm/{id}",method=RequestMethod.GET)
    public ModelAndView addBookForm(@PathVariable long id){
        ModelAndView modelAndView = new ModelAndView("addBookForm", "author", service.getAuthorById(id));
        modelAndView.addObject("bookList", service.getAllBooks());
        return modelAndView;
    }
    
    @RequestMapping(value="/addBook/{id}",method=RequestMethod.POST)
    public String addBook(@ModelAttribute("book") Book book, @PathVariable long id){
        service.addBookToAuthor(service.getAuthorById(id), book);
        return "redirect:/author.htm";
    }
}
