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
	font-size: xx-large;
}
.style2 {color: #0000FF}
-->
</style>
</head>

<body>
<jsp:include page="head.jsp"/>
<% 
	String blog=request.getParameter("blog");
	bl.Jdbc ob=new bl.Jdbc();
	ResultSet rs=ob.getBlogs(blog);
 %>
<div align="center" class="style1">
  <p>Blogs for <span class="style2"><%= blog %></span></p>
</div>
<form action="blogadd.jsp" method="post">
<input type="hidden" name="topic" value="<%= blog %>" />
<p>
  <textarea name="msg" cols="80" rows="5" id="msg"></textarea>
</p>
<p>
  <input type="submit" name="Submit" value="Publish" />
</p>
</form>
<table border="1" align="center">
<% while(rs.next()){ 
	int id=rs.getInt(1);
	String un=rs.getString(2);
	String msg=rs.getString(4);
	String dt=rs.getDate(5).toString();
	%>
	<tr>
		<td width="100" height="115"><img src="img/<%= un %>.jpg" width="100" height="100" /><br />
			<center><%= un %></center></td>
		<td width="400" valign="top"><p align="right"><%= dt %></p><%= msg %></td>
	</tr>
	<% } %>
</table>
</body>
</html>
<jsp:include page="foot.jsp"/>