<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
<meta charset="ISO-8859-1">
<title>BookshelfXpress - Delete Book</title> <link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
</head>
<body>
<header>
<br>
		<nav class="navbar navbar-expand-md navbar-dark"
			style="background-color:#9FE2BF">
			<div>
				<a class="navbar-brand"> BookshelfXpress - Delete Confirmation</a>
			</div>
            
			
		</nav>
	</header>
	<br>
 <div class="container col-md-5">
    <p>Are you sure you want to delete the book "<%= book.getTitle() %>"?</p>
    <form action="DeleteServlet" method="POST">
        <input type="hidden" name="id" value="<%= book.getId() %>"/>
        <button type="submit" class="btn btn-danger">Delete</button>
    </form>
    <br/>
    <a href="index.jsp">Back to Home</a>
    </div>
</body>
</html>