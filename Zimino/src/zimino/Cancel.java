package zimino;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Cancel
 */
@WebServlet("/Cancel")
public class Cancel extends HttpServlet {

	private static final long serialVersionUID = 1L;
	static final String DB_URL = "jdbc:mysql://localhost/zimino?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";

	// Database credentials
	static final String USER = "root";

	static final String PASS = "password"; //put in your own database password
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Cancel() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
//Get the orderID of items that will be cancelled 
		String cancel_item_orderID[] = request.getParameterValues("cancel_item");

for (int i=0; i< cancel_item_orderID.length; i++)
{
				  System.out.println("Order ID to be cancelled :" +  cancel_item_orderID[i]);
}

//SQL queries : Using two separate sql due to unable to combine two
String customer_del_sql = "DELETE FROM customer WHERE customer_id = ?";  // Delete from customer table
String ordered_del_sql = "DELETE FROM ordered WHERE ordered_id = ?";     // Delete from ordered table

		// Set response content type
		response.setContentType("text/html"); 
		PrintWriter out = response.getWriter();

		try ( Connection conn = DriverManager.getConnection(DB_URL, USER, PASS)   ) {
			// prepare statement for both customer table and ordered table
			//PreparedStatement customer_pstmt[]; 
//PreparedStatement ordered_pstmt[]; 

PreparedStatement [][] pstmt = new PreparedStatement [cancel_item_orderID.length][2];

for(int i = 0; i < cancel_item_orderID.length; i++ ) 
{	
   for(int j =0; j < 2; j++)
   {
   	   if(j==0)
   	   {  
   	      pstmt[i][j] = conn.prepareStatement(customer_del_sql);
   	   }else {
   	      pstmt[i][j] = conn.prepareStatement(ordered_del_sql);
   	   }
   }
} 

//Setting sql string for one or more queries
for (int i=0; i< cancel_item_orderID.length; i++)
{
  for(int j =0; j < 2; j++)
  {
	     pstmt[i][j].setString(1, cancel_item_orderID[i]);
	   }
}

// Execute update
for(int i=0; i < cancel_item_orderID.length; i++)
{
   for(int j =0; j < 2; j++) {
      pstmt[i][j].executeUpdate();
   }
}

			// start html output
			out.println("<!DOCTYPE HTML><html><body>");
			out.println("<!DOCTYPE html>");
			out.println("<html>");
			out.println("<head>");
			out.println("<meta charset='ISO-8859-1'>");
			out.println("<title>View all orders</title>");
			out.println("<link rel='stylesheet' href='zimino_stylesheet.css'> ");
			out.println("</head>");
			out.println("<body>");
			out.println("<header>");
			out.println("");
			out.println("<div class='topnav'>");
			out.println("<nav>");
			out.println("<ul>");
out.println("<li><a href= 'http://localhost:8080/Zimino/welcome.html'>Welcome</a></li>");
out.println("<li><a href= 'http://localhost:8080/Zimino/menu.html' >Menu</a></li>");
out.println("<!--The Reservations does not have a web page. It just links to opentable.com-->");
out.println("<li><a href = 'https://www.opentable.com' > Reservations  </a></li>");
out.println("<li><a href='http://localhost:8080/Zimino/order.jsp'>Order</a></li>");
out.println("<li><a href='http://localhost:8080/Zimino/updateOrder.jsp'>Change Order</a></li>");
out.println("<li><a href='http://localhost:8080/Zimino/cancel.jsp'>Cancel order</a></li>");
out.println("<li><a href='http://localhost:8080/Zimino/ordered'>View all orders</a></li>");
out.println("<li><a href='http://localhost:8080/Zimino/Connect.html'>Connect</a></li>");
			out.println("</ul>");
			out.println("</nav>");
			out.println("</div>");
			out.println("</header>");
			out.println("<br/>");
			out.println("<img src='logo.gif' class='centerpic'>");
			out.println("<body>");
			out.println("</br></br>");
out.println("<div class = \"center\">\r\n");
out.println("<div class = \"LeftText\">");
out.println("<h2>Cancel Order</h2>");
out.println("Orders successfully cancelled");
out.println("</div>");
out.println("</div>");
out.println("   <br/>  <br/>  <br/>  <br/>  <br/>  <br/>   "
+ "<div id = \"footer\" >\n" + 
"   <p>\n" + 
"  Copyright © 2019 Zimino.All Rights Reserved for Shelly Sun, Andrew Bell, Jasper Kolp.\n" + 
"   <a href = \"https://www.facebook.com/Antiche-Sere-Osteria-Enoteca-Bevagna-907749329293919/\" >\n" + 
"  Photography credit: Antiche Sere Osteria Enoteca, Bevagna. </a>  <br/>  <br/>");
			out.println("</div>");
			out.println("</body></html>");

//Closing pstmt 
for(int i=0; i < cancel_item_orderID.length; i++)
{
   for(int j =0; j < 2; j++) {
      pstmt[i][j].close();
   }
}

		} catch (SQLException e) {
			// Handle errors
			e.printStackTrace();
		}

	}

}
