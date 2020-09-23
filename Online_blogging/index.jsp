<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Untitled Document</title>
<style type="text/css">
<!--
.style1 {color: #FF0000}
body {
	background-image: url(img/back.JPG);
}
-->
</style>
</head>

<body>
<table width="749" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FF9F40">
  <!--DWLayoutTable-->
  <tr>
    <td width="4" height="22">&nbsp;</td>
    <td width="363">&nbsp;</td>
    <td width="50">&nbsp;</td>
    <td width="315">&nbsp;</td>
    <td width="4">&nbsp;</td>
    <td width="13">&nbsp;</td>
  </tr>
  <tr>
    <td height="90">&nbsp;</td>
    <td rowspan="3" valign="top"><img src="img/class.jpg" width="267" height="200" /></td>
    <td>&nbsp;</td>
    <td colspan="2" valign="top"><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,19,0" width="240" height="90">
        <param name="movie" value="img/shaadi.swf" />
        <param name="quality" value="high" />
        <embed src="img/shaadi.swf" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="240" height="90"></embed>
    </object></td>
    <td></td>
  </tr>
  
  
  
  <tr>
    <td height="28">&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td height="82">&nbsp;</td>
    <td>&nbsp;</td>
    <td colspan="2" rowspan="2" valign="top"><form id="form1" name="form1" method="post" action="login.jsp">
      <p align="left">
	  <b><font color="blue">
	  <% 
	String m=request.getParameter("msg");
	if(m!=null)
		out.println(m);
 %>
	  </font></b>	  </p>
      <p align="left">User Name: 
        <input type="text" name="un" />
        </p>
      <p align="left">Password:&nbsp;&nbsp; 
        <input type="password" name="pw" />
        </p>
      <p align="left">
        <input type="submit" name="Submit" value="Login" />
        <input type="reset" name="Submit2" value="Reset" />
      </p>
      <p><span class="style1">Not Registered yet?</span> <a href="sign.jsp">Sign Up</a>  </p>
    </form></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td height="99">&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td height="90">&nbsp;</td>
    <td colspan="3" valign="top"><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,19,0" width="728" height="90">
        <param name="movie" value="img/yahoo.swf" />
        <param name="quality" value="high" />
        <embed src="img/yahoo.swf" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="728" height="90"></embed>
    </object></td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>
</body>

</html>
