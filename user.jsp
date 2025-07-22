 <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>User Page</title>

<style>


    body {
    font-family: Arial, sans-serif;
    background-color: #f4f4f4;
    margin: 0;
    padding: 0;
    background-image: url(https://png.pngtree.com/thumb_back/fh260/background/20200714/pngtree-modern-double-color-futuristic-neon-background-image_351866.jpg);
}

.container {
    max-width: 800px;
    margin: 50px auto;
    padding: 20px;
    background-color: #f7d1f5;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

h1 {
    color: #333;
}

.user-info {
    margin-top: 20px;
}

.user-info p {
    margin-bottom: 10px;
}

.user-info span {
    font-weight: bold;
    color: #007bff;
}

#book{
    border:none;
    padding: 15px;
    gap: 50px;
    cursor: pointer;
    margin: 25px;
    border-radius: 25px;
    background-color:#f7d1f5;
}

#book:hover{
    background-color: aquamarine;
}

#donate:hover{
    background-color: aquamarine;
}

#donate{
    border:none;
    padding: 15px;
    gap: 50px;
    cursor: pointer;
    margin: 25px;
    border-radius: 25px;
    background-color:#f7d1f5;
}

#userimg{
    width:40px;
    height: 40px;
    margin:0px 0px 0px 730px;
    cursor: pointer;
}
.dropdown {
  position: relative;
  display: inline-block;
}

.profile-pic-btn {
  background-color: transparent;
  border: none;
  cursor: pointer;
  position: relative; /* Add this line */
}
.confirmation  {
  margin-right:20px;
    margin-bottom: 25px;
   
}

.profile-pic-btn img {
  width: 50px;
  height: 50px;
  border-radius: 50%;
}

.dropdown-content {
  display: none;
  position: absolute;
  background-color: #f9f9f9;
  min-width: 160px;
  box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);
  z-index: 1;
  top: 60px; /* Adjust this value to position it below the profile picture */
  right: 0; /* Adjust this value to position it properly */
}

.dropdown-content a {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
}

.dropdown-content a:hover {
  background-color: #f1f1f1;
}

.dropdown:hover .dropdown-content {
  display: block;
}


</style>
</head>

<body>

    <div class="container">
    <% String name=request.getParameter("username");
    out.println("Hey!.." + name);
    session.setAttribute("Individual",name);
    %>

    <div class="dropdown">
        <button class="profile-pic-btn">
            <img src="https://t4.ftcdn.net/jpg/04/83/90/95/360_F_483909569_OI4LKNeFgHwvvVju60fejLd9gj43dIcd.jpg" id="userimg">
          </button>
    
    <div class="dropdown-content" id="profilePicBtn">
        <a href="#" onclick="showPersonalInfo()">Personal Info</a>
        <a href="#" onclick="accessdonations()">AccessoriesDonations</a>                  
       <a href="#" onclick="showdonations()">MoneyDonations</a>
        <a href="index.html">Logout</a>
      </div>
      </div>

    <h2>
        welcome <%=name %>
    </h2>
    <div>
        we are so glad that you are a part of our family
    </div>
    <div>
        you can access to all your donations and profile details here...
    </div>
    <div>
        Wanna Donate something??<br>
       <a href="bookpage.jsp"> <input type="submit" value="BookaPickUp" id="book"></a>
        <a href="donatepage.jsp"> <input type="submit" value="Donate Online" id="donate"></a>
    </div>


   <% 
    String personalInfo = request.getParameter("personal");
    if (personalInfo != null && personalInfo.equals("personal")) {
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "oracle");
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("SELECT * FROM registration WHERE fname = '" + name + "'");
            if (rs.next()) {
                String a = rs.getString(1);
                String b = rs.getString(2);
                String c = rs.getString(3); 
                long d = rs.getLong(5);
                String e = rs.getString(6);
                String f = rs.getString(7);
                int g = rs.getInt(8);
    %>
                <center><h3>Personal Info</h3></center>
                <form>
                    <p class="confirmation"><h4>Name: <%= a %></h4></p>
                    <p class="confirmation"><h4>Email: <%= b %></h4></p>
                    <p class="confirmation"><h4>Password: <%= c %></h4></p>
                    <p class="confirmation"><h4>Phone: <%= d %></h4></p>
                    <p class="confirmation"><h4>City: <%= e %></h4></p>
                    <p class="confirmation"><h4>State: <%= f %></h4></p>
                    <p class="confirmation"><h4>Zipcode: <%= g %></h4></p>
                </form>
    <%
            }
            rs.close();
            st.close();
            con.close();
        } catch(Exception ex) {
            out.println("Error: " + ex.getMessage());
        }
    }
    %>

    <% 
    String donationInfo = request.getParameter("donation");
    if (donationInfo != null && donationInfo.equals("donation")) {
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "oracle");
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("SELECT * FROM donate WHERE name = '" + name + "'");
            
              while(rs.next()){
               
                int p = rs.getInt(5);
    %>
                <div class="donation">
                    <h4><%= name %>! You have donated rupees <%= p %></h4>
                    <% } %>
                    <h4>Thankyou for your donations..<br>
                    Have a nice day</h4>

                </div>
   
        <%
            
        
            
            rs.close();
            st.close();
            con.close();
            } catch(Exception ex) {
            out.println("Error: " + ex.getMessage());
            }
        }
          %> 

          <% 
    String acdonationInfo = request.getParameter("acdonation");
    if (acdonationInfo != null && acdonationInfo.equals("acdonation")) {
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "oracle");
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("SELECT * FROM bookapickup WHERE name = '" + name + "'");
            while (rs.next()) {
                String z = rs.getString(6);
                int x = rs.getInt(7);
                String y = rs.getString(8);
                
    %>
                <div class="donation">
                    <h4><%= name %>! You have donated <%= z %> in the quantity of <%= x %>kgs on <%= y %></h4>
                    <% } %>
                    <h4>Thankyou for your donations..<br>
                    Have a nice day</h4>

                </div>
   
        <%
            
            
            rs.close();
            st.close();
            con.close();
            } catch(Exception ex) {
            out.println("Error: " + ex.getMessage());
            }
        }
          %> 
</div>
    <script>
        function showPersonalInfo() {
            location.href = 'user.jsp?personal=personal&username=<%=name%>';
        }
        function showdonations(){
            location.href='user.jsp?donation=donation&username=<%=name%>'
        }
        function accessdonations(){
            location.href='user.jsp?acdonation=acdonation&username=<%=name%>'
        }
    </script>
    
</body>
</html> 

