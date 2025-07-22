<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>userdonatepage</title>
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
            background-color: #f7e9fa;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .btn-submit {
            padding: 16px;
            border-radius: 25px;
            border: none;
            background-color: rgb(133, 248, 113);
            cursor: pointer;
        }
        label {
            display: block;
            margin-top: 20px;
        }
        input, textarea, select {
            width: 50%;
            padding: 10px;
            margin-top: 5px;
        }
        input[type="submit"] {
            margin-top: 20px;
            width: 20%;
        }
        input[type="button"] {
            width: 20%;
        }
    </style>
    <script src="script1.js"></script>
</head>
<body>
    <% 
    String usern = (String) session.getAttribute("Individual");
    
    %>
   
 
    <div class="container">
        <label for="donation-amount">Donation Amount:</label><br>
        <form onsubmit="submitForm()">
            <input type="number" id="donation-amount" name="donation-amount" min="1" required><br><br><br>
            <center>
                <button type="submit" class="btn-submit" value="Proceed to Pay" name="proceed">Proceed to pay</button>
            </center>
        </form>
        
        <h3>Our Bank Details:</h3>
        Name of Bank: SBI Bank<br>
        Branch Name: NUZVID<br>
        Holder's Name: Angles Orphanage<br>
        Account no: 20117707349<br>
        IFSC Code: SBIN0203594<br><br><br>
        <center><h4>THANK YOU :) </h4></center>
        

        <%
        
        String pro = request.getParameter("proceed");
        if (pro!= null &&!pro.isEmpty()) {
            try {
                int amount = Integer.parseInt(request.getParameter("donation-amount"));
                Class.forName("oracle.jdbc.driver.OracleDriver");
                Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "oracle");
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery("select * from donate WHERE name = '" + usern + "'");
                
                // Create PreparedStatement outside the loop
               
                String a=null,c=null,d=null;
                long b=0;
                while (rs.next()) {
                     a = rs.getString(1);
                     b = rs.getLong(2);
                     c = rs.getString(3);
                     d = rs.getString(4);
                }   
                PreparedStatement pst = con.prepareStatement("insert into donate values(?,?,?,?,?)");       
                    // Set values and execute the PreparedStatement inside the loop
                    pst.setString(1, a);
                    pst.setLong(2, b);
                    pst.setString(3, c);
                    pst.setString(4, d);
                    pst.setInt(5, amount);
                    pst.executeUpdate();
                
                
                rs.close();
                st.close();
                con.close();
            } catch (SQLException e) {
                out.println("Error: " + e.getMessage());
            }
            
        }
    %>
        
    </div>
</body>
</html>
