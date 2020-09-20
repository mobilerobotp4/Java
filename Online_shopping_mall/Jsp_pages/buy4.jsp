<html><head>
<style type="text/css">

html, body{
scrollbar-face-color:#66ccff;
scrollbar-base-color:#66ccff;
scrollbar-arrow-color:Red;
scrollbar-track-color:#F3F3F3;
scrollbar-shadow-color:#66ccff;
scrollbar-highlight-color:#66ccff;
scrollbar-3dlight-color:#660066;
scrollbar-darkshadow-Color:#660066;
}

</style>
<script language="JavaScript">
var f;
function validate(f)
{
if(f.name.value==""||f.add.value==""|| f.mb.value==""||f.accno.value==""||f.amt.value=="")
{
alert("Please Fill Your Data Properly!");
return 0;
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
if(f.mb.value=="")
alert("Please Type Your Mobile Number!");
}</script></head>
<body background="logo copy.jpg"><center>
<font color="#009999" size="5">
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%! String nop,des,total,in; %>
<%! int sum=0; %>
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
PreparedStatement ps=con.prepareStatement("select * from buy4 where ProductNo=?");%>
<table border="5" bgcolor="#6699CC"><tr><th>Product No <th>description <th>Price <th>Available Item</tr>
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
PreparedStatement ps1=con1.prepareStatement("update buy4 set AvailableItem='"+ai+"' where ProductNo='"+nop+"'");
ps1.executeUpdate();
}
}}%></table><%
out.println("<br><center> TOTAL  PRICES......: "+sum+"/-</center><br><br>");
//session.setMaxInactiveInterval(15);
session.setAttribute("amount",new Integer(sum)); 
sum=0;
 %>
 
 <form action="http://localhost:8090/shopping/form1.jsp" method="post" name="f1"><center>
               -:FILL UP YOUR FORM:-<br><br>
 Name :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp<input type="text" name="name"><br><br>
 Address :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp<input type="text" name="add"><br><br>
 Mobile :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp<input type="text" name="mb" onKeyPress="check(this.form)"><br><br>
 Account No :&nbsp;&nbsp;<input type="password" name="accno"><br><br>
 User Name :&nbsp;&nbsp;<input type="text" name="un"><br><br>
 Product No :&nbsp;&nbsp;<input type="text" name="pn"><br><br>
 Description :&nbsp;&nbsp;<input type="text" name="des"><br><br>
 Amount :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp<input type="text" name="amt"><br><br><br>
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp<input type="submit" value="Submit" onClick="return validate(this.form)"></center>
 </form><% }
 else
 {
 out.println("<center><br> Please Registered Your Name!<br><br> You May go to the Registration Page</center>");
 out.println("<form action='http://localhost:8090/shopping/index/regis.html' method=post>");
 out.println("<br><br><input type='submit' value='Go to the Registration Page'>");
 out.println("</form>");}
 %></font></center>
 </body></html>										