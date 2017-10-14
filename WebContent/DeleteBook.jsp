<%@ page language="java" import="java.util.*,java.net.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="lab2.DeleteBookQuery" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Delete Book</title>
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
<h1>Operation Status</h1>
<br>
<%
request.setCharacterEncoding("UTF-8");
response.setContentType("text/html;charset=UTF-8");
String book_name = request.getParameter("book_name");
String authorid=request.getParameter("authorid");
DeleteBookQuery query=new DeleteBookQuery(book_name,authorid);
int result=query.deleteQuery();
String ans="";
if(result>0){
	ans="Delete succeed";
}
else if(result==0){
	ans="Delete failed";
}
%>
<br>
	<div class="row">
			<div class="col-lg-12">
				<h2>Alerts</h2>
				<div class="alert bg-primary" role="alert"><em class="fa fa-lg fa-warning">&nbsp;</em> <%=ans %> <a href="#" class="pull-right"><em class="fa fa-lg fa-close"></em></a></div>
			</div>
		</div><!--/.row-->		

<br>
<br>
<a href="index.jsp"  class="btn btn-primary" >返回首页</a>
<script src="js/jquery-1.11.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
</body>
</html>