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
//appoint all search
if(btnval.equalsIgnoreCase("Allsearch"))
{
	try
	{
  		ResultSet rs;
  		Class.forName("oracle.jdbc.driver.OracleDriver");
  		Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "clinic", "clinic");
  		Statement smt=conn.createStatement();
  		rs=smt.executeQuery("select * from appoint");
%>
 		<table border=1>
 		<tr>
 					<th>appoint Id</th>
 					<th>appoint Name</th>
 					<th>appoint Type</th>
 					<th>appoint desc1</th>
 					<th>appoint date1</th>
 					<th>Doctor Id</th>
 		 	
 	 	</tr>
<%
		while(rs.next())
		{
%>
			    <tr>
					<th><%=rs.getString(1)%></th>
					<th><%=rs.getString(2)%></th>
					<th><%=rs.getString(3)%></th>
					<th><%=rs.getString(4)%></th>
					<th><%=rs.getString(5)%></th>
					<th><%=rs.getString(6)%></th>
				</tr>
			<%}%>
			<input type=button value="Print" onclick=window.print()>
			</table>
<%		
  }
  catch(Exception ex)
  {
       JOptionPane.showMessageDialog(null,ex);
  }
}
//End of All search
%>

<%
if(btnval.equalsIgnoreCase("Psearch"))
{
	String t1=request.getParameter("t1");
	try
	{
  		ResultSet rs;
  		Class.forName("oracle.jdbc.driver.OracleDriver");
  		Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "clinic", "clinic");
  		Statement smt=conn.createStatement();
  		rs=smt.executeQuery("select * from appoint where id='"+t1+"' ");
%>
 		<table border=1>
 		<tr>
 					<th>appoint Id</th>
 					<th>appoint Name</th>
 					<th>appoint Type</th>
 					<th>appoint desc1</th>
 					<th>appoint date1</th>
 					<th>Doctor Id</th>
 		 	
 	 	</tr>
		<%
		while(rs.next())
		{
			%>
			    <tr>
					<th><%=rs.getString(1)%></th>
					<th><%=rs.getString(2)%></th>
					<th><%=rs.getString(3)%></th>
					<th><%=rs.getString(4)%></th>
					<th><%=rs.getString(5)%></th>
					<th><%=rs.getString(6)%></th>
				</tr>
			<%}%>
			<input type=button value="Print" onclick=window.print()>
			</table>
<%		
  }
  catch(Exception ex)
  {
       JOptionPane.showMessageDialog(null,ex);
  }
}//end of psearch
	if(btnval.equalsIgnoreCase("save"))
	{
		String t1=request.getParameter("t1");
		String t2=request.getParameter("t2");
		String t3=request.getParameter("t3");
		String t4=request.getParameter("t4");
		String t5=request.getParameter("t5");
		String t6=request.getParameter("t6");
		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "clinic", "clinic");
			PreparedStatement psmt=conn.prepareStatement("insert into appoint values(?,?,?,?,?,?)");
			psmt.setString(1,t1);
			psmt.setString(2,t2);
			psmt.setString(3,t3);
			psmt.setString(4,t4);
			psmt.setString(5,t5);
			psmt.setString(6,t6);
			psmt.executeQuery();
			out.println("<script>alert('Record Saved......')</script>");
		}
		catch(Exception e)
		{
			out.println(e.toString());
		}
	}//End of save
	// delete coding
	if(btnval.equalsIgnoreCase("delete"))
	{
		String t1=request.getParameter("t1");
	
		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "clinic", "clinic");
			PreparedStatement psmt=conn.prepareStatement("delete from appoint where id=?");
			psmt.setString(1,t1);
		
			psmt.executeQuery();
			out.println("<script>alert('Record deleted......')</script>");
		}
		catch(Exception e)
		{
			out.println(e.toString());
		}
	}//End of delete
	if(btnval.equalsIgnoreCase("update"))
	{
		String t1=request.getParameter("t1");
		String t2=request.getParameter("t2");
		String t3=request.getParameter("t3");
		String t4=request.getParameter("t4");
		String t5=request.getParameter("t5");
		String t6=request.getParameter("t6");
		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "clinic", "clinic");
			PreparedStatement psmt=conn.prepareStatement("update appoint set nm=?,type=?,desc1=?,date1=?,doc_id=? where id=?");
			psmt.setString(6,t1);
			psmt.setString(1,t2);
			psmt.setString(2,t3);
			psmt.setString(3,t4);
			psmt.setString(4,t5);
			psmt.setString(5,t6);
			psmt.executeQuery();
			out.println("<script>alert('Record updated......')</script>");
		}
		catch(Exception e)
		{
			out.println(e.toString());
		}
	}//End of update
%>
</body>
</html>