<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<%--%>
  <%--if(request.getSession().getAttribute("authKey")==null) request.getRequestDispatcher("sign-in.jsp").forward(request,response);--%>
<%--%>--%>
<%
    String baseURL = request.getServletContext().getInitParameter("rest-base-url");
    int studentId = Integer.parseInt((String) request.getSession().getAttribute("studentId"));
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
    <link rel="stylesheet" type="text/css" href="../css/bootstrap.css"/>
    <link rel="stylesheet" type="text/css" href="../css/font-awesome.min.css"/>
    <link rel="stylesheet" type="text/css" href="../css/style.css"/>
    <link rel="stylesheet" type="text/css" href="../css/sticky-footer-navbar.css">
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

        <a class="navbar-brand" href="/home">Online Activity Diary</a>
      </div>

      <div class="navbar-collapse collapse">
        <ul class="nav navbar-nav navbar-right">
          <li><a href="../home">Home</a></li>
          <li class="active"><a href="profile">Settings</a></li>
          <li><a href="../login">Sign out</a></li>
        </ul>
      </div>
    </div>
    <!-- navbar end -->

    <div class="container settings-body">
      <div class="row">
        <!-- sidebar start -->
        <div class="col-lg-2 col-md-2 col-sm-2">
          <form action="profile">
            <input type="submit" value="Profile" class="large-button"/>
          </form>
          <form action="notification">
            <input type="submit" value="Notifications" class="large-button"/>
          </form>
          <form action="security">
            <input type="submit" value="Change Password" class="large-button active-button"/>
          </form>
        </div>
        <!-- sidebar end -->

        <!-- start of fields -->
        <div class="col-lg-10 col-md-10 col-sm-10 settings-content">
            <div class="row hidden">
                <p class="col-lg-3 col-md-4 col-sm-4 col-xs-4">Current Password</p>
                <input id="studentId" type="password" name="current-password" class="change-pwd-input col-lg-9 col-md-8 col-sm-8 col-xs-8" value="<%=studentId%>">
            </div>
          <div class="row">
            <p class="col-lg-3 col-md-4 col-sm-4 col-xs-4">Current Password</p>
            <input id="currentPassword" type="password" name="current-password" class="change-pwd-input col-lg-9 col-md-8 col-sm-8 col-xs-8">
          </div>
          <div class="row">
            <p class="col-lg-3 col-md-4 col-sm-4 col-xs-4">New Password</p>
            <input id="newPassword" type="password" name="current-password" class="change-pwd-input col-lg-9 col-md-8 col-sm-8 col-xs-8">
          </div>
          <div class="row">
            <p class="col-lg-3 col-md-4 col-sm-4 col-xs-4">Confirm New Password</p>
            <input id="newPasswordConfirm" type="password" name="current-password" class="change-pwd-input col-lg-9 col-md-8 col-sm-8 col-xs-8">
          </div>
          <div class="row" id="notifDiv" style="padding: 10px">

          </div>

          <!-- start of buttons -->
          <div class="container buttons-container settings-buttons-container">
            <button class="pull-right bottom-button" onclick="updateStudentInfo()">Update</button>
            <button class="pull-right bottom-button">Cancel</button>
          </div>
          <!-- end of buttons -->
        </div>
        <!-- end of fields -->
      </div>
    </div>
    
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

    <script src="../js/jquery.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script>
      function updateStudentInfo() {
        var studentId = $("#studentId").val();
        var currentPwd = $("#currentPassword").val();
        var newPwd = $("#newPassword").val();
        var newPwdConf = $("#newPasswordConfirm").val();
        console.log(currentPwd);
          if(currentPwd == null || currentPwd == undefined ) {
              $("#notifDiv").append('<div class="alert alert-danger alert-dismissable" >' +
                      '<button type="button" class="close" ' +
                      'data-dismiss="alert" aria-hidden="true">' +
                      '&times;' +
                      '</button>' +
                      'Current password cannot be empty' +
                      '</div>');
        }else if(newPwd!= newPwdConf){
              $("#notifDiv").append('<div class="alert alert-danger alert-dismissable" >' +
                      '<button type="button" class="close" ' +
                      'data-dismiss="alert" aria-hidden="true">' +
                      '&times;' +
                      '</button>' +
                      'New password does not match with password confirm field' +
                      '</div>');
      }else {

          $.ajax({
            type: "PUT",
            url: "http://localhost:8080/oad/oad-api/student/"+studentId,
            data: JSON.stringify({'studentId':studentId,'currentPassword':currentPwd,'newPassword':newPwd}),
            contentType: 'application/json'
          }).done(function (data) {
            var resCode = data.responseCode;
            if(resCode==200){
                $("#notifDiv").append('<div class="alert alert-success alert-dismissable" >' +
                        '<button type="button" class="close" ' +
                        'data-dismiss="alert" aria-hidden="true">' +
                        '&times;' +
                        '</button>' +
                        data.description +
                        '</div>');
                $("#currentPassword").val("");
                $("#newPassword").val("");
                $("#newPasswordConfirm").val("");
            }else{
                $("#notifDiv").append('<div class="alert alert-danger alert-dismissable" >' +
                        '<button type="button" class="close" ' +
                        'data-dismiss="alert" aria-hidden="true">' +
                        '&times;' +
                        '</button>' +
                        data.description +
                        '</div>');
            }

          });
        }
      }
    </script>
  </body>
</html>