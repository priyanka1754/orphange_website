<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> Admin Dashboard</title>
    <style>
        /* Basic styling for demonstration purposes */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }
        header {
            background-color: #333;
            color: #fff;
            padding: 10px;
            text-align: center;
        }
        .container {
            max-width: 1200px;
            margin: 20px auto;
            padding: 0 20px;
        }
        .dashboard {
            background-color: #f4f4f4;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
        }
        h2 {
            margin-top: 0;
        }
        .city-options {
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }
        .city-option {
            margin: 0 10px;
            cursor: pointer;
            padding: 5px 10px;
            border: 1px solid #333;
            border-radius: 5px;
            background-color: #fff;
            transition: background-color 0.3s ease;
        }
        .city-option:hover {
            background-color: black;
            color: white;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            padding: 10px;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #333;
            color: #fff;
        }
        tr:hover {
            background-color: #f9f9f9;
        }
    </style>
</head>
<body>
    <header>
        <h1> Admin Dashboard</h1>
	<form action="index.html " method="post">
            <input type="submit" value="Logout">
        </form>

    </header>
    <div class="container">
        <div class="dashboard">
           
            <div class="city-options">
                <form>
                    <input type="submit" value="user booking details" id="all" name="button">
                    <input type="submit" value="donations" id="Gujarat" name="donations">
                    <input type="submit" value="contactUs Details" id="Mumbai" name="contactUs Details">
                    
		    <input type="submit" value="Registrations" id="Registrations" name="Registrations">
                </form>
            </div>
            <%
                String bc = request.getParameter("button");
                if (bc == null || bc.isEmpty()) {
            %>
            <div id="transportationDetails">
                
            </div>
            <%
                } else {
                    Class.forName("oracle.jdbc.driver.OracleDriver");
                    Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "oracle");
                    Statement st = con.createStatement();
                    ResultSet rs = null;
                    if (bc != null && bc.equals("user booking details")) {
                      
                        rs = st.executeQuery("select * from bookapickup");
                    }
            %>
            <div id="transportationDetails">
                <table id="transportationDetails">
                    <tr>
                        <th>Location</th>
                        <th>Name</th>
                        <th>Phone</th>
                        <th>Mail</th>
                        <th>Address</th>
                        <th>Donating</th>
                        <th>Quantity</th>
                        <th>Donation Date</th>
                        <th>Donation Time</th>
                    </tr>
                    <% 
                    if (rs != null){ 
                    while (rs.next()) { %>
                        <tr>
                            <td><%= rs.getString(1) %></td>
                            <td><%= rs.getString(2) %></td>
                            <td><%= rs.getString(3) %></td>
                            <td><%= rs.getString(4) %></td>
                            <td><%= rs.getString(5) %></td>
                            <td><%= rs.getString(6) %></td>
                            <td><%= rs.getString(7) %></td>
                            <td><%= rs.getString(8) %></td>
                            <td><%= rs.getString(9) %></td>
                        </tr>
                    <% }
                     } %>
                </table>
            </div>
            <% } %>
		<%
                String r = request.getParameter("Registrations");
                if (r == null || r.isEmpty()) {
            %>
            <div id="registrationdetails">
                
            </div>
            <%
                } else {
                    Class.forName("oracle.jdbc.driver.OracleDriver");
                    Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "oracle");
                    Statement s = con.createStatement();
                    ResultSet rss = null;
		    if (r.equals("Registrations")) {
                        rss = s.executeQuery("select * from registration");
	            }
		
%> <div id="registrationdetails">
                <table id="registrationdetails">
                    <tr>
                        <th>Name</th>
                        <th>Mail-id</th>
                        <th>Password</th>
                        <th>confrim password</th>
                        <th>Phoneno</th>
                        <th>city</th>
                        <th>state</th>
                        <th>zip</th>
                    </tr>
                    <% while (rss.next()) { %>
                        <tr>
                            <td><%= rss.getString(1) %></td>
                            <td><%= rss.getString(2) %></td>
                            <td><%= rss.getString(3) %></td>
                            <td><%= rss.getString(4) %></td>
                            <td><%= rss.getString(5) %></td>
                            <td><%= rss.getString(6) %></td>
                            <td><%= rss.getString(7) %></td>
                            <td><%= rss.getString(8) %></td>
    
                        </tr>
                    <% } %>
                </table>
            </div>
            <% } %>


            <%
                String rb = request.getParameter("donations");
                if (rb == null || rb.isEmpty()) {
            %>
            <div id="registrationdetails">
                
            </div>
            <%
                } else {
                    Class.forName("oracle.jdbc.driver.OracleDriver");
                    Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "oracle");
                    Statement sp = con.createStatement();
                    ResultSet rsss = null;
		    if (rb.equals("donations")) {
                        rsss = sp.executeQuery("select * from donate");
	            }
		
%> <div id="registrationdetails">
                <table id="registrationdetails">
                    <tr>
                        <th>Name</th>
                        <th>Phoneno</th>
                        <th>Address</th>
                        <th>Mail-id</th>
                        <th>amount</th>
                    </tr>
                    <% 
                    if (rsss != null) {
                        while (rsss.next()) { %>
                        <tr>
                            <td><%= rsss.getString(1) %></td>
                            <td><%= rsss.getString(2) %></td>
                            <td><%= rsss.getString(3) %></td>
                            <td><%= rsss.getString(4) %></td>
                            <td><%= rsss.getString(5) %></td>
                           
    
                        </tr>
                    <% }
                     } %>
                </table>
            </div>
            <% } %>


            <%
            String b = request.getParameter("contactUs Details");
            if (b == null || b.isEmpty()) {
        %>
        <div id="transportationDetails">
            
        </div>
        <%
            } else {
                Class.forName("oracle.jdbc.driver.OracleDriver");
                Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "oracle");
                Statement stp = con.createStatement();
                ResultSet rsp = null;
                if (b.equals("contactUs Details")) {
                    rsp = stp.executeQuery("select * from contact");
                }
        %>
        <div id="transportationDetails">
            <table id="transportationDetails">
                <tr>
                    
                    <th>Name</th>
                    <th>Mail</th>
                    <th>Message</th>
                    
                </tr>
                <% 
                if (rsp != null) {
                    while (rsp.next()) { %>
                    <tr>
                        <td><%= rsp.getString(1) %></td>
                        <td><%= rsp.getString(2) %></td>
                        <td><%= rsp.getString(3) %></td>
                      
                    </tr>
                <% }
                 } %>
            </table>
        </div>
        <% } %>

        </div>
    </div>
</body>
</html>
