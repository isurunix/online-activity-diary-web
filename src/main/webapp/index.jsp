<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    if(request.getSession().getAttribute("authKey")==null) request.getRequestDispatcher("sign-in.jsp").forward(request,response);
%>
<!DOCTYPE html>
<!--[if lt IE 7 ]> <html class="ie ie6 no-js" lang="en"> <![endif]-->
<!--[if IE 7 ]>    <html class="ie ie7 no-js" lang="en"> <![endif]-->
<!--[if IE 8 ]>    <html class="ie ie8 no-js" lang="en"> <![endif]-->
<!--[if IE 9 ]>    <html class="ie ie9 no-js" lang="en"> <![endif]-->
<!--[if gt IE 9]><!--><html class="no-js" lang="en"><!--<![endif]-->
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>OAD</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="" />
    <meta name="keywords" content="" />
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css"/>
    <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css"/>
    <link rel="stylesheet" type="text/css" href="css/style.css"/>
    <link rel="stylesheet" type="text/css" href="css/sticky-footer-navbar.css">
  </head>

  <body>
    <div class="navbar navbar-default navbar-fixed-top" role="navigation">
      <!-- navbar start -->
      <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
          <span class="sr-only">Toggle Navigation</span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>

        <a class="navbar-brand" href="index.jsp">Online Activity Diary</a>
      </div>

      <div class="navbar-collapse collapse">
        <ul class="nav navbar-nav navbar-right">
          <li class="active"><a href="index.jsp">Home</a></li>
          <li><a href="profile-settings.jsp">Settings</a></li>
          <li><a href="sign-in.jsp">Sign out</a></li>
        </ul>
      </div>
    </div>
    <!-- navbar end -->

    <!-- start of selector section -->
    <div class="container selector-container">
      <!-- selectors row 1 start -->
      <div class="row select-row">
        <div class="col-lg-offset-1 col-lg-5 col-md-offset-1 col-md-5 col-sm-offset-1 col-sm-5 col-xs-12">
          <p class="first-title col-lg-2 col-md-2 col-sm-2 col-xs-2">Course</p>
          <div class="dropdown col-lg-10 col-md-10 col-sm-10 col-xs-10">
            <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">
              All
              <span class="caret"></span>
            </button>
            <ul class="dropdown-menu">
              <li><a href="#">ECX4262</a></li>
              <li><a href="#">ECX5245</a></li>
              <li><a href="#">ECX5247</a></li>
            </ul>
          </div>
        </div>

        <div class="col-lg-5 col-md-5 col-sm-5 col-xs-12">
          <p class="first-title col-lg-2 col-md-2 col-sm-2 col-xs-2">Type</p>
          <div class="dropdown col-lg-10 col-md-10 col-sm-10 col-xs-10">
            <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">
              All
              <span class="caret"></span>
            </button>
            <ul class="dropdown-menu">
              <li><a href="#">Day Schools</a></li>
              <li><a href="#">TMA Due Dates</a></li>
              <li><a href="#">CAT1</a></li>
            </ul>
          </div>
        </div>
      </div>
      <!-- selectors row 1 end -->
      
      <!-- selectors row 2 start -->
      <div class="row select-row">
        <div class="col-lg-offset-1 col-lg-5 col-md-offset-1 col-md-5 col-sm-offset-1 col-sm-5 col-xs-12">
          <p class="first-title col-lg-2 col-md-2 col-sm-2 col-xs-2">From</p>
          <div class="dropdown col-lg-10 col-md-10 col-sm-10 col-xs-10">
            <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">
              2017-01-01
              <span class="caret"></span>
            </button>
            <ul class="dropdown-menu">
              <li><a href="#">ECX4262</a></li>
              <li><a href="#">ECX5245</a></li>
              <li><a href="#">ECX5247</a></li>
            </ul>
          </div>
        </div>

        <div class="col-lg-5 col-md-5 col-sm-5 col-xs-12">
          <p class="first-title col-lg-2 col-md-2 col-sm-2 col-xs-2">To</p>
          <div class="dropdown col-lg-10 col-md-10 col-sm-10 col-xs-10">
            <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">
              2017-02-01
              <span class="caret"></span>
            </button>
            <ul class="dropdown-menu">
              <li><a href="#">Day Schools</a></li>
              <li><a href="#">TMA Due Dates</a></li>
              <li><a href="#">CAT1</a></li>
            </ul>
          </div>
        </div>
      </div>
      <!-- selectors row 2 end -->
    </div>
    <!-- end of selector section -->

    <!-- start of table -->
    <table class="table table-bordered">
      <thead>
        <tr>
          <th>Course</th>
          <th>Activity</th>
          <th>Date</th>
          <th>Time</th>
          <th>Centre</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>ECX4262</td>
          <td>Lab 1</td>
          <td>2017-01-10</td>
          <td>0900</td>
          <td>RC</td>
        </tr>
        <tr>
          <td>ECX4262</td>
          <td>Lab 1</td>
          <td>2017-01-10</td>
          <td>0900</td>
          <td>RC</td>
        </tr>
        <tr>
          <td>ECX4262</td>
          <td>Lab 1</td>
          <td>2017-01-10</td>
          <td>0900</td>
          <td>RC</td>
        </tr>
      </tbody>
    </table>
    <!-- end of table -->

    <!-- start of buttons -->
    <div class="container buttons-container">
      <button class="pull-right bottom-button">Add New</button>
      <button class="pull-right bottom-button">Edit</button>
    </div>
    <!-- end of buttons -->
    
    <!-- start of footer -->
    <footer class="footer">
      <div class="container footer-container">
        <div class="row">
          <!-- <div class="footer-text col-lg-6 col-md-6 col-sm-12 col-xs-12"> -->
            <p><a href="http://www.ou.ac.lk/home/" target="_blank">The Open University of Sri Lanka</a></p>
          <!-- </div> -->
          <!-- <div class="footer-text col-lg-6 col-md-6 col-sm-12 col-xs-12"> -->
            <p>Solution by <a href="https://en.wikipedia.org/wiki/Mahinda_Rajapaksa" target="_blank">Synergy</a>&copy</p>
          <!-- </div> -->
        </div>
      </div>
    </footer>
    <!-- end of footer -->

    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
  </body>
</html>