<%@ page import="javax.ws.rs.client.Client" %>
<%@ page import="javax.ws.rs.client.ClientBuilder" %>
<%@ page import="javax.ws.rs.client.WebTarget" %>
<%@ page import="javax.ws.rs.core.MediaType" %>
<%@ page import="org.apache.logging.log4j.Logger" %>
<%@ page import="org.apache.logging.log4j.LogManager" %>
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
    System.out.println(baseURL);
//    if (request.getSession().getAttribute("authKey") == null)
//        request.getRequestDispatcher("signin").forward(request, response);
    int studentId = Integer.parseInt((String) request.getSession().getAttribute("studentId"));
    client = ClientBuilder.newClient();
%>
<!DOCTYPE html>
<!--[if lt IE 7 ]> <html class="ie ie6 no-js" lang="en"> <![endif]-->
<!--[if IE 7 ]> <html class="ie ie7 no-js" lang="en"> <![endif]-->
<!--[if IE 8 ]> <html class="ie ie8 no-js" lang="en"> <![endif]-->
<!--[if IE 9 ]> <html class="ie ie9 no-js" lang="en"> <![endif]-->
<!--[if gt IE 9]><!--><html class="no-js" lang="en"><!--<![endif]-->
<head>
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>OAD</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content=""/>
    <meta name="keywords" content=""/>

    <!--Bootstrap base CSS-->
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css"/>
    <!--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">-->

    <!--Custom CSS-->
    <link rel="stylesheet" type="text/css" href="css/style.css"/>
    <link rel="stylesheet" type="text/css" href="css/sticky-footer-navbar.css">

    <!--Plugin CSS-->
    <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css"/>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="css/datatables.bootstrap3.min.css">
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.2/css/bootstrap-select.min.css">
    <link rel="stylesheet" href="css/bootstrap-select.min.css">

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

        <a class="navbar-brand" href="index.html">Online Activity Diary</a>
    </div>

    <div class="navbar-collapse collapse">
        <ul class="nav navbar-nav navbar-right">
            <li class="active"><a href="home">Home</a></li>
            <li><a href="settings/profile">Settings</a></li>
            <li><a href="signin">Sign out</a></li>
        </ul>
    </div>
</div>
<!-- navbar end -->

<!-- start of selector section -->
<div class="container selector-container">
    <!-- selectors row 1 start -->
    <div class="row select-row">
        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
            <p class="first-title col-lg-4 col-md-4 col-sm-4">Course Code</p>
            <select class="selectpicker show-tick ol-lg-12 col-md-12 col-sm-12 col-xs-12" title="Course Code" id="courseSelector" onchange="searchCourse()">
                <option value="">All</option>
                <%
                    WebTarget target = client.target(baseURL+ "student/" +studentId + "/course");
                    String res = target.request(MediaType.APPLICATION_JSON)
                            .accept(MediaType.APPLICATION_JSON)
                            .get(String.class);
                    JsonArray resArray = jsonParser.parse(res).getAsJsonArray();
                    for (JsonElement jsonElement : resArray) {
                        String courseCode = jsonElement.getAsJsonObject().get("courseCode").getAsString();
                %>
                <option value="<%=courseCode%>"><%=courseCode%>
                </option>
                <%
                    }
                    ;
                %>
            </select>
        </div>

        <%--<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">--%>
        <!--<p class="first-title col-lg-2 col-md-2 col-sm-2 col-xs-2">Type</p>-->
        <%--<div class="form-group ">--%>
        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
            <p class="first-title col-lg-4 col-md-4 col-sm-4">Activity Type</p>
            <select class="selectpicker show-tick col-lg-12 col-md-12 col-sm-12 col-xs-12" title="Activity" id="activitySelector" onchange="searchActivity()">
                <option value="">All</option>
                <option value="Day School">Day School</option>
                <option value="CAT">Continuous Assesment Test (CAT)</option>
                <option value="Lab">Lab Session</option>
                <option value="Viva">Viva Session</option>
                <option value="Final Examination">Final Examination</option>
            </select>
        </div>
        <%--</div>--%>
    </div>
    <!-- selectors row 1 end -->

    <!-- selectors row 2 start -->
    <div class="row select-row">
        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
            <p class="first-title col-lg-2 col-md-2 col-sm-2 col-xs-2">From</p>
            <div class="dropdown col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <input type="text" class="datepicker col-lg-12 col-md-12 col-sm-12 col-xs-12" id="start-date" placeholder="From" onselect="searchDateRange()">
                <%--<i class="fa fa-calendar col-lg-1 col-md-1 col-sm-1 col-xs-1 pull-right"></i>--%>
            </div>
        </div>

        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
            <p class="first-title col-lg-2 col-md-2 col-sm-2 col-xs-2">To</p>
            <div class="dropdown col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <input type="text" class="datepicker col-lg-12 col-md-12 col-sm-12 col-xs-12" id="end-date"
                       placeholder="To">
                <%--<i class="fa fa-calendar col-lg- col-md-1 col-sm-1 col-xs-1 pull-right"></i>--%>
            </div>
        </div>
    </div>
    <!-- selectors row 2 end -->
</div>
<!-- end of selector section -->

<!-- start of table -->
<div class="container selector-container ">
    <table id="activityTable" width="80%" class="table table-striped table-bordered table-responsive">
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

            <%
                target = client.target(baseURL + "student/" + studentId + "/activities");
                res = target.request(MediaType.APPLICATION_JSON)
                        .accept(MediaType.APPLICATION_JSON)
                        .get(String.class);
                resArray = jsonParser.parse(res).getAsJsonArray();
                for (JsonElement jsonElement : resArray) {
                    String courseCode = jsonElement.getAsJsonObject().get("courseCode").getAsString();
                    String name = jsonElement.getAsJsonObject().get("name").getAsString();
                    String date = jsonElement.getAsJsonObject().get("date").getAsString();
                    String startTime = jsonElement.getAsJsonObject().get("startTime").getAsString();
                    String endTime = jsonElement.getAsJsonObject().get("endTime").getAsString();
                    String venue = jsonElement.getAsJsonObject().get("venue").getAsString();
            %>
            <tr>
                <td><%=courseCode%></td>
                <td><%=name%></td>
                <td><%=date%></td>
                <td><%=startTime%>-<%=endTime%></td>
                <td><%=venue%></td>
            </tr>
            <%
                }
            %>
        </tbody>
    </table>

    <!-- start of buttons -->
    <%--<div class="container buttons-container">--%>
        <%--<button class="pull-right bottom-button">Add New</button>--%>
        <%--<button class="pull-right bottom-button">Edit</button>--%>
    <%--</div>--%>
    <!-- end of buttons -->

</div>
<!-- end of table -->


<!-- start of footer -->
<footer class="footer">
    <div class="container footer-container">
        <div class="row">
            <!-- <div class="footer-text col-lg-6 col-md-6 col-sm-12 col-xs-12"> -->
            <p><a href="http://www.ou.ac.lk/home/" target="_blank">The Open University of Sri Lanka</a></p>
            <!-- </div> -->
            <!-- <div class="footer-text col-lg-6 col-md-6 col-sm-12 col-xs-12"> -->
            <p>Solution by <a href="https://en.wikipedia.org/wiki/Mahinda_Rajapaksa" target="_blank">Synergy</a>&copy
            </p>
            <!-- </div> -->
        </div>
    </div>
</footer>
<!-- end of footer -->

<!--Plugin JS-->
<script src="js/jquery.js"></script>
<script src="js/jquery-ui.js"></script>
<script src="js/datatables.min.js"></script>
<script src="js/datatables.bootstrap3.min.js"></script>
<script src="js/bootstrap-select.min.js"></script>

<!--Bootstrap JS-->
<script src="js/bootstrap.min.js"></script>

<!--Custom JS-->
<script src="js/custom.js"></script>
</body>
</html>