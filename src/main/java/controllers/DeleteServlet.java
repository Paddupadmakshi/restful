package controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.BookDAO;


/**
 *  implementation class DeleteServlet
 */
@WebServlet("/DeleteServlet")
public class DeleteServlet extends HttpServlet {
	

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 request.getRequestDispatcher("deleteBook.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 // Retrieve the book ID parameter from the request
        int bookId = Integer.parseInt(request.getParameter("id"));

        // Create an instance of BookDAO
        BookDAO bookDAO = new BookDAO();

        // Delete the book from the database
        bookDAO.deleteBook(bookId);

     // Set the success message
        String message = "Book deleted successfully.";

        // Store the message in the request scope
        request.setAttribute("message", message);

        // Redirect to the success.jsp page
        request.getRequestDispatcher("success.jsp").forward(request, response);
    }
	}


