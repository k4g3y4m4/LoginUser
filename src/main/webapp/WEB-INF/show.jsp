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
    <title>Read Share</title>
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
                            <p class="h3 font-italic">${book.getTitle()}</p>
                        </div>
                        <div class="col-auto">
                            <a href="/books" class="btn btn-primary">back to the shelves</a>
                        </div>
                    </div>
                </div>
                <div class="card-body">
                    <!--if author ==  true or else-->
                    <c:choose>
                        <c:when test="${user.getUserName() == book.getUser().getUserName()}">
                            <p class="text-left h5"> You read <span class="purple">${book.getTitle()}</span> by <span class="green">${book.getAuthorName()}</span></p>
                            <p class="text-left h5">Here are yours thoughts:</p>
                        </c:when>
                        <c:otherwise>
                            <p class="text-left h5"><span class="red">${book.getUser().getUserName()}</span> read <span class="purple">${book.getTitle()}</span> by <span class="green">${book.getAuthorName()}</span></p>
                            <p class="text-left h5">Here are ${book.getUser().getUserName()}'s thoughts:</p>
                        </c:otherwise>
                    </c:choose>

                    <blockquote class="blockquote">
                        <p class="mb-0">${book.getDescription()}</p>
                    </blockquote>
                </div>
                <!--if author ==  true or else-->
                <c:choose>
                    <c:when test="${user.getUserName() == book.getUser().getUserName()}">
                        <div class="card-footer">
                            <div class="row">
                                <div class="col">
                                </div>
                                <div class="col-auto">
                                    <a href="/books/${book.getId()}/edit"><button type="button" class="btn btn-success">Edit</button></a>
                                </div>
                            </div>
                        </div>
                    </c:when>
                </c:choose>






            </div>
        </div>

    </main>
</body>
</html>