package controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.BookDAO;
import models.Book;

/**
 * Servlet implementation class InsertServlet
 */
@WebServlet("/InsertServlet")
public class InsertServlet extends HttpServlet {
	
	 private BookDAO bookDAO= new BookDAO();

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  request.getRequestDispatcher("insertBook.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 Book book = getBookFromRequest(request);
	        bookDAO.insertBook(book);
	        // Set the success message
	        String message = "Book Added successfully.";

	        // Store the message in the request scope
	        request.setAttribute("message", message);
	     // Redirect to the success.jsp page
	        request.getRequestDispatcher("success.jsp").forward(request, response);
	}
	private Book getBookFromRequest(HttpServletRequest request) {
        // Retrieve book information from request parameters
        
        String title = request.getParameter("title");
        String author = request.getParameter("author");
        String date = request.getParameter("date");
        String genres = request.getParameter("genres");
        String characters = request.getParameter("characters");
        String synopsis = request.getParameter("synopsis");

        // Create a new Book object
        Book book = new Book(title, author, date, genres, characters, synopsis);
        return book;
    }
}
