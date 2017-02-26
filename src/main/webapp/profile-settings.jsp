<%@ page import="javax.ws.rs.client.Client" %>
<%@ page import="org.apache.logging.log4j.Logger" %>
<%@ page import="org.apache.logging.log4j.LogManager" %>
<%@ page import="javax.ws.rs.client.ClientBuilder" %>
<%@ page import="javax.ws.rs.client.WebTarget" %>
<%@ page import="javax.ws.rs.core.MediaType" %>
<%@ page import="com.google.gson.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%!
  private Client client;
  private JsonParser jsonParser = new JsonParser();
  private Gson gson = new GsonBuilder().setPrettyPrinting().create();
  Logger logger = LogManager.getLogger(this);
%>
<%
  String baseURL = request.getServletContext().getInitParameter("rest-base-url");
  int studentId = Integer.parseInt((String) request.getSession().getAttribute("studentId"));
  client = ClientBuilder.newClient();
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

        <a class="navbar-brand" href="index.jsp">Online Activity Diary</a>
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
            <input type="submit" value="Profile" class="large-button active-button"/>
          </form>
          <form action="notification">
            <input type="submit" value="Notifications" class="large-button"/>
          </form>
          <form action="security">
            <input type="submit" value="Change Password" class="large-button"/>
          </form>
        </div>
        <!-- sidebar end -->

        <!-- start of fields -->
        <%
          WebTarget target = client.target(baseURL+ "student/" +studentId);
          String res = target.request(MediaType.APPLICATION_JSON)
                  .accept(MediaType.APPLICATION_JSON)
                  .get(String.class);
          JsonObject resObject = jsonParser.parse(res).getAsJsonObject();
          String sName = resObject.get("name").getAsString();
          String sMail = resObject.get("email").getAsString();
//          String sAddress = resObject.get("address").getAsString();
        %>
        <form class="col-lg-9 col-md-10 col-sm-10 settings-content" onsubmit="updateStudentInfo()">

          <div class="row">
            <p class="col-lg-3 col-md-4 col-sm-4 col-xs-4">Registration Number</p>
            <input id="idField" disabled type="text" name="name" class="change-pwd-input col-lg-9 col-md-8 col-sm-8 col-xs-8" value="<%=studentId%>">
          </div>
          <div class="row">
            <p class="col-lg-3 col-md-4 col-sm-4 col-xs-4">Name</p>
            <input id="nameField" required type="text" name="name" class="change-pwd-input col-lg-9 col-md-8 col-sm-8 col-xs-8" value="<%=sName%>">
          </div>
          <div class="row">
            <p class="col-lg-3 col-md-4 col-sm-4 col-xs-4">E-Mail</p>
            <input id="mailField" required type="email" name="e-mail" class="change-pwd-input col-lg-9 col-md-8 col-sm-8 col-xs-8" value="<%=sMail%>">
          </div>

          <!-- start of buttons -->
          <div class="container buttons-container settings-buttons-container">
            <button class="pull-right bottom-button" onclick="updateStudentInfo()">Update</button>
          </div>
          <!-- end of buttons -->
        </form>
        <!-- end of fields -->

        <%-- courses section --%>
        <%--<div class="col-sm-offset-2 col-md-offset-2 col-lg-offset-2 col-lg-10 col-md-10 col-sm-10 settings-content" id="my-courses">--%>
          <%--<div class="row">--%>
            <%--<div class="col-xs-7">--%>
              <%--ECX5235--%>
            <%--</div>--%>
            <%--<div class="col-xs-offset-1 col-xs-4 course-btn-container">--%>
              <%--<button class="btn btn-default pull-right bottom-button">Remove</button>--%>
            <%--</div>--%>
          <%--</div>--%>
        <%--</div>--%>
        <%-- end of courses section --%>

      </div>
    </div>

    <%--<div class="settings-body container">--%>
      <%--<div class="col-sm-2"></div>--%>
      <%----%>
    <%--</div>--%>

    
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
        var sId = $("#idField").val();
        var sName = $("#nameField").val();
        var sMail = $("#mailField").val();

        $.ajax({
          type: "PUT",
          url: "http://localhost:8080/oad/oad-api/student/"+sId,
          data: JSON.stringify({'studentId':sId,'name':sName,'email':sMail}),
          contentType: 'application/json',
        }).done(function (data) {
          var resCode = data.responseCode;
          if(resCode==200){
            alert("Successfully Updated");
            location.reload();
          }else{
            console.log(data);
          }

        });
      }
    </script>
  </body>
</html>