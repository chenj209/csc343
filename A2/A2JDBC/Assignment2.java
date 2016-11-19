import java.sql.*;
import java.util.Date;

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
	  String query1= "SELECT startdate, listingId, travelerId, numGuests FROM Bookingrequests "
	  		+ "WHERE requestId = ? AND startdate = ? AND price = ?;";
      PreparedStatement statement1 = this.connection.prepareStatement(query1);
      statement1.setInt(1, requestId);
      statement1.setDate(2, new java.sql.Date(start.getTime()));
      statement1.setInt(3, price);
      
      ResultSet result1 = statement1.executeQuery();
      if (result1.next()) {
    	  java.sql.Date date = result1.getDate(0);
    	  int listingId = result1.getInt(1);
    	  int travelerId = result1.getInt(2);
    	  int numGuests = result1.getInt(3);
    	  // Query2 finds if corresponding booking already exists in Booking.
    	  String query2 = "SELECT * FROM Booking WHERE listingId = ? AND startdate = ?;";
          PreparedStatement statement2 = this.connection.prepareStatement(query2);
          statement2.setInt(1, listingId);
          statement2.setDate(2, date);
          
          ResultSet result2 = statement2.executeQuery();
          if(!result2.next()) {
        	  // Insert a new Booking if Booking does not exist in Booking.
        	  String query3 = "INSERT INTO Booing VALUES(?, ?, ?, ?, ?, ?);";
        	  PreparedStatement statement3 = this.connection.prepareStatement(query3);
        	  statement3.setInt(1, listingId);
        	  statement3.setDate(2, date);
        	  statement3.setInt(3, travelerId);
        	  statement3.setInt(4, numNights);
        	  statement3.setInt(5, numGuests);
        	  statement3.setInt(6, price);
        	  
        	  statement3.executeQuery();
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
      } catch (SQLException e) {
		// TODO Auto-generated catch block
		System.err.println("SQL Exception." +
	            "<Message>: " + e.getMessage());
      }
      
      string URL = "jdbc:postgresql://localhost:5432/csc343h-";
      a2.connectDB(, wucheng7, tW697196);
      
   }

}