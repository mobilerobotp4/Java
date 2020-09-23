<%@ page import="bl.*" %>
<%
	String un=(String)session.getAttribute("user");
	String n=request.getParameter("fn");
	String em=request.getParameter("em");
	String ph=request.getParameter("ph");
	String ab=request.getParameter("abt");
	Jdbc ob=new Jdbc();
	boolean b=ob.update(un,n,em,ph,ab);
	if(b){ 
		%>
		<jsp:forward page="home.jsp"/>
	<% }else { %>
		<jsp:forward page="profile.jsp">
			<jsp:param name="val" value="Temporary Problem, Try Later, Please check all data"/>
		</jsp:forward>
	<% } %>
	

