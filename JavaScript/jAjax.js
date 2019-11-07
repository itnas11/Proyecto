$(document).ready(function () {
    console.log("JQuery OK")
    $("#anyadir").click(function() {
        $("#nuevo_cliente").show();
    })
    $("#cancelar_cliente").click(function(){
        $("#nuevo_cliente").hide();
    })
    $("#cancelar_modificar").click(function(){
        $("#modificar_cliente").hide();
    })
    agregarclientes();
});


function agregarclientes(){ 

    $.ajax({
        type: "POST",
        url: "../Controlador/cliente.php",
        dataType: "json",
    })
    .done(function(data){
        console.log(data);
        var nuevafila;
        var i;
        for(i = 0; i<data.length;i++){
            nuevafila = "<tr class='table__F_C'><td>"+data[i].dniCliente+"</td><td>"+data[i].nombre+"</td><td><button class='editar' id='editar"+data[i].nombre+"'>Editar</button><button class='borrar' id='borrar'>Borrar</button></td></tr>";
            $("#clientes").append(nuevafila);
            $("#editar"+data[i].nombre).click(function(){
                $("#modificar_cliente").show();
                $("#modificardni").val(data[0].dniCliente);
                $("#modificarnombre").val(data[0].nombre);
                $("#modificardireccion").val(data[0].direccion);
                $("#modificaremail").val(data[0].email);
            })
        }
    })
    .fail(function() {
        console.log("Error al cargar el arreglo");
    });
}