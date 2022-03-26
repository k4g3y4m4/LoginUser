package com.codingdojo.loginuser.controllers;

import com.codingdojo.loginuser.models.Book;
import com.codingdojo.loginuser.services.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.List;

@Controller
public class BookController {
    @Autowired
    private BookService bookService;

    @GetMapping("/books")
    public String dashboard(HttpSession session, Model model) {
        if(session.getAttribute("user") == null) {
            return "redirect:/";
        }
        List<Book> books = bookService.allBooks();
        model.addAttribute("user", session.getAttribute("user"));
        model.addAttribute("books", books);
        return "books.jsp";
    }

    @GetMapping("/books/{id}")
    public String show(HttpSession session, Model model, @PathVariable("id") Integer id) {
        if (session.getAttribute("user") == null) {
            return "redirect:/";
        }
        Book book = bookService.findOneBook(id);
        System.out.println(book.getAuthorName());
        model.addAttribute("user", session.getAttribute("user"));
        model.addAttribute("book", book);
        return "show.jsp";
    }

    @GetMapping("/books/new")
    public String newBook(HttpSession session, @ModelAttribute("newBook") Book book, Model model) {
        if(session.getAttribute("user") == null) {
            return "redirect:/";
        }
        model.addAttribute("user", session.getAttribute("user"));
        return "newBook.jsp";
    }

    @PostMapping("/newBook")
    public String create(@Valid @ModelAttribute("newBook") Book book,
                         HttpSession session, BindingResult result, Model model) {

        if(session.getAttribute("user") == null) {
            return "redirect:/";
        }

        bookService.createBook(book,result);
        if (result.hasErrors()) {
            model.addAttribute("user", session.getAttribute("user"));
            return "newBook.jsp";
        }

        return "redirect:/books";
    }

    @GetMapping("/books/{id}/edit")
    public String edit(HttpSession session, Model model, @PathVariable("id") Integer id, @ModelAttribute("updateBook") Book updateBook) {
        if(session.getAttribute("user") == null) {
            return "redirect:/";
        }
        Book book = bookService.findOneBook(id);
        model.addAttribute("user", session.getAttribute("user"));
        model.addAttribute("book", book);
        return "updateBook.jsp";
    }

    @PostMapping("/updateBook")
    public String update(@Valid @ModelAttribute("updateBook") Book book,
                         HttpSession session, BindingResult result, Model model) {

        if(session.getAttribute("user") == null) {
            return "redirect:/";
        }

        bookService.updateBook(book,result);
        if (result.hasErrors()) {
            model.addAttribute("user", session.getAttribute("user"));
            return "updateBook.jsp";
        }
        return "redirect:/books";
    }


}
