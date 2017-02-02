<!doctype html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport"
        content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Document</title>
</head>
<body>
  <?php
    chdir(dirname(__DIR__));
    require_once 'vendor/autoload.php';
    use GuzzleHttp\Client;

    $client = new GuzzleHttp\Client();
    $res = $client->request('POST','localhost:8080/oad/oad-api/login',[
            'json'=> ['userId'=>'21224470','password'=>'isurunix']
    ]);

    $response = json_decode($res->getBody());
    $authKey = $response->authKey;
    if(isset($authKey)){
        header('Location:index.php'); die();
    }else{
      header('Location:sign-in.php'); die();
    }
  ?>
</body>
</html>
