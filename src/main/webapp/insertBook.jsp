<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="database.BookDAO" %>
<%@ page import="models.Book" %>
<!DOCTYPE html>
<html>
<head>
<title>BookshelfXpress - Add a New Book</title>
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
				<a class="navbar-brand"> BookshelfXpress - Add a New Book </a>
			</div>
             
			
		</nav>
	</header>
	<br>
	<div class="container col-md-5">
		<div class="card">
			<div class="card-body"> 					
                <form action="InsertServlet" method="post">
                
					<input type="hidden" name="id"
							value="${book.id}">
											
					<div class="form-group">

							<label>Title</label>
							<input type="text" name="title" required 
								value="" class="form-control">

						</div>

						<div class="form-group">

							<label>Author</label>
							<input type="text" name="author" required
								value="" class="form-control">

					</div>

                         <div class="form-group">

							<label>Date</label>
							<input type="text" name="date" required
								value="" class="form-control">

						</div>
						
						<div class="form-group">

							<label>Genres</label>
							<input type="text" name="genres" required
								value="" class="form-control">

						</div>
						
						<div class="form-group">

							<label>Characters</label>
							<input type="text" name="characters" required
								value="" class="form-control">

						</div>
						
						<div class="form-group">

							<label>Synopsis</label>
							<input type="text" name="synopsis" required
								value="" class="form-control">

						</div>
						
						<button type="submit" class="btn btn-success">Add a New Book</button>
    </form>
    <br/>
    <a href="index.jsp">Back to Home</a>
    </div>
		</div>
	</div>
</body>
</html>