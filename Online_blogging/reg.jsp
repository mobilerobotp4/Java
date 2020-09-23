<%@ page import="bl.*" %>
<%
	String u=request.getParameter("un");
	String p=request.getParameter("pw");
	String fn=request.getParameter("fn");
	String ln=request.getParameter("ln");
	String em=request.getParameter("em");
	String ph=request.getParameter("ph");
	String ab=request.getParameter("abt");
	Jdbc ob=new Jdbc();
	boolean b=ob.reg(u,p,fn+" "+ln,em,ph,ab);
	if(b){ 
		session.setAttribute("user",u);
		%>
		<jsp:forward page="up.jsp"/>
	<% }else { %>
		<jsp:forward page="sign.jsp">
			<jsp:param name="val" value="User already exists"/>
		</jsp:forward>
	<% } %>
	

