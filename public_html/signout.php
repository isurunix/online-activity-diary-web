<?php
/**
 * Created by PhpStorm.
 * User: isuru
 * Date: 2/2/17
 * Time: 3:17 PM
 */
session_start();
session_unset();
session_destroy();
header('Location:sign-in.php');
die();