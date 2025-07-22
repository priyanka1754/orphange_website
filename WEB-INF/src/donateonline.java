import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
public class donateonline extends HttpServlet
{
public void doPost(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
{
PrintWriter out=res.getWriter();
String fname=req.getParameter("name");
long phone=Long.parseLong(req.getParameter("mobile"));
String aname=req.getParameter("address");
String email=req.getParameter("email");
int amount=Integer.parseInt(req.getParameter("donation-amount"));

res.setContentType("text/html");
try{
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","oracle");
PreparedStatement pst=con.prepareStatement("insert into donate values(?,?,?,?,?)");
pst.setString(1,fname);
pst.setLong(2,phone);
pst.setString(3,aname);
pst.setString(4,email);
pst.setInt(5,amount);


int i=pst.executeUpdate();
if(i==1)
{
RequestDispatcher rd=req.getRequestDispatcher("donateonline.html");
rd.forward(req,res);
}
}
catch(Exception e)
{
out.println(e);
}
}
}
