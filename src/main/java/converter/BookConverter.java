/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package converter;

import entities.Book;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import services.ServiceFacade;

/**
 *
 * @author Sander_2
 */
public class BookConverter implements Converter<String, Book>{
    
    @Autowired
    private ServiceFacade facade;
    
    @Override
    public Book convert(String title){
        return facade.getBook(title);
    }
}
