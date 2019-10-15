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
@WebServlet("/Select_cancel")
public class Select_cancel extends HttpServlet {

	private static final long serialVersionUID = 1L;
	static final String DB_URL = "jdbc:mysql://localhost/zimino?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";

	// Database credentials
	static final String USER = "root";

	static final String PASS = "password"; //put in your own database password
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Select_cancel() {
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
System.out.println("Server restart");	

		String first = request.getParameter("first");
		String last = request.getParameter("last");

System.out.println("Orders from " + first + " " + last);

String sql = "SELECT CONCAT(first, \" \", last) AS name, drink, appetizers, main_course, dessert, tip, o.ordered_id\n" + 
"FROM customer c RIGHT JOIN ordered o\n" + 
"	ON c.customer_id = o.ordered_id\n" + 
"WHERE first=? AND last=?";

		// Set response content type
		response.setContentType("text/html"); 
		PrintWriter out = response.getWriter();
		
		// get input data from form
		//String name = request.getParameter("name");

		try ( Connection conn = DriverManager.getConnection(DB_URL, USER, PASS)   ) {
			// prepare select
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,  first); 
pstmt.setString(2, last);
			ResultSet rs = pstmt.executeQuery();

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
			out.println("</br>");
			out.println("<body>");
out.println("</br></br>");
out.println("<div class = \"center\">\r\n");
out.println("<div class = \"LeftText\">");
out.println("<h2>Cancel Order</h2>");
			
			// begin table and  column headings
			out.println("<div>");
			out.println("<form action=\"Cancel\" method=\"POST\">");
			out.println("<table border=1 class='centerTable'>");
			out.println("<tr>");
			out.println("<th>Check</th>");
			out.println("<th>Order ID</th>");
			out.println("<th>Name</th>");
			out.println("<th>drink</th><th>appetizer</th>");
			out.println("<th>main_course</th><th>dessert</th>");
			out.println("<th>tip</th>");
			out.println("</tr>");
			
			// create row with data for each row from result set
			while (rs.next()) {
				out.println("<tr>");
out.println("<td><input type=\"checkbox\" name=\"cancel_item\" value=\"" + rs.getString("ordered_id") + "\"></td>");
				out.println("<td>" + rs.getString("ordered_id") + "</td>");
				out.println("<td>" + rs.getString("name") + "</td>");
				out.println("<td>" + rs.getString("drink") + "</td>");
				out.println("<td>" + rs.getString("appetizers") + "</td>");
				out.println("<td>" + rs.getString("main_course") + "</td>");
				out.println("<td>" + rs.getString("dessert") + "</td>");
				out.println("<td>" + rs.getInt("tip") + "</td>");
				out.println("</tr>");
			}
			rs.close();
			
			// end of table 
			out.println("</table>");
out.println("<input type = \"submit\" value = \"Submit\" >");
out.println("</form>");
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

			pstmt.close();


		} catch (SQLException e) {
			// Handle errors
			e.printStackTrace();
		}

	}

}
