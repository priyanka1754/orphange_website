import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
public class Login extends GenericServlet
{
public void service(ServletRequest req,ServletResponse res) throws ServletException, IOException
{
PrintWriter out=res.getWriter();
String user=req.getParameter("username");
String pass=req.getParameter("password");
res.setContentType("text/html");
try{
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","oracle");
Statement s=con.createStatement();
ResultSet rs=s.executeQuery("select * from registration");
int flag=0;

// if(user.equals("admin") && pass.equals("Admin123")){
//     RequestDispatcher rd=req.getRequestDispatcher("admin.jsp");
// rd.forward(req,res);
// }
while(rs.next())
{
if(user.equals(rs.getString(1)) && pass.equals(rs.getString(3)))
{
flag=1;
break;
}
}
if(flag==1)
{
RequestDispatcher rd=req.getRequestDispatcher("user.jsp");
rd.forward(req,res);
}
else
{
out.println("<h3>Sorry! wrong credentials</h3>");
RequestDispatcher rd=req.getRequestDispatcher("signin.html");
rd.include(req,res);
}
con.close();
}
catch(Exception e)
{
out.println(e);
}
}
}

