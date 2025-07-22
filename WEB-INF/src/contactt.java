import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
public class contactt extends HttpServlet
{
public void doPost(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
{
PrintWriter out=res.getWriter();
String fname=req.getParameter("name");
String email=req.getParameter("email");
String message=req.getParameter("message");


res.setContentType("text/html");
try{
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","oracle");
PreparedStatement pst=con.prepareStatement("insert into contact values(?,?,?)");
pst.setString(1,fname);
pst.setString(2,email);
pst.setString(3,message);

int i=pst.executeUpdate();
if(i==1)
{
    out.println("registered successful");

RequestDispatcher rd=req.getRequestDispatcher("contact.html");
rd.forward(req,res);
}
con.close();
}
catch(Exception e)
{
out.println(e);
}
}
}
