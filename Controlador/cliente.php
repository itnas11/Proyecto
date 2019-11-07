<?php
    require "modelo.php";

    $base = new Bd();

    $usuarios = Cliente::getAll($base->link);
    $clientes = array();

    while($cliente = $usuarios->fetch_assoc()){
        array_push($clientes, array(
            'dniCliente' => $cliente["dniCliente"],
            'nombre' => $cliente["nombre"],
            'direccion' => $cliente["direccion"],
            'email' => $cliente["email"]
        ));
    }
    /*print_r($clientes)."<br>";*/
    echo json_encode($clientes);
    
?>