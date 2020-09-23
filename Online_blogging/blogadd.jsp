<%@ page import="bl.*" %> 
<%
	String un=(String)session.getAttribute("user");
	String top=request.getParameter("topic");
	String msg=request.getParameter("msg");
	Jdbc ob=new Jdbc();
	boolean b=ob.blog(un,top,msg);
	try{
		Thread.sleep(2000);
	}
	catch(Exception e){}
%>
<jsp:forward page="blog.jsp">
	<jsp:param name="blog" value="<%=top%>"/>
</jsp:forward>