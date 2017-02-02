<?php
session_start();
if(isset($_SESSION['authKey'])) {header('Location:index.php'); die();};
?>
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
        <a class="navbar-brand" href="sign-in.php">Online Activity Diary</a>
      </div>
    </div>
    <!-- navbar end -->

    <!-- start content -->
    <div class="container field-container">
      <form class="main-area col-lg-6 col-md-6 col-sm-6 pull-right" method="post" action="sign-in.php" >
        <div class="row">
          <p class="text-center area-title">Sign in</p>
        </div>
        <div class="row">
          <p class="col-lg-2 col-md-4 col-sm-4 col-xs-4">Username</p>
          <input type="text" name="username" class="sign-in-input col-lg-10 col-md-8 col-sm-8 col-xs-8">
        </div>
        <div class="row">
          <p class="col-lg-2 col-md-4 col-sm-4 col-xs-4">Password</p>
          <input type="password" name="password" class="sign-in-input col-lg-10 col-md-8 col-sm-8 col-xs-8">
        </div>
        <button class="pull-right bottom-button sign-in-button">Sign in</button>
      </form>
    </div>
    <!-- end content -->

    <?php
    chdir(dirname(__DIR__));
    require_once 'vendor/autoload.php';
    use GuzzleHttp\Client;

    $username = $_POST["username"];
    $password = $_POST["password"];

    if(isset($username) and isset($password)) {

      $client = new GuzzleHttp\Client();
      $res = $client->request('POST', 'localhost:8080/oad/oad-api/login', [
        'json' => ['userId' => $username, 'password' => $password]
      ]);

      $response = json_decode($res->getBody());
      $authKey = $response->authKey;
      if (isset($authKey)) {
        $_SESSION['authKey']=$authKey;
        header('Location:index.php');
        die();
      } else {
        header('Location:sign-in.php');
        die();
      }
    }
    ?>

    <!-- start of buttons -->
    <div class="container buttons-container">
      <!--  -->
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