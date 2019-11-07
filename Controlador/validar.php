<?php
    session_start();
    require "modelo.php";

    $base = new Bd();
    if(!isset($_SESSION['nombre'])){
        if(isset($_POST['acceder'])){
            $cli = new Cliente($_POST['dni'],'','','','','');
            if($pass = $cli->autenticar($base->link)){
                $_SESSION['nombre'] = $pass['nombre'];
                if(password_verify($_POST['password'],$pass['pwd'])){
                    $_SESSION['admin'] = $pass['admin'];
                }else{
                    require "../vistas/acceso.html";
                }
            }else{
                require "../vistas/acceso.html";
            }
        }else require "../vistas/acceso.html";
    }
    if(isset($_SESSION['nombre'])){
        if($_SESSION['admin']){
            echo "Bienvenido ".$_SESSION['nombre'];
            require "../vistas/cliente.html";
        }else{
            echo "Bienvenido ".$_SESSION['nombre'];
            require "../vistas/Tienda.html";
        }
    }
?>