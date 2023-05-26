package controllers;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.BookDAO;
import models.Book;

/**
 * Servlet implementation class SearchServlet
 */
@WebServlet("/SearchServlet")
public class SearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 String searchQuery = request.getParameter("search");

	        
	            BookDAO bookDAO = new BookDAO();
	            List<Book> books = bookDAO.searchBooks(searchQuery);
	            if (books.isEmpty()) {
	            	 String message = "No results found.";

	     	        // Store the message in the request scope
	     	        request.setAttribute("message", message);
	     	     // Redirect to the success.jsp page
	     	        request.getRequestDispatcher("success.jsp").forward(request, response);
	            }
	            else {
	                request.setAttribute("books", books);    
	            request.setAttribute("searchQuery", searchQuery);
	        request.getRequestDispatcher("search.jsp").forward(request, response);
	            }
	        }
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
