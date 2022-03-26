package com.codingdojo.loginuser.services;

import com.codingdojo.loginuser.models.Book;
import com.codingdojo.loginuser.repositores.BookRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import java.util.List;
import java.util.Optional;

@Service
public class BookService {

    @Autowired
    BookRepository bookRepository;

    public List<Book> allBooks() {
        return bookRepository.findAll();
    }

    //find book by id
    public Book findOneBook(Integer id) {
        Optional<Book> optionalBook = bookRepository.findById(id);
        return optionalBook.orElse(null);
    }

    public Book createBook(Book newBook, BindingResult result) {
        checkBook(newBook, result);
        if(result.hasErrors()) {
            return null;
        }else {
            return bookRepository.save(newBook);
        }
    }

    private void checkBook(Book newBook, BindingResult result) {
        if(newBook.getTitle() == null || newBook.getTitle().length() < 1) {
            result.rejectValue("title", "blank", "Title cannot be blank");
        }
        if(newBook.getAuthorName() == null || newBook.getAuthorName().length() < 1) {
            result.rejectValue("authorName", "blank", "Author cannot be blank");
        }
        if(newBook.getDescription() == null || newBook.getDescription().length() < 1) {
            result.rejectValue("description", "blank", "Description cannot be blank");
        }
    }

    public Book updateBook( Book newBook, BindingResult result) {
        checkBook(newBook, result);
        if (result.hasErrors()) {
                return null;
        }else{
                return bookRepository.save(newBook);
        }
    }
}
