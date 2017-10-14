<%@ page language="java" import="java.util.*,java.net.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="lab2.Title,lab2.GetBookTitle" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Book List</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/font-awesome.min.css" rel="stylesheet">
<link href="css/datepicker3.css" rel="stylesheet">
<link href="css/styles.css" rel="stylesheet">
	<!--[if lt IE 9]>
	<script src="js/html5shiv.js"></script>
	<script src="js/respond.min.js"></script>
	<![endif]-->
</head>
<body>
<nav class="navbar navbar-custom navbar-fixed-top" role="navigation">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#sidebar-collapse"><span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span></button>
				<a class="navbar-brand" href="#"><span>Library</span>System</a>
				
			</div>
		</div><!-- /.container-fluid -->
	</nav>
   <br>
   <h1>Book List</h1>
<table class="table table-hover">
	<thead>
    <tr>
      <th>Book Name</th>
      <th>Detail</th>
    </tr>
  </thead>
	<%
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
	    String author_name = request.getParameter("author_name");
		GetBookTitle getBookTitle=new GetBookTitle(author_name);
		ArrayList<Title> list=getBookTitle.readBookTitle();
		for(Title tit:list){
	%>
			<tr>
				<td><%=tit.getName() %></td>
				<td><a href="BookDetail.jsp?book_name=<%=tit.getName() %>&authorid=<%=tit.getAuthorid() %>" >Detail</a></td>
			</tr>
	<%
		}
	%>
</table>
<br>
<a href="index.jsp"  class="btn btn-primary" >返回首页</a>
<script src="js/jquery-1.11.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
</body>
</html>