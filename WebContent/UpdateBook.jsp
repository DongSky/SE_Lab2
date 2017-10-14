<%@ page language="java" import="java.util.*,java.net.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="lab2.BookInfo,lab2.GetBookInfo,lab2.UpdateBookQuery" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Update Book Information</title>
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
<%
request.setCharacterEncoding("UTF-8");
response.setContentType("text/html;charset=UTF-8");
String book_name = request.getParameter("book_name");
String authorid=request.getParameter("authorid");
GetBookInfo getinfo=new GetBookInfo(book_name,authorid);
BookInfo info=getinfo.FetchInfo();
%>
   <div class="row">
       <div class="col-xs-10 col-xs-offset-1 col-sm-8 col-sm-offset-2 col-md-4 col-md-offset-4">
           <div class="login-panel panel panel-default">
               <div class="panel-heading">Update Book Information</div>
               <div class="panel-body">
                  <form action="updatebookaction">
                       <fieldset>
                           <div class="form-group">
                               <input type="text" name="isbn" value="<%=info.getIsbn()%>"  placeholder="ISBN" class="form-control"/><br/>
                           </div>
                           <div class="form-group">
                               <input type="text" name="title" value="<%=info.getTitle()%>"  placeholder="Title" class="form-control"/><br/>
                           </div>
                           <div class="form-group">
                               <input type="text" name="publisher" value="<%=info.getPublisher()%>" placeholder="Publisher" class="form-control"/><br/>
                           </div>
                           <div class="form-group">
                               <input type="text" name="publishdate" value="<%=info.getPublishdate()%>" placeholder="Publish date" class="form-control"/><br/>
                           </div>
                           <div class="form-group">
                               <input type="text" name="price" value="<%=info.getPrice()%>" placeholder="Price" class="form-control"/><br/>
                           </div>
                           <div class="form-group">
                               <input type="text" name="authorname" value="<%=info.getAuthorname()%>" placeholder="Author name" class="form-control"/><br/>
                           </div>
                           <div class="form-group">
                               <input type="text" name="authorage" value="<%=info.getAuthorage()%>" placeholder="Author age" class="form-control"/><br/>
                           </div>
                           <div class="form-group">
                               <input type="text" name="authorcountry" value="<%=info.getAuthorcountry()%>" placeholder="Author country" class="form-control"/><br/>
                           </div>
                           <div>
                           <input type="submit" value="Update" class="btn btn-primary"/>
                           </div>
                           <br/>
                           <div>
							<a href="index.jsp" class="btn btn-primary">返回首页</a>
							</div>
                       </fieldset>
                   </form>
               </div>
           </div>
       </div><!-- /.col-->
   </div><!-- /.row -->
<br>
<br>

<script src="js/jquery-1.11.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
</body>
</html>