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
    <title>Login and Register</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/styles.css"> <!-- change to match your file/naming structure -->
</head>
<body class="bg-dark">
<main>
    <div class="container py-5">
        <div class="row">
            <div class="col-md-6 py-1">
                <div class="card">
                    <div class="card-header">
                        <h4>Register</h4>
                    </div>
                    <!--errors-->
                    <div class="card-body">
                        <form:form action="/register" method="post" modelAttribute="newUser">
                            <div class="form-group row py-1">
                                <form:label path="userName" class="col-md-4 col-form-label">Username :</form:label>
                                <div class="col-md-8">
                                    <p class="text-danger"><form:errors path="userName"/></p>
                                    <form:input type="text" path="userName" class="form-control" required="true"/>
                                </div>
                            </div>
                            <div class="form-group row py-1">
                                <form:label path="email" class="col-md-4 col-form-label">Email :</form:label>
                                <div class="col-md-8">
                                    <p class="text-danger"><form:errors path="email"/></p>
                                    <form:input type="email" path="email" class="form-control" required="true"/>
                                </div>
                            </div>
                            <div class="form-group row py-1">
                                <form:label path="password" class="col-md-4 col-form-label">Password :</form:label>
                                <div class="col-md-8">
                                    <p class="text-danger"><form:errors path="password"/></p>
                                    <form:input type="password" path="password" class="form-control" required="true"/>
                                </div>
                            </div>
                            <div class="form-group row py-1">
                                <form:label path="confirm" class="col-md-4 col-form-label">Confirm Password :</form:label>
                                <div class="col-md-8">
                                    <p class="text-danger"><form:errors path="confirm"/></p>
                                    <form:input type="password" path="confirm" class="form-control" required="true"/>
                                </div>
                            </div>
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
            <div class="col-md-6 py-1">
                <div class="card">
                    <div class="card-header">
                        <h4>Login</h4>
                    </div>
                    <div class="card-body">
                        <form:form action="/login" method="post" modelAttribute="newLogin">
                            <div class="form-group row py-1">
                                <form:label path="email" class="col-md-4 col-form-label">Email :</form:label>
                                <div class="col-md-8">
                                    <p class="text-danger"><form:errors path="email"/></p>
                                    <form:input type="text" path="email" class="form-control" required="true"/>
                                </div>
                            </div>
                            <div class="form-group row py-1">
                                <form:label path="password" class="col-md-4 col-form-label">Password :</form:label>
                                <div class="col-md-8">
                                    <p class="text-danger"><form:errors path="password"/></p>
                                    <form:input type="password" path="password" class="form-control" required="true"/>
                                </div>
                            </div>
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
        </div>
    </div>
</main>
</body>
</html>