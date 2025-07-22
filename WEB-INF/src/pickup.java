import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.Date;
public class pickup extends HttpServlet
{
public void doPost(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
{
PrintWriter out=res.getWriter();
String location=req.getParameter("location");
String fname=req.getParameter("name");
long phone=Long.parseLong(req.getParameter("phone"));
String email=req.getParameter("email");
String aname=req.getParameter("address");
String dname=req.getParameter("donate");
int quant=Integer.parseInt(req.getParameter("quantity"));
String datee=req.getParameter("date");
String timee=req.getParameter("time");

res.setContentType("text/html");
try{
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","oracle");
PreparedStatement pst=con.prepareStatement("insert into bookapickup values(?,?,?,?,?,?,?,?,?)");

// SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
// Date date = sdf.parse(datee);
// java.sql.Date sqlDate = new java.sql.Date(date.getTime());

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
int i=pst.executeUpdate();
if(i==1)
{
out.println("<h3>Successfully Booked your slot</h3>");
RequestDispatcher rd=req.getRequestDispatcher("pickup.html");
rd.forward(req,res);
}
}
catch(Exception e)
{
out.println(e);
}
}
}
