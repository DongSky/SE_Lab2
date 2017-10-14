<%@ page language="java" import="java.util.*,java.net.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="lab2.BookInfo,lab2.GetBookInfo" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Book Detail</title>
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
<h1>Book Information</h1>
<br>
<table class="table table-hover">
<thead>
    <tr>
      <th>ISBN</th>
		<th>Title</th>
		<th>Publisher</th>
		<th>Publish Date</th>
		<th>Price</th>
		<th>Author</th>
		<th>Age</th>
		<th>Country</th>
    </tr>
  </thead>
	<%
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html;charset=UTF-8");
    String book_name = request.getParameter("book_name");
    String authorid = request.getParameter("authorid");
    GetBookInfo getBookInfo=new GetBookInfo(book_name,authorid);
    BookInfo info=getBookInfo.FetchInfo();
	%>
	<tr>
	<td><%=info.getIsbn() %></td>
	<td><%=info.getTitle() %></td>
	<td><%=info.getPublisher() %></td>
	<td><%=info.getPublishdate() %></td>
	<td><%=info.getPrice() %></td>
	<td><%=info.getAuthorname() %></td>
	<td><%=info.getAuthorage() %></td>
	<td><%=info.getAuthorcountry() %></td>
	</tr>
</table>
<h3>Some Options</h3>
<a href="DeleteBook.jsp?book_name=<%=info.getTitle() %>&authorid=<%=info.getAuthorid() %>"  class="btn btn-primary">Delete this item</a>
<br><br>
<a href="UpdateBook.jsp?book_name=<%=info.getTitle() %>&authorid=<%=info.getAuthorid() %>"  class="btn btn-primary">Update Information</a>
</body>
</html>