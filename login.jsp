<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%@ page import="java.sql.*" %> 
<%@ page import="javax.swing.*"%> 
<%
	String btnval=request.getParameter("b1");
	if(btnval.equalsIgnoreCase("Login"))
	{
		String t1=request.getParameter("t1");
		String t2=request.getParameter("t2");
		int f=0;
		try
		{
  			ResultSet rs;
  			Class.forName("oracle.jdbc.driver.OracleDriver");
  			Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "clinic", "clinic");
  			Statement smt=conn.createStatement();
  			rs=smt.executeQuery("select * from login");
			while(rs.next())
			{
	
					if(rs.getString(1).equalsIgnoreCase(t1))
					{
						if(rs.getString(2).equals(t2))
						{
							f=1;
							break;
						}
					}
			}
			if(f==1)
				out.println("<script>window.open('menu.html') </script>");
			else
				out.println("<script> alert('worng id or password') </script>");
		 }
  		 catch(Exception ex)
  		 {
       				JOptionPane.showMessageDialog(null,ex);
  		 }
   }//End of All login
%>
</body>
</html>