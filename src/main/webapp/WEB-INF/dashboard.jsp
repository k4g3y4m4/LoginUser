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
    <title>Dashboard</title>
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
                    <p>This is your dashboard. Nothing to see here yet.</p>
                </div>
                <div class="card-footer">
                    <div class="row">
                        <div class="col"></div>
                        <div class="col-auto">
                            <a href="/logout"><button type="button" class="btn btn-danger">Log Out</button></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>

</body>
</html>