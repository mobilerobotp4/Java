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
	font-size: x-large;
}
.style2 {color: #0000FF; font-weight: bold; font-size: large; }
-->
</style>
</head>

<body>
<form id="form1" name="form1" method="post" action="reg.jsp">
  <p align="center" class="style1">Registration Page </p>
  <p align="center" class="style2">
  <% 
  		String m=request.getParameter("val");
		if(m!=null)
			out.println(m);
   %>
  
  </p>
  <p>User Name: 
    <input name="un" type="text" id="un" />
  </p>
  <p>Password
    <input name="pw" type="password" id="pw" />
</p>
  <p>First Name
    <input name="fn" type="text" id="fn" />
</p>
  <p>Last Name
    <input name="ln" type="text" id="ln" />
  </p>
  <p>Email
    <input name="em" type="text" id="em" />
  </p>
  <p>Phone
    <input name="ph" type="text" id="ph" />
  </p>
  <p>About
    <textarea name="abt" id="abt"></textarea>
  </p>
  <p>
    <input type="submit" name="Submit" value="Sign Up" />
    <input type="reset" name="Submit2" value="Reset" />
  </p>
</form>
</body>
</html>
