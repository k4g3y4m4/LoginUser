<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. -->
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Formato (fechas) -->
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- para errores de renderizado en rutas PUT -->
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Book Share</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/style.css"> <!-- change to match your file/naming structure -->
</head>
<body class="bg-dark">
    <main>
        <div class="container py-5">
            <div class="card">
                <div class="card-header">
                    <div class="row">
                        <div class="col">
                            <h4>Add a Book to Your Shelf!</h4>
                        </div>
                        <div class="col-auto">
                            <a href="/books" class="btn btn-primary">Back to Shelve</a>
                        </div>
                    </div>
                </div>
                <div class="card-body">
                    <form:form action="/newBook" method="post" modelAttribute="newBook">
                        <div class="form-group row py-1">
                            <form:label path="title" class="col-md-4 col-form-label">Title :</form:label>
                            <div class="col-md-8">
                                <p class="text-danger"><form:errors path="title"/></p>
                                <form:input type="text" path="title" class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group row py-1">
                            <form:label path="authorName" class="col-md-4 col-form-label">Author :</form:label>
                            <div class="col-md-8">
                                <p class="text-danger"><form:errors path="authorName"/></p>
                                <form:input type="text" path="authorName" class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group row py-1">
                            <form:label path="description" class="col-md-4 col-form-label">Description :</form:label>
                            <div class="col-md-8">
                                <p class="text-danger"><form:errors path="description"/></p>
                                <form:input type="text" path="description" class="form-control"/>
                            </div>
                        </div>
                        <form:hidden path="user" value="${user.getId()}"/>
                        <div class="form-group row py-2">
                            <div class="col"></div>
                            <div class="col-auto">
                                <button type="submit" class="btn btn-primary">Submit</button>
                            </div>
                        </div>
                    </form:form>
                </div>
            </div>
        </div>
    </main>
</body>
</html>