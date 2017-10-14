<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
   <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>MainPage of Library System</title>
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
   <div class="row">
      <div class="col-xs-10 col-xs-offset-1 col-sm-8 col-sm-offset-2 col-md-4 col-md-offset-4">
          <div class="login-panel panel panel-default">
              <div class="panel-heading">Welcome Test Env</div>
              <div class="panel-body">
                  <form action="hello">
                      <fieldset>
                          <div class="form-group">
                              <input type="text" placeholder="Please enter your name" class="form-control" name="name"/><br/>
                          </div>
                          <input type="submit" value="Say Hello" class="btn btn-primary"/>
                      </fieldset>
                  </form>
              </div>
          </div>
      </div><!-- /.col-->
  </div><!-- /.row -->
  <br>
  <h1></h1>
  
  <div class="row">
      <div class="col-xs-10 col-xs-offset-1 col-sm-8 col-sm-offset-2 col-md-4 col-md-offset-4">
          <div class="login-panel panel panel-default">
              <div class="panel-heading">Search Books via Author Name</div>
              <div class="panel-body">
                  <form action="searchByName">
                      <fieldset>
                          <div class="form-group">
                              <input type="text" name="author_name" id="author_name" placeholder="Please enter author name" class="form-control" /><br/>
                          </div>
                          <input type="button" value="Search" onclick="location.href='BookQuery.jsp?author_name='+document.all['author_name'].value" class="btn btn-primary"/>
                      </fieldset>
                  </form>
              </div>
          </div>
      </div><!-- /.col-->
  </div><!-- /.row -->

  <div class="row">
      <div class="col-xs-10 col-xs-offset-1 col-sm-8 col-sm-offset-2 col-md-4 col-md-offset-4">
          <div class="login-panel panel panel-default">
              <div class="panel-heading">Add Book(注意：请补全所有信息)</div>
              <div class="panel-body">
                  <form action="Addbookaction">
                      <fieldset>
                          <div class="form-group">
                              <input type="text" name="isbn" placeholder="ISBN" class="form-control"/><br/>
                          </div>
                          <div class="form-group">
                              <input type="text" name="title" placeholder="Title" class="form-control"/><br/>
                          </div>
                          <div class="form-group">
                              <input type="text" name="publisher" placeholder="Publisher" class="form-control"/><br/>
                          </div>
                          <div class="form-group">
                              <input input type="text" name="publishdate" placeholder="Publish date" class="form-control"/><br/>
                          </div>
                          <div class="form-group">
                              <input type="text" name="price" placeholder="Price" class="form-control"/><br/>
                          </div>
                          <div class="form-group">
                              <input type="text" name="authorname" placeholder="Author name" class="form-control"/><br/>
                          </div>
                          <div class="form-group">
                              <input type="text" name="authorage" placeholder="Author age" class="form-control"/><br/>
                          </div>
                          <div class="form-group">
                              <input type="text" name="authorcountry" placeholder="Author country" class="form-control"/><br/>
                          </div>
                          <input type="submit" value="Add" class="btn btn-primary"/>
                      </fieldset>
                  </form>
              </div>
          </div>
      </div><!-- /.col-->
  </div><!-- /.row -->
   
  
   <script src="js/jquery-1.11.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
</body>
</html>