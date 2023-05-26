<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="database.BookDAO" %>
<%@ page import="models.Book" %>
<%@ page import="java.util.List" %>
<%
    // Create an instance of BookDAO
    BookDAO bookDAO = new BookDAO();

    // Retrieve the search query from the request parameter
    String searchQuery = request.getParameter("search");

    // Perform the search if a query is provided
    List<Book> books;
    if (searchQuery != null && !searchQuery.isEmpty()) {
        books = bookDAO.searchBooks(searchQuery);
    } else {
        // Retrieve all books from the database
        books = bookDAO.getAllBooks();
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>BookshelfXpress</title>
    <link rel="stylesheet"
        href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
        crossorigin="anonymous">
    <style>
        table {
            table-layout: fixed;
        }

        td {
            word-wrap: break-word;
            max-width: 200px;
        }
    </style>
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
        <h2 class="text-center">Book Catalog</h2>
        <hr>
        <div class="text-center">
            <a href="<%=request.getContextPath()%>/InsertServlet" class="btn btn-success">Add New Book</a>
        </div>
    </div>
    <br>
    <div class="container">
        <form action="SearchServlet" method="get" class="form-inline justify-content-center">
        <div class="form-group mx-sm-3 mb-2">
            <input type="text" name="search" class="form-control" placeholder="Search" value="${searchQuery}">
        </div>
        <button type="submit" class="btn btn-primary mb-2">Search</button>
    </form>
    </div>
    <div class="container">
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

					<% for (Book book : books) { %>
            <tr>
                <td><%= book.getId() %></td>
                <td><%= book.getTitle() %></td>
                <td><%= book.getAuthor() %></td>
                <td><%= book.getDate() %></td>
                <td><%= book.getGenres() %></td>
                <td><%= book.getCharacters() %></td>
                <td><%= book.getSynopsis() %></td>
               <td><a href="UpdateServlet?id=<%= book.getId() %>" class="btn btn-primary">Update</a></td>
               <td><a href="DeleteServlet?id=<%= book.getId() %>" class="btn btn-danger">Delete</a></td>

            </tr>
        <% } %>
			</table>
		

		</tbody>
        </table>
    </div>
</body>
</html>
