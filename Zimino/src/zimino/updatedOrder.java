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
 * Servlet implementation class updated Order
 */
@WebServlet("/updatedOrder")
public class updatedOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	// database URL
	static final String DB_URL = "jdbc:mysql://localhost/zimino";

	// Database credentials
	static final String USER = "root";
	static final String PASS = "password";
	

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		

		// Sql statements

//This sql statement selects the customer's name from the customer's table and the type of food items
//that the customer can choice to order from the ordered table.
String sql ="select  c.customer_id, o.ordered_id, c.first, c.last, o.drink, o.appetizers, o.main_course, o.dessert, o.tip\r\n" + 
"FROM customer c inner JOIN ordered o on c.customer_id = o.ordered_id";

//The ordered table holds all the customer's orders.
//This sql statement will update the customer's order based the items he/she already ordered
//and the tip the customer placed. 
//The sql statement is used to replace the old order with the customer's new order. 
String usql =(" UPDATE ordered set drink=?, appetizers=?, main_course=?, dessert=?, tip =? \r\n" + 
" where drink=? and appetizers=? and main_course= ? and dessert=? and tip =? ");

//The customer table stores the customer's first and last name. This will update the customer's name.
//The customer's first and last name is being updated simultaneous as the ordered table 
//because this will update the new order and replace the old order 
//at the row with the old order's primary key value and foreign key value. So, the update 
//query dose not create a new row with in the database with a different primary key value
//and foreign key value for the updating an existing row.
String upsql ="UPDATE customer set first =?, last =? where first =? and last =?";

		//Sets the the responsive type to html 
		response.setContentType("text/html"); 
		PrintWriter out = response.getWriter();

		try ( Connection conn = DriverManager.getConnection(DB_URL, USER, PASS)) {
		

//This gets the input data from the form on the updateOrder.jsp

			// Get data from form and convert to int for the tip the user enters.
int New_tip= Integer.parseInt(request.getParameter("New_tip"));
		String New_first_name = request.getParameter("New_first_name");
		String New_last_name = request.getParameter("New_last_name");
		String New_drink = request.getParameter("New_drink");
		String New_appetizers = request.getParameter("New_appetizers");
		String New_main_course = request.getParameter("New_main_course");
		String New_dessert = request.getParameter("New_dessert");
String first = request.getParameter("first");
		String last = request.getParameter("last");
		String drink = request.getParameter("drink");
		String appetizers = request.getParameter("appetizers");
		String main_course = request.getParameter("main_course");
		String dessert = request.getParameter("dessert");
			int tipped = Integer.parseInt (request.getParameter("tipped"));

//These are setter statements used for the sql query for execution. 
PreparedStatement pstmt = conn.prepareStatement(usql);
pstmt.setString (1, New_drink);
			pstmt.setString(2, New_appetizers);
			pstmt.setString(3, New_main_course);
			pstmt.setString(4, New_dessert);
pstmt.setInt(5, New_tip);
pstmt.setString (6, drink);
			pstmt.setString(7, appetizers);
			pstmt.setString(8, main_course);
			pstmt.setString(9, dessert);
pstmt.setInt(10, tipped);
pstmt.executeUpdate();

pstmt =  conn.prepareStatement(upsql);
pstmt.setString(1, New_first_name);
			pstmt.setString(2, New_last_name);
pstmt.setString(3, first);
			pstmt.setString(4, last);
pstmt.executeUpdate();

			pstmt= conn.prepareStatement(sql);
ResultSet rs = pstmt.executeQuery(sql); 

out.println("<!DOCTYPE HTML><html><body>");
out.println("<title>Menu</title>\r\n" + 
"<link rel=\"stylesheet\" href=\"zimino_stylesheet.css\"> \r\n" + 
"</head>\r\n" + 
"<body>\r\n" + 
"<header>\r\n" + 
"\r\n" + 
"<div class=\"topnav\">\r\n" + 
"<nav>\r\n" + 
"<ul>\r\n" + 
"  <li><a href= \"http://localhost:8080/Zimino/welcome.html\">Welcome</a></li>\r\n" + 
"  <li><a href= \"http://localhost:8080/Zimino/meun.html\" >Menu</a></li>\r\n" + 
"      <li><a href = \"https://www.opentable.com\" > Reservations  </a></li>"+
"  <li><a href=\"http://localhost:8080/Zimino/order.jsp\">Order</a></li>\r\n" + 
" <li><a href=\"http://localhost:8080/Zimino/updateOrder.jsp\">Change Order</a></li>"+
"<li><a href='http://localhost:8080/Zimino/cancel.jsp'>Cancel order</a></li>"+
"<li><a href='http://localhost:8080/Zimino/ordered'>View all orders</a></li>"+
"  <li><a href=\"http://localhost:8080/Zimino/Connect.html\">Connect</a></li>\r\n" + 
"</ul>\r\n" + 
"</nav>\r\n" + 
"</div>\r\n" + 
"</header>\r\n" + 
"<br/>\r\n" + 
"<img src=\"logo.gif\" class=\"centerpic\">\r\n" + 
"<br/>\r\n" + 
"<img src=\"food2.jpg\" class=\"centerpic2\">\r\n" + 
"<br/><br/>"+ 
"<div class = \"center\">\r\n" + 
"<div class = \"LeftText\">"+
"<h1 style = \"font-size:100%;\" > Your order has been updated. Thank you! </h1>\r\n" + 
"<table border=1>\r\n" + 
"<tr>\r\n" + 
"<td>First Name</td><td>Last Name</td><td>Drink</td><td>Appetizer</td><td>Main course</td><td>Dessert</td>\r\n" + 
"</tr>");

//This table will display the updated customer's name and the updated customer's order.
while (rs.next()) {
out.println("<tr>");
out.println("<td>" + rs.getString("c.first") + "</td>");
out.println("<td>" + rs.getString("c.last") + "</td>");
out.println("<td>" + rs.getString("o.drink") + "</td>");
out.println("<td>" + rs.getString("o.appetizers") + "</td>");
out.println("<td>" + rs.getString("o.main_course") + "</td>");
out.println("<td>" + rs.getString("o.dessert") + "</td>");
out.println("</tr>");
}
rs.close();
out.println("</table>");



out.println("</div></div>\r\n" + 
"<br/>\r\n" + 
"<br/>\r\n" + 
"\r\n" + 
"<div id=\"footer\">\r\n" + 
"<p> Copyright � 2019 Zimino. All Rights Reserved for Shelly Sun, Andrew Bell, Jasper Kolp.\r\n" + 
" <a href = \"https://www.facebook.com/Antiche-Sere-Osteria-Enoteca-Bevagna-907749329293919/\">\r\n" + 
" Photography credit: Antiche Sere Osteria Enoteca, Bevagna.</a><br/><br/>\r\n" + 
"  </div>");
			out.println("</body></html>");
			
						 pstmt.close();
			} catch (SQLException e) {
				// Handle errors
				e.printStackTrace();
			} 
	}
}