package com.codingdojo.loginuser.models;

import javax.persistence.*;
import javax.validation.constraints.Size;

@Entity
@Table(name = "books")
public class Book {
@Id
@Column(name = "id", nullable = false)
@GeneratedValue(strategy = GenerationType.IDENTITY)
private Integer id;

@Column(name = "Title")
private String title;

@Column(name = "AuthorName")
private String authorName;

@Lob
@Column(name = "description")
private String description;

@ManyToOne(fetch = FetchType.LAZY, optional = false)
@JoinColumn(name = "users_id", nullable = false)
private User user;

public User getUser() {
    return user;
}

public void setUser(User user) {
    this.user = user;
}

public String getDescription() {
    return description;
}

public void setDescription(String description) {
    this.description = description;
}

public String getAuthorName() {
    return authorName;
}

public void setAuthorName(String authorName) {
    this.authorName = authorName;
}

public String getTitle() {
    return title;
}

public void setTitle(String title) {
    this.title = title;
}

public Integer getId() {
    return id;
}

public void setId(Integer id) {
    this.id = id;
}
}