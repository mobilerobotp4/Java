<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*,bl.*" errorPage="" %>
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
	font-size: x-large;
}
.style2 {color: #0000FF; font-weight: bold; font-size: large; }
-->
</style>
</head>
<jsp:include page="head.jsp"/>
<body>
<% String un=(String)session.getAttribute("user");
	Jdbc ob=new Jdbc();
	ResultSet rs=ob.getUser(un);
	rs.next();
 %>
<form id="form1" name="form1" method="post" action="profilecng.jsp">
  <p align="center" class="style1">Change Profile for <%= un %> </p>
  <p align="center" class="style2">
  <% 
  		String m=request.getParameter("val");
		if(m!=null)
			out.println(m);
   %>
  
  </p>
  
  
  <p> Name
    <input name="fn" type="text" id="fn" value="<%= rs.getString(3) %>" />
</p>
  <p>Email
    <input name="em" type="text" id="em" value="<%= rs.getString(4) %>"  />
  </p>
  <p>Phone
    <input name="ph" type="text" id="ph" value="<%= rs.getString(5) %>"  />
  </p>
  <p>About
    <textarea name="abt" id="abt"><%= rs.getString(6) %> </textarea>
  </p>
  <p>
    <input type="submit" name="Submit" value="Sign Up" />
    <input type="reset" name="Submit2" value="Reset" />
  </p>
</form>
</body>
</html>
<jsp:include page="foot.jsp"/>