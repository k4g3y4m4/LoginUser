package com.codingdojo.loginuser.repositores;

import com.codingdojo.loginuser.models.Book;
import org.springframework.data.repository.CrudRepository;

import java.util.List;
import java.util.Optional;

public interface BookRepository extends CrudRepository<Book, Long> {

    //get all books
    List<Book> findAll();

    //find book by id
    Optional<Book> findById(Integer id);
}
