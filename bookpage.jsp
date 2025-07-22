<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>userbookpage</title>
    <style>

body {
    font-family: Arial, sans-serif;
    background-color: #f4f4f4;
    margin: 0;
    padding: 0;
    background-image: url(https://png.pngtree.com/thumb_back/fh260/background/20200714/pngtree-modern-double-color-futuristic-neon-background-image_351866.jpg);
}

        .container {
    max-width: 500px;
    margin: 50px auto;
    padding: 20px;
    background-color: #f3bef6;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

select {
  width: 100%;
  padding: 5px;
  border: 1px solid #ddd;
  border-radius: 5px;
}

input[type="number"] {
  width: 100%;
  padding: 5px;
  border: 1px solid #ddd;
  border-radius: 5px;
}

input[type="date"] {
  width: 100%;
  padding: 5px;
  border: 1px solid #ddd;
  border-radius: 5px;
}

input[type="time"] {
  width: 100%;
  padding: 5px;
  border: 1px solid #ddd;
  border-radius: 5px;
}

button[type="submit"] {
  cursor: pointer;
  padding: 10px;
  border-radius: 25px;
  border-color: rgb(254, 167, 36);
}

button[type="submit"]:hover{
  background-color: rgb(247, 164, 39);
}


    </style>
    <script src="script1.js"></script>
</head>
<body>
  <% 
  String userp = (String) session.getAttribute("Individual");
  %>
  <form onsubmit="submitForm()">
    <div class="container">
    <p>Donation details:</p>
    <select name="donatee" required>
      <option>Food</option>
      <option>Clothes</option>
      <option>Accessiors</option>
      <option>Books</option>
    </select>
    
    <label for="quantity">Quantity:</label><br>
    <input type="number" id="quantity" name="quantity" min="1" max="100" required><br>
    <p>Schedule your pickup</p>
    <label for="date">Date:</label><br>
    <input type="date" id="date" name="date" required><br>
    <label for="time">Time:</label><br>
    <input type="time" id="time" name="time" required><br>
    <br>
    <center><button type="submit" value="bookapickupp" name="book">Submit</button>
    
    </form>
        <%
        String pro = request.getParameter("book");
        if (pro!= null &&!pro.isEmpty()) {
            try {
                String dname=request.getParameter("donatee");
                int quant=Integer.parseInt(request.getParameter("quantity"));
                String datee=request.getParameter("date");
                String timee=request.getParameter("time");
                Class.forName("oracle.jdbc.driver.OracleDriver");
                Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "oracle");
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery("select * from bookapickup WHERE name = '" + userp + "'");
                
                String a=null,b=null,d=null,e=null;
                long c=0;
                    while (rs.next()) {
                        a = rs.getString(1);
                       b = rs.getString(2);
                        c = rs.getLong(3);
                        d = rs.getString(4);
                         e = rs.getString(5);
                    }   
                    
                    PreparedStatement pst = con.prepareStatement("insert into bookapickup values(?,?,?,?,?,?,?,?,?)");
                        pst.setString(1, a);
                        pst.setString(2, b);
                        pst.setLong(3, c);
                        pst.setString(4, d);
                        pst.setString(5, e);
                        pst.setString(6, dname);
                        pst.setInt(7, quant);
                        pst.setString(8, datee);
                        pst.setString(9, timee);
                        
                        pst.executeUpdate();
                    
                    rs.close();
                
                st.close();
                con.close();
            }catch (SQLException e) {
                
                e.printStackTrace();
            }
        }
    %>
    
</div>
</body>
</html>