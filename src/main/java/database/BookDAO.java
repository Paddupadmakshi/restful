package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import models.Book;


public class BookDAO {
	
	Book oneBook = null;
	Connection conn = null;
    Statement stmt = null;
	String user = "venkatep";
    String password = "stRogkil3";
    // Note none default port used, 6306 not 3306
    String url = "jdbc:mysql://mudfoot.doc.stu.mmu.ac.uk:6306/" + user;

	public BookDAO() {}

	
	private void openConnection(){
		// loading jdbc driver for mysql
		try{
		    Class.forName("com.mysql.jdbc.Driver").getDeclaredConstructor().newInstance();
		} catch(Exception e) { System.out.println(e); }

		// connecting to database
		try{
			// connection string for demos database, username demos, password demos
 			conn = DriverManager.getConnection(url, user, password);
		    stmt = conn.createStatement();
		} catch(SQLException se) { System.out.println(se); }	   
    }
	private void closeConnection(){
		try {
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private Book getNextBook(ResultSet rs){
    	Book thisBook=null;
		try {
			
			thisBook = new Book(
					rs.getInt("id"),
					rs.getString("title"),
					rs.getString("author"),
					rs.getString("date"),
					rs.getString("genres"),
					rs.getString("characters"),
					rs.getString("synopsis"));
		} catch (SQLException e) {
			e.printStackTrace();
		}
    	return thisBook;		
	}
	
	
	
   public ArrayList<Book> getAllBooks(){
	   
		ArrayList<Book> allBooks = new ArrayList<Book>();
		openConnection();
		
	    // Create select statement and execute it
		try{
		    String selectSQL = "select * from books";
		    ResultSet rs1 = stmt.executeQuery(selectSQL);
	    // Retrieve the results
		    while(rs1.next()){
		    	oneBook = getNextBook(rs1);
		    	allBooks.add(oneBook);
		   }

		    stmt.close();
		    closeConnection();
		} catch(SQLException se) { System.out.println(se); }

	   return allBooks;
   }

   
   public Book getBookByID(int id){
	   
		openConnection();
		oneBook=null;
	    // Create select statement and execute it
		try{
		    String selectSQL = "select * from books where id="+id;
		    ResultSet rs1 = stmt.executeQuery(selectSQL);
	    // Retrieve the results
		    while(rs1.next()){
		    	oneBook = getNextBook(rs1);
		    }

		    stmt.close();
		    closeConnection();
		} catch(SQLException se) { System.out.println(se); }

	   return oneBook;
   }
   
   public void insertBook(Book b)
   {
	   openConnection();

       try {
           String insertSQL = "INSERT INTO books (title, author, date, genres, characters, synopsis) " +
                   "VALUES (?, ?, ?, ?, ?, ?)";

           PreparedStatement preparedStatement = conn.prepareStatement(insertSQL);
           preparedStatement.setString(1, b.getTitle());
           preparedStatement.setString(2, b.getAuthor());
           preparedStatement.setString(3, b.getDate());
           preparedStatement.setString(4, b.getGenres());
           preparedStatement.setString(5, b.getCharacters());
           preparedStatement.setString(6, b.getSynopsis());

           preparedStatement.executeUpdate();
           preparedStatement.close();
           closeConnection();
       } catch (SQLException se) {
           System.out.println(se);
       }
   }
   
   public void updateBook(Book b) {
       openConnection();

       try {
           String updateSQL = "UPDATE books SET title=?, author=?, date=?, genres=?, characters=?, synopsis=? " +
                   "WHERE id=?";

           PreparedStatement preparedStatement = conn.prepareStatement(updateSQL);
           preparedStatement.setString(1, b.getTitle());
           preparedStatement.setString(2, b.getAuthor());
           preparedStatement.setString(3, b.getDate());
           preparedStatement.setString(4, b.getGenres());
           preparedStatement.setString(5, b.getCharacters());
           preparedStatement.setString(6, b.getSynopsis());
           preparedStatement.setInt(7, b.getId());

           preparedStatement.executeUpdate();
           preparedStatement.close();
           closeConnection();
       } catch (SQLException se) {
           System.out.println(se);
       }
   }
   public void deleteBook(int id) {
	   openConnection();
	    try 
	    { 
	    	PreparedStatement stmt = conn.prepareStatement("DELETE FROM books WHERE id = ?");
	        stmt.setInt(1, id);
	        stmt.executeUpdate();
	        stmt.close();
	        closeConnection();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	}
   
   public List<Book> searchBooks(String searchStr) {
	    List<Book> matchedBooks = new ArrayList<>();
	    openConnection();
	    try {
	        
	        PreparedStatement stmt = conn.prepareStatement("SELECT * FROM books WHERE title LIKE ? OR author LIKE ? OR date LIKE ? OR genres LIKE ? OR characters LIKE ? OR synopsis LIKE ?");
	        
	        String searchParam = "%" + searchStr + "%";
	        stmt.setString(1, searchParam);
	        stmt.setString(2, searchParam);
	        stmt.setString(3, searchParam);
	        stmt.setString(4, searchParam);
	        stmt.setString(5, searchParam);
	        stmt.setString(6, searchParam);
	        ResultSet rs = stmt.executeQuery();
	        while (rs.next()) {
	            int id = rs.getInt("id");
	            String title = rs.getString("title");
	            String author = rs.getString("author");
	            String date = rs.getString("date");
	            String genres = rs.getString("genres");
	            String characters = rs.getString("characters");
	            String synopsis = rs.getString("synopsis");

	            Book book = new Book(id, title, author, date, genres, characters, synopsis);
	            matchedBooks.add(book);
	        }

	        rs.close();
	        stmt.close();
	        closeConnection();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return matchedBooks;
	}

}
  
   

