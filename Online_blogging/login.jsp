<%@ page import="bl.*" %>
<% 
	Jdbc ob=new Jdbc();
	String un=request.getParameter("un");
	String pw=request.getParameter("pw");
	boolean b=ob.login(un,pw);
	if(b){
		session.setAttribute("user",un);
 %>
 	<jsp:forward page="home.jsp"/>
	<% }else { %>
	<jsp:forward page="index.jsp">
		<jsp:param name="msg" 
		value="Invalid User Name or Password"/>
	</jsp:forward>
<% } %>





