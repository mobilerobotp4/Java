<%@ page import="javax.raj.ardent.*" %>
<%
	String u=(String)session.getAttribute("user");
	Upload ob=new Upload(request,"img",u+".jpg");
%>
<jsp:forward page="home.jsp"/>