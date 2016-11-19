import java.sql.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
//test
import java.util.Scanner; 

// If you are looking for Java data structures, these are highly useful.
// Remember that an important part of your mark is for doing as much in SQL (not Java) as you can.
// Solutions that use only or mostly Java will not received a high mark.  
import java.util.ArrayList; 
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Set;

public class Assignment2 {

   // A connection to the database
   Connection connection;

   Assignment2() throws SQLException {
      try {
         Class.forName("org.postgresql.Driver");
      } catch (ClassNotFoundException e) {
         e.printStackTrace();
      }
   }

  /**
   * Connects and sets the search path.
   *
   * Establishes a connection to be used for this session, assigning it to
   * the instance variable 'connection'.  In addition, sets the search
   * path to bnb.
   *
   * @param  url       the url for the database
   * @param  username  the username to connect to the database
   * @param  password  the password to connect to the database
   * @return           true if connecting is successful, false otherwise
   */
   public boolean connectDB(String URL, String username, String password) {
      // Implement this method!
	  try {
		this.connection = DriverManager.getConnection(URL, username, password);
		String setpath = "SET search_path TO bnb, public;";
		PreparedStatement statement = this.connection.prepareStatement(setpath);
		statement.executeQuery();
		return true;
	  } catch (SQLException se) {
			// TODO Auto-generated catch block
		 System.err.println("SQL Exception." +
	            "<Message>: " + se.getMessage());
	  }
      return false;
   }

  /**
   * Closes the database connection.
   *
   * @return true if the closing was successful, false otherwise
   */
   public boolean disconnectDB() {
      // Implement this method!
	  try {
		this.connection.close();
		return true;
	} catch (SQLException se) {
		// TODO Auto-generated catch block
		System.out.println("2");
		System.err.println("SQL Exception." +
                "<Message>: " + se.getMessage());
	}
      return false;
   }

   /**
    * Returns the 10 most similar homeowners based on traveller reviews. 
    *
    * Does so by using Cosine Similarity: the dot product between the columns
    * representing different homeowners. If there is a tie for the 10th 
    * homeowner (only the 10th), more than 10 records may be returned. 
    *
    * @param  homeownerID   id of the homeowner
    * @return               a list of the 10 most similar homeowners
    */
   public ArrayList homeownerRecommendation(int homeownerID) {
      // Implement this method!
	  
      return null;
   }

   /**
    * Records the fact that a booking request has been accepted by a 
    * homeowner. 
    *
    * If a booking request was made and the corresponding booking has not been
    * recorded, records it by adding a row to the Booking table, and returns 
    * true. Otherwise, returns false. 
    *
    * @param  requestID  id of the booking request
    * @param  start      start date for the booking
    * @param  numNights  number of nights booked
    * @param  price      amount paid to the homeowner
    * @return            true if the operation was successful, false otherwise
 * @throws SQLException 
    */
   public boolean booking(int requestId, Date start, int numNights, int price) throws SQLException {
      // Implement this method!
	   
	  // Query1 finds if there exists this request. If exists, reports its listingId.
	  String query1= "SELECT startdate, listingId, travelerId, numGuests FROM Bookingrequest "
	  		+ "WHERE requestId = ?;";
      PreparedStatement statement1 = this.connection.prepareStatement(query1);
      statement1.setInt(1, requestId);
//      statement1.setDate(2, new java.sql.Date(start.getTime()));
//      statement1.setInt(3, price);
      
      ResultSet result1 = statement1.executeQuery();
      if (result1.next()) {
    	  java.sql.Date date = result1.getDate(1);
    	  int listingId = result1.getInt(2);
    	  int travelerId = result1.getInt(3);
    	  int numGuests = result1.getInt(4);
    	  // Query2 finds if corresponding booking already exists in Booking.
    	  String query2 = "SELECT * FROM Booking WHERE listingId = ? AND startdate = ?;";
          PreparedStatement statement2 = this.connection.prepareStatement(query2);
          statement2.setInt(1, listingId);
          statement2.setDate(2, date);
          
          ResultSet result2 = statement2.executeQuery();
          if(!result2.next()) {
        	  // Insert a new Booking if Booking does not exist in Booking.
        	  String query3 = "INSERT INTO Booking VALUES(?, ?, ?, ?, ?, ?);";
        	  PreparedStatement statement3 = this.connection.prepareStatement(query3);
        	  statement3.setInt(1, listingId);
        	  statement3.setDate(2, date);
        	  statement3.setInt(3, travelerId);
        	  statement3.setInt(4, numNights);
        	  statement3.setInt(5, numGuests);
        	  statement3.setInt(6, price);
        	  
        	  statement3.execute();
        	  return true;
          }
      }
      
      return false; 
   }

   public static void main(String[] args) {
      // You can put testing code in here. It will not affect our autotester.
      System.out.println("Boo!");
      Assignment2 a2;
      try {
		    a2 = new Assignment2();
		    String URL = "jdbc:postgresql://localhost:5432/csc343h-chenj209";
		    a2.connectDB(URL, "chenj209", "Chenjianda9512");
		    SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		    java.util.Date start;
		    System.out.println("These are requests:");
		    String query4 = "SELECT * FROM BookingRequest";
	        PreparedStatement statement4 = a2.connection.prepareStatement(query4);
	        ResultSet requests = statement4.executeQuery();
	        
	        while (requests.next()) {
	        	System.out.println("requestId: " + requests.getInt(1) + " "
	        	+ "travelerId: " + requests.getInt(2) + " "
	        	+ "listingId: " + requests.getInt(3)+ " "
	        	+ "startdate: " + formatter.format(requests.getDate(4)) + " "
	        	+ "numNights: " + requests.getInt(5) + " "
	        	+ "numGuests: " + requests.getInt(6) + " "
	        	+ "offerprice: " + requests.getInt(7));
	        }
	        
		    Scanner scan = new Scanner(System.in);
		    System.out.println("enter requestid:");
		    int requestid = scan.nextInt();
		    System.out.println("enter startdate:");
		    String startdate = scan.next();
		    System.out.println("enter numNights:");
		    int numNights = scan.nextInt();
		    System.out.println("enter price:");
		    int price = scan.nextInt();
		    scan.close();
			try {
				start = formatter.parse(startdate);
				if (a2.booking(requestid, start, numNights, price)) {
					System.out.println("Booked successfully at price: " + price);
				} else {
					System.out.println("Cannot book.");
				}
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
      } catch (SQLException e) {
		  // TODO Auto-generated catch block
    	  System.out.println("1");
		  System.err.println("SQL Exception." +
	            "<Message>: " + e.getMessage());
      }
      
      
      
   }

}
