<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="models.Book" %>
<!DOCTYPE html>
<html>
<head>
    <title>Book Search</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
          crossorigin="anonymous">
</head>
<body>
<header>
    <nav class="navbar navbar-expand-md navbar-dark" style="background-color: #9FE2BF">
        <div>
            <a class="navbar-brand">BookshelfXpress</a>
        </div>
    </nav>
</header>
<br>
<div class="container">
    <h2 class="text-center">Book Search Results</h2>
    <hr>
    <div class="text-center">
        <form action="SearchServlet" method="get" class="form-inline">
            <div class="form-group mx-sm-3 mb-2">
                <input type="text" name="search" class="form-control" placeholder="Search" value="${searchQuery}">
            </div>
            <button type="submit" class="btn btn-primary mb-2">Search</button>
        </form>
        <a href="index.jsp" class="btn btn-success">Back to Home</a>
    </div>
    <br>
   
    <table class="table table-bordered">
        <thead>
        <tr>
            <th>ID</th>
            <th>TITLE</th>
            <th>AUTHOR</th>
            <th>DATE</th>
            <th>GENRES</th>
            <th>CHARACTERS</th>
            <th>SYNOPSIS</th>
            <th>UPDATE</th>
            <th>DELETE</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="book" items="${books}">
            <tr>
                <td>${book.getId()}</td>
                <td>${book.getTitle()}</td>
                <td>${book.getAuthor()}</td>
                <td>${book.getDate()}</td>
                <td>${book.getGenres()}</td>
                <td>${book.getCharacters()}</td>
                <td>${book.getSynopsis()}</td>
                <td><a href="UpdateServlet?id=${book.getId()}" class="btn btn-primary">Update</a></td>
                <td><a href="DeleteServlet?id=${book.getId()}" class="btn btn-danger">Delete</a></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    
</div>
</body>
</html>
