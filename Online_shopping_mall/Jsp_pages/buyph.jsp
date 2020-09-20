<html><head>
<title>Add To Cart</title>
<style type="text/css">

html, body{
scrollbar-face-color:#EBF5FF;
scrollbar-base-color:#EBF5FF;
scrollbar-arrow-color:pink;
scrollbar-track-color:#F3F3F3;
scrollbar-shadow-color:#EBF5FF;
scrollbar-highlight-color:#EBF5FF;
scrollbar-3dlight-color:#78AAFF;
scrollbar-darkshadow-Color:#78AAFF;
}

</style>
<script language="JavaScript">
var f;
function validate(f)
{
if(f.name.value==""||f.add.value==""|| f.mb.value==""||f.accno.value==""||f.amt.value=="")
{
alert("Please Fill Your Data Properly!");
return false;
}
else
alert("Thank you !");
}
function check(f)
{
var a=window.event.keyCode;
if(!(a>=48 && a<=57))
{alert("Type Mobile Number in Digits!");}
if(f.mb.value.length>10)
alert("Wrong Mobile Number");
if(f.mb.value==" ")
alert("Please Type Your Mobile Number!");
}</script></head>
<body background="logo copy.jpg"><center>
<font color="#990000" size="5">
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%! String nop,des,total,in; %>
<%! int sum=0; int ai=0; %>
<% 
 String[] np;
np=request.getParameterValues("check");
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
Connection con=DriverManager.getConnection("jdbc:odbc:db");
String nm=(String)session.getAttribute("nm");
String pw=(String)session.getAttribute("pw");
//out.println("Your Name is:"+nm);
//out.println("Your Password is:"+pw);
if(session.getAttribute("nm")!=null || session.getAttribute("pw")!=null)
{
PreparedStatement ps=con.prepareStatement("select * from buyph where ProductNo=?");%>
<font color="#003366"><div align="left"><table border="5" bgcolor="#6699CC"><tr><th>Product No <th>description <th>Price <th>Available Item</tr>
<% for(int i=0;i<np.length;i++)
{
if(np!=null)
{
ps.setString(1,np[i]);
ResultSet rs=ps.executeQuery();
while(rs.next())
{
String nop=rs.getString(1);
String des=rs.getString(2);
String total=rs.getString(3);
String in=rs.getString(4);
%>
<tr align="center" style="ariel"><td><%=nop %><td><%=des %><td><%=total %>/-<td><%= in %></td></tr><%
sum+=Integer.parseInt(total);
ai=Integer.parseInt(in);
ai=ai-1;
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
Connection con1=DriverManager.getConnection("jdbc:odbc:db");
PreparedStatement ps1=con1.prepareStatement("update buyph set AvailableItem='"+ai+"' where ProductNo='"+nop+"'");
ps1.executeUpdate();
}
}}%></table></div><%
out.println("<br><div align=left> TOTAL  PRICES......: "+sum+"/-</div><br><br>");
//session.setMaxInactiveInterval(15);
session.setAttribute("amount",new Integer(sum)); 
sum=0;
 %>
 
 <form action="http://localhost:8090/shopping/formph.jsp" method="post" name="f1"><center>
               -:FILL UP YOUR FORM:-<br><br>
 Name :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="name"><br><br>
 Address :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="add"><br><br>
 Mobile :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="mb" onKeyPress="check(this.form)"><br><br>
 Account No :&nbsp;&nbsp;<input type="password" name="accno"><br><br>
 User Name :&nbsp;&nbsp;<input type="text" name="un"><br><br>
 Product No :&nbsp;&nbsp;<input type="text" name="pn"><br><br>
 Description :&nbsp;&nbsp;<input type="text" name="des"><br><br>
 Amount :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="amt"><br><br><br>
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp<input type="submit" value="SUBMIT" onClick="return validate(this.form)">&nbsp;&nbsp;<input type="reset" value="RESET"></center></font>
 </form><% }
 else
 {
 out.println("<center><br> Please Registered Your Name or Login The Page!<br><br> You May go to the Home Page</center>");
 out.println("<form action='http://localhost:8090/shopping/index/index.html' method=post>");
 out.println("<br><br><input type='submit' value='Go to the Login Page'>");
 out.println("</form>");}
  %></font></center>
 </body></html>										