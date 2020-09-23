<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Untitled Document</title>
<style type="text/css">
<!--
.style1 {
	color: #FF0000;
	font-weight: bold;
	font-size: large;
}
.style2 {
	font-size: medium;
	color: #0000FF;
}
-->
</style>
</head>

<body>
<% String un=(String)session.getAttribute("user"); %>
<table width="610" border="0" cellpadding="0" cellspacing="0" align="center">
  <!--DWLayoutTable-->
  <tr>
    <td width="104" rowspan="2" valign="top">
	<img src="img/<%= un %>.jpg" height="95" width="104"/>	</td>
    <td width="325" rowspan="2" valign="top"><p class="style1">Welcome <%= un %></p>
      <p class="style1">&nbsp;</p>
    <p class="style2"><a href="profile.jsp">Change Profile</a> &nbsp;| &nbsp;&nbsp;<a href="up.jsp">Update Photo</a> &nbsp;| &nbsp;Change Pasword &nbsp;| &nbsp;<a href="logout.jsp">Logout</a></p></td>
  <td width="171" height="34" valign="top"><%= new java.util.Date() %></td>
  <td width="10">&nbsp;</td>
  </tr>
  <tr>
    <td height="54">&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>
</body>
</html>
