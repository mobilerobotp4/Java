<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*,bl.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Untitled Document</title>
<style type="text/css">
<!--
.style1 {color: #FF0000}
-->
</style>
</head>

<body>
<jsp:include page="head.jsp"/>
<br />
<table width="703" border="0" cellpadding="0" cellspacing="0" align="center">
  <!--DWLayoutTable-->
  <tr>
    <td width="201" height="247" valign="top"><p>List of Topics:</p>
    <p>
	<% Jdbc ob=new Jdbc();
	java.util.Vector v=ob.getTopic();
	for(int i=0;i<v.size();i++) {
		String top=(String)v.get(i);
		%>
		<a href="blog.jsp?blog=<%=top%>"><%= top %></a><br />
			
	<% } %>
	</p>
    <form id="form1" name="form1" method="post" action="blog.jsp">
      Not in the List??
      <input name="blog" type="text" id="blog" />
      <input type="submit" name="Submit" value="Add" />

        </form>    <p>&nbsp;</p></td>
    <td width="502" valign="top"><p>&nbsp;</p>
      <form id="form2" name="form2" method="post" action="">
        Search for a Topic:
        <input name="s" type="text" id="s" />
        <input type="submit" name="Submit2" value="Search" />

       </form>
      <p>
	  <% 
	  	String s=request.getParameter("s");
		if(s!=null){ %>
			Search Result for <%= s %>:<br />
			<%
				v=ob.getTopicSearch(s);
				for(int i=0;i<v.size();i++) {
					String top=(String)v.get(i);
					%>
					<a href="blog.jsp?blog=<%=top%>"><%= top %></a><br />
			
					<% } 		
		}
	     %>
	  </p>
      <p><hr /></p>
      <p class="style1">Search in the web: 
      <form action="http://www.google.com/search" method="get" target="_blank">
Your Search <input type="text" name="q">
<input type="submit" value="Search">
</form>
	  
	  </p></td>
  </tr>
</table>
</body>
</html>
<jsp:include page="foot.jsp"/>