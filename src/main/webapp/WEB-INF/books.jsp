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
    <title>Books</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body class="bg-dark">
    <main>
        <div class="container py-5">
            <div class="card">
                <div class="card-header">
                    <h4>Welcome, ${user.getUserName()}</h4>
                </div>
                <div class="card-body">
                    <div class="row">
                        <div class="col">
                            <h3>Books from everyone's shelves</h3>
                        </div>
                        <div class="col-auto">
                            <a href="/books/new"><button type="button" class="btn btn-success">+ Add a to my shell</button></a>
                            <a href="/logout"><button type="button" class="btn btn-danger">Logout</button></a>
                        </div>
                    </div>
                    <div class="row py-1">
                        <div class="col-12">
                            <table class="table table-striped">
                                <thead>
                                <tr>
                                    <th scope="col">id</th>
                                    <th scope="col">Title</th>
                                    <th scope="col">AuthorName</th>
                                    <th scope="col">Posted By</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${books}" var="book">
                                    <tr>
                                        <th scope="row">${book.getId()}</th>
                                        <td><a href="/books/${book.getId()}">${book.getTitle()}</a></td>
                                        <td>${book.getAuthorName()}</td>
                                        <td>${book.getUser().getUserName()}</td>
                                    </tr>
                                </tbody>
                                </c:forEach>
                            </table>
                        </div>

                    </div>
                </div>
                <div class="card-footer">
                </div>
            </div>
        </div>
    </main>

</body>
</html>