<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>pickup</title>
</head>

<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
        margin: 0;
        padding: 0;
    }
    
    .container {
        max-width: 800px;
        margin: 50px auto;
        padding: 20px;
        background-color: #fff;
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }
    
    h1 {
        text-align: center;
        color: #333;
    }
    
    .p
    {
    text-align:center;
    }
    
    .confirmation  {
      margin-right:20px;
        margin-bottom: 25px;
       
    }
    .button1 {
      display: inline-block;
      padding: 10px 20px;
      background-color: #4CAF50;
      color: white;
      font-size: 16px;
      border: none;
      border-radius: 5px;
      cursor: pointer;
      text-align: center;
      text-decoration: none;
      transition: background-color 0.3s;
      margin-left:15px;
    }
    
    .button1:hover {
      background-color: #45a049;
    }
    
    </style>
<body>

<div class="container">
    <h1>Booking Confirmation</h1>
    <div class="confirmation">
        <%
        String location=request.getParameter("location"); 
        String fname=request.getParameter("name");
       
    
    String phoneParam = request.getParameter("phone");
    long phone = 0;
    if (phoneParam != null && !phoneParam.isEmpty()) {
        phone = Long.parseLong(phoneParam);
    }

        String email=request.getParameter("email");
        String aname=request.getParameter("address");
        String dname=request.getParameter("donate");
      
        
    String quantityParam = request.getParameter("quantity");
    int quant = 0; // Default value or handle differently if necessary
    if (quantityParam != null && !quantityParam.isEmpty()) {
        quant = Integer.parseInt(quantityParam);
    }


        String datee=request.getParameter("date");
        String timee=request.getParameter("time");
        
            Connection con = null;
            try {
                Class.forName("oracle.jdbc.driver.OracleDriver");
                con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "oracle");
                PreparedStatement pst = con.prepareStatement("insert into booking values(?,?,?,?,?,?,?,?,?)");
                pst.setString(1,location);
                pst.setString(2,fname);
                pst.setLong(3,phone);
                pst.setString(4,email);
                pst.setString(5,aname);
                pst.setString(6,dname);
                pst.setInt(7,quant);
                pst.setString(8,datee);
                // pst.setDate(8, sqlDate);
                pst.setString(9,timee);
                pst.executeUpdate();

                ResultSet rs = null;
                Statement st = con.createStatement();
                rs = st.executeQuery("select * from bookapickup");
      
        
           
            } catch (Exception ex) {
                ex.printStackTrace();
            } finally {
                try {
                    if (con != null) {
                        con.close();
                    }
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
        %>
        <form>
            <p class="p">Thank you for your booking!</p>
            <p class="confirmation"><h4>Name: <%= fname %></h4></p>
            <p class="confirmation"><h4>Email: <%= email %></h4></p>
            <p class="confirmation"><h4>Donating: <%= dname %></h4></p>
            <p class="confirmation"><h4>Quantity:  <%= String.valueOf(quant) %></h4></p>
            <p class="confirmation"><h4>Date:  <%= String.valueOf(datee) %></h4></p>
            <p class="confirmation"><h4>Time:  <%= String.valueOf(timee) %></h4></p>
            <input type="submit" value="Submit" id="pay" name="finalsubmit" class="button1">
            <input type="submit" value="Cancel" id="cancel" name="cancel" class="button1">
        </form>
    </div>
</div>
<%
    if ("finalsubmit".equals(request.getParameter("finalsubmit"))) {
        try {
            Connection subCon = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "oracle");
            PreparedStatement subPst = subCon.prepareStatement("insert into finalSubmit values(?,?,?,?,?,?)");
            subPst.setString(1, fname);
            subPst.setString(2, email);
            subPst.setString(3, dname);
            subPst.setInt(4, quant);
            subPst.setString(5, datee);
            subPst.setString(6, timee);
            subPst.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
%>


</body>
</html>