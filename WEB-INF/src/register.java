import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
public class register extends HttpServlet
{
public void doPost(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
{
PrintWriter out=res.getWriter();
String fname=req.getParameter("fullName");
String email=req.getParameter("email");
String passname=req.getParameter("password");
String confpass=req.getParameter("confirmPassword");
long phone=Long.parseLong(req.getParameter("phone"));
String cname=req.getParameter("city");
String sname=req.getParameter("state");
int zip=Integer.parseInt(req.getParameter("zipCode"));

res.setContentType("text/html");
try{
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","oracle");
PreparedStatement pst=con.prepareStatement("insert into registration values(?,?,?,?,?,?,?,?)");
pst.setString(1,fname);
pst.setString(2,email);
pst.setString(3,passname);
pst.setString(4,confpass);
pst.setLong(5,phone);
pst.setString(6,cname);
pst.setString(7,sname);
pst.setInt(8,zip);
int i=pst.executeUpdate();
if(i==1)
{
out.println("<h3>Registered Successful</h3>");
RequestDispatcher rd=req.getRequestDispatcher("signin.html");
rd.forward(req,res);
}
}
catch(Exception e)
{
out.println(e);
}
}
}
