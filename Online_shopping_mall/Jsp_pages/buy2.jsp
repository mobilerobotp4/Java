<html><head><title>Just fill the form</title>
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

.style1 {color: #FFFFFF}
.style2 {color: #F6F6FC}
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
<body background="logo copy.jpg">
<span class="style1"></span>
<center>
<font size="5">
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%! String nop,des,total,in; %>
<%! int sum=0;int ai=0; %>
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
PreparedStatement ps=con.prepareStatement("select * from buy2 where ProductNo=?");%>
</font>
<div align="left"><table border="5" bgcolor="#6699CC"><tr><th><font color="#333399" size="5">Product No </font>
  <th><font color="#333399" size="5">description </font>
  <th><font color="#333399" size="5">Price </font>
  <th><font color="#333399" size="5">Available Item</font></tr>
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
  <tr align="center" style="ariel"><td><font color="#333399" size="5"><%=nop %></font>
  <td><font color="#333399" size="5"><%=des %></font>
  <td><font color="#333399" size="5"><%=total %>/-</font>
  <td><font color="#333399" size="5"><%= in %></font></td></tr><%
sum+=Integer.parseInt(total);
ai=Integer.parseInt(in);
ai=ai-1;
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
Connection con1=DriverManager.getConnection("jdbc:odbc:db");
PreparedStatement ps1=con1.prepareStatement("update buy2 set AvailableItem='"+ai+"' where ProductNo='"+nop+"'");
ps1.executeUpdate();
}
}}%></table>
</div>
<span class="style2"><font color="#333399" size="5">
<%
out.println("<br><div align=left> TOTAL  PRICES......: "+sum+"/-</div><br><br>");
//session.setMaxInactiveInterval(15);
session.setAttribute("amount1",new Integer(sum)); 
sum=0;
 %>
 
 </font></span>
<form action="http://localhost:8090/shopping/form1.jsp" method="post" name="f1" class="style2">
  <center>
    <font color="#333399" size="5">      -:FILL UP YOUR FORM:-<br>
      <br>
      Name :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <input type="text" name="name">
      <br>
      <br>
      Address :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <input type="text" name="add">
      <br>
      <br>
      Mobile :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <input type="text" name="mb" onKeyPress="check(this.form)">
      <br>
      <br>
      Account No :&nbsp;&nbsp;
      <input type="password" name="accno">
      <br>
      <br>
      User Name :&nbsp;&nbsp;
      <input type="text" name="un">
      <br>
      <br>
      Product No :&nbsp;&nbsp;
      <input type="text" name="pn">
      <br>
      <br>
      Description :&nbsp;&nbsp;
      <input type="text" name="des">
      <br>
      <br>
      Amount :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <input type="text" name="amt">
      <br>
      <br>
      <br>
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp
  <input type="submit" value="SUBMIT" onClick="return validate(this.form)">
  &nbsp;&nbsp;
  <input type="reset" value="RESET">
      </font>
  </center>
 </form>
<span class="style2"><font color="#333399" size="5">
<% }
 else
 {
 out.println("<center><br>Please Registered Your Name or Login The Page!<br><br> You May go to the Home Page</center>");
 out.println("<form action='http://localhost:8090/shopping/index/index.html' method=post>");
 out.println("<br><br><input type='submit' value='Go to the Login Page'>");
 out.println("</form>");}
// session.removeAttribute("nm");
// session.removeAttribute("pw"); 
 //session.removeAttribute("sum");
 %>
</font></span>
</center>
</body></html>										