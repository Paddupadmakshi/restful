<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
  <title>Success</title>
  <link rel="stylesheet"
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
				<a class="navbar-brand"> BookshelfXpress </a>
			</div>
            
			
		</nav>
	</header>
  <br>
	<div class="container col-md-5" >
	<%-- Retrieve the success message from the request scope --%>
  <% String message = (String) request.getAttribute("message"); %>
		
			<%= message %>
<br/>
 <a href="index.jsp">Back to Home</a>			
  </div>
  
</body>
</html>