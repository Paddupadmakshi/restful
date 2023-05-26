<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="database.BookDAO" %>
<%@ page import="models.Book" %>
<%
    // Retrieve the book ID from the request parameter
    int bookId = Integer.parseInt(request.getParameter("id"));

    // Create an instance of BookDAO
    BookDAO bookDAO = new BookDAO();
    // Retrieve the book by ID from the database
    Book book = bookDAO.getBookByID(bookId);
%>
<!DOCTYPE html>
<html>
<head>
<title>BookshelfXpress - Update Book</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
</head>
<body>
<header>
		<nav class="navbar navbar-expand-md navbar-dark"
			style="background-color:#9FE2BF">
			<div>
				<a class="navbar-brand"> BookshelfXpress - Update Book </a>
			</div>
             
			
		</nav>
	</header>
	<br>
	<div class="container col-md-5">
	<div class="card">
		<div class="card-body">
			<form action="UpdateServlet" method="post">
			
				<input type="hidden" name="id" value="${book.id}">
				
				<div class="form-group">
					<label>Title</label>
					<input type="text" name="title" value="${book.title}" class="form-control">
				</div>
				
				<div class="form-group">
					<label>Author</label>
					<input type="text" name="author" value="${book.author}" class="form-control">
				</div>
				
				<div class="form-group">
					<label>Date</label>
					<input type="text" name="date" value="${book.date}" class="form-control">
				</div>
				
				<div class="form-group">
					<label>Genres</label>
					<input type="text" name="genres" value="${book.genres}" class="form-control">
				</div>
				
				<div class="form-group">
					<label>Characters</label>
					<input type="text" name="characters" value="${book.characters}" class="form-control">
				</div>
				
				<div class="form-group">
					<label>Synopsis</label>
					<input type="text" name="synopsis" value=<%= book.getSynopsis()%> class="form-control">
				</div>
				
				
				<button type="submit" class="btn btn-success">Update</button>
			</form>
			<br/>
			<a href="index.jsp">Back to Home</a>
		</div>
	</div>
</div>

</body>
</html>