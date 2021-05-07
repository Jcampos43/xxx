<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="es">
  <head>
    <title>Iniciar Sesión</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="icon" type="image/png" href="resources/images/favicon.png">
    
    <link href="https://fonts.googleapis.com/css?family=Montserrat:200,300,400,500,600,700,800&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
 
    <link rel="stylesheet" href="resources/css/animate.css">
    
    <link rel="stylesheet" href="resources/css/owl.carousel.min.css">
    <link rel="stylesheet" href="resources/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="resources/css/magnific-popup.css">


    <link rel="stylesheet" href="resources/css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="resources/css/jquery.timepicker.css">

    <link rel="stylesheet" href="resources/css/flaticon.css">
    <link rel="stylesheet" href="resources/css/style.css">
    <link rel="stylesheet" href="resources/css/sam.css">
    
    <link rel="stylesheet" href="resources/css/bootstrapValidator.min.css"> 
       
  </head>
  <body>
    <div class="wrap">
			<div class="container">
				<div class="row">
					<div class="col-md-6 d-flex align-items-center">
						<p class="mb-0 phone pl-md-2">
							<a href="#" class="mr-2"><span class="fa fa-phone mr-1"></span> +51 971 893 196</a> 
							<a href="#"><span class="fa fa-paper-plane mr-1"></span> contacto@4patitas.com</a>
						</p>
					</div>
					<div class="col-md-6 d-flex justify-content-md-end">
						<div class="social-media">
			    		<p id="sam-login" class="mb-0 d-flex align-items-center text-light sam-login">
                <a href="/login" class="d-flex align-items-center justify-content-center"><span class="fa fa-user"><i class="sr-only"></i></span></a>
                <span>Iniciar Sesión</span>
			    		</p>
		        </div>
					</div>
				</div>
			</div>
		</div>
		<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
	    <div class="container">
	    	<a class="navbar-brand" href="/"><span class="flaticon-pawprint-1 mr-2"></span>4 PATITAS</a>
	      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
	        <span class="fa fa-bars"></span> Menu
	      </button>
	      <div class="collapse navbar-collapse" id="ftco-nav">
	        <ul class="navbar-nav ml-auto">
	        	<li class="nav-item"><a href="/" class="nav-link">Inicio</a></li>
	        	
	          <li class="nav-item"><a href="galeria.html" class="nav-link">Galería</a></li>
	          <li class="nav-item"><a href="crud_mascota.html" class="nav-link">Mis Mascotas</a></li>
	          <li class="nav-item"><a href="crud_producto.html" class="nav-link">Productos</a></li>
	          <li class="nav-item"><a href="crud_servicio.html" class="nav-link">Servicios</a></li>
	        </ul>
	      </div>
	    </div>
	  </nav>
    <!-- END nav -->

<div id="fw-container" class="fw-container">
	<div class="container sam-lisu">
  <!-- Nav tabs -->
 	<ul class="nav nav-tabs" role="tablist">
    <li id="sam-login-tab" class="nav-item">
      <a  class="nav-link active" data-toggle="tab" onclick="mostrarVentanaLogin()" href="#login">INICIAR SESIÓN</a>
    </li>
    <li class="nav-item">
      <a id="sam-signup-tab" class="nav-link" data-toggle="tab" onclick="mostrarVentana()" href="#signup">REGISTRARSE</a>
    </li>
  </ul>

  <!-- Tab panes -->
  <div class="tab-content">
  
  <!-- MODAL INGRESO DE SESION -->
  	
  	<!-- CONTENIDO TAB 1 -->
    <div id="login" class="container tab-pane active"><br>
    	<form id="id_login" data-toggle="validator" method="post" id="contactForm" name="contactForm" class="contactForm">
			<div class="row">
				<div class="col-md-12">
					<div class="form-group w-50">
						<label class="label sam-form-label" for="subject">DNI</label>
						<input type="number" class="form-control sam-form-input" id="idDniLogin" name="dniLogin" placeholder="Ingrese su DNI">
					</div>
				</div>
				<div class="col-md-12">
					<div class="form-group w-50">
						<label class="label sam-form-label" for="subject">Clave</label>
						<input type="password" class="form-control sam-form-input" name="passwordLogin" id="idPasswordLogin" placeholder="Ingrese su Clave">
					</div>
				</div>
				<div class="col-md-12">
					<div class="form-group">
						<input type="button" onclick="postValidarLogin()" value="INGRESAR" class="btn btn-primary">						
						<div class="submitting"></div>
					</div>
				</div>
			</div>
		</form>
   </div>
   
   <!-- FIN MODAL INGRESO DE SESION -->
   	
    <!-- MODAL REGISTRO DE USUARIO -->
    <div id="signup" class="container tab-pane fade sam-tab-signup"><br>    
      <form id="id_registra" accept-charset="UTF-8" action="" class="contactForm" method="post" data-toggle="validator" role="form">	
      	<input type="hidden" id="idCodigo" name="codigo">			
      
		<div class="row">
			<div class="col-md-6">
				<div class="form-group">
					<label class="label sam-form-label" for="subject">Nombres</label>
					<input class="form-control sam-form-input" id="idNombre" name="nombre" placeholder="Ingrese su Nombre"/>
				</div>
			</div>
			<div class="col-md-6">
				<div class="form-group">
					<label class="label sam-form-label" for="subject">Apellidos</label>
					<input class="form-control sam-form-input" id="idApellido" name="apellido" placeholder="Ingrese su Apellido"/>					
				</div>
			</div>
			<div class="col-md-6">
				<div class="form-group">
					<label class="label sam-form-label" for="subject">DNI</label>
					<input type="number" class="form-control sam-form-input" id="idDni" name="dni" placeholder="Ingrese su DNI">
				</div>
			</div>			
			<div class="col-md-6">
				<div class="form-group">
					<label class="label sam-form-label" for="subject">Distrito</label><br>
					<select id="idDistrito" name="distrito" class='form-control sam-form-input'>
							 <option value="-1" >[SELECCIONE]</option>
					</select>
				</div>
			</div>	
			<div class="col-md-6">
				<div class="form-group">
					<label class="label sam-form-label" for="subject">Tipo de Usuario</label><br>
					<select id="idTipoUsuario" name="tipousuario" class='form-control sam-form-input'>
							 <option value="-1" >[SELECCIONE]</option>
					</select>
				</div>
			</div>			
			<div class="col-md-6">
				<div class="form-group">
					<label class="label sam-form-label" for="subject">Clave</label>
					<input type="password" class="form-control sam-form-input" name="password" id="idPassword" placeholder="Ingrese su Clave">
				</div>
			</div>
			<div class="col-md-12">
				<div class="form-group">
					<button type="button" class="btn btn-primary" onclick="postValidarRegistra()">Registrar</button>			
				</div>
			</div>
		</div>
		
	</form>
	
    </div>
    <!-- FIN DE MODAL REGISTRO DE USUARIO -->
    
    
  </div>
  
</div>
</div>


  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>


  <script src="js/jquery.min.js"></script>
  <script src="js/jquery-migrate-3.0.1.min.js"></script>
  <script src="js/popper.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/jquery.easing.1.3.js"></script>
  <script src="js/jquery.waypoints.min.js"></script>
  <script src="js/jquery.stellar.min.js"></script>
  <script src="js/jquery.animateNumber.min.js"></script>
  <script src="js/bootstrap-datepicker.js"></script>
  <script src="js/jquery.timepicker.min.js"></script>
  <script src="js/owl.carousel.min.js"></script>
  <script src="js/jquery.magnific-popup.min.js"></script>
  <script src="js/scrollax.min.js"></script>
  <!-- <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script> -->
   <!-- <script src="js/google-map.js"></script> -->
  <script src="js/main.js"></script>
  <script src="js/sam.js"></script>
  <script src="resources/js/bootstrapValidator.min.js"></script>
  <script src="resources/sweetalert/sweetalert.min.js"></script>

 <!-- SCRIPTS NETAMENTE PARA EL FORMULARIO LOGIN --> 
 <script type="text/javascript">
 function postValidarLogin() {
		var validator = $('#id_login').data('bootstrapValidator');
	    validator.validate();
	    if (validator.isValid()) {
	    	iniciarSesion();
	    }
	}

 
 function iniciarSesion(){
		swal({
			  title: "Seguro de iniciar sesión?",
			  text: "",
			  icon: "warning",
			  buttons: true,
			  dangerMode: true,
			})
			.then((willSave) => {
			  if (willSave) {
				    var dni, pass, json;
				    
					dni=$("#idDniLogin").val();
					pass=$("#idPasswordLogin").val();
					
					json=JSON.stringify({
						dni_usu:dni,
						pass_usu:pass});
			   		 $.ajax({
			   				url:  'iniciarSesion',
			   				type: 'POST',
			   			 	data: json,
			             	processData: false,
			             	contentType: "application/json",
			   				success:function(response){
			   					console.log(response);
			   					if(response.users){
				   					swal("Iniciaste Sesion...","","success");
				   					$('#id_login').data('bootstrapValidator').resetForm(true);
				   					$('#login').modal("hide");
				   				    //location.href="crudMascota.jsp";
			   					}
			   					else
			   						swal("Error...","","error");
			   				},
			   				error: function (jqXhr) { // error callback
			   					swal("Error guardando...","","error");
			   		    	}
			   			})
			  } 
			});
		
	}
 function mostrarVentanaLogin(){
		$('#id_login').trigger("reset");
		$('#id_login').data('bootstrapValidator').resetForm(true);				
	}
 </script>
<script>	
$(document).ready(function() {
	$('#resetBtn').click(function() {
        $('#id_login').data('bootstrapValidator').resetForm(true);
        $('#login').modal("hide");
    });   
});
</script>
<script type="text/javascript">
$(document).ready(function() {
	//validar registra nuevo empleado
	$('#id_login').bootstrapValidator({
	    message: 'This value is not valid',
	    feedbackIcons: {
	        valid: 'glyphicon glyphicon-ok',
	        invalid: 'glyphicon glyphicon-remove',
	        validating: 'glyphicon glyphicon-refresh'
	    },
	    fields: {
	    	dniLogin: {
	            validators: {
	                notEmpty: {
	                    message: 'El campo DNI es requerido. No puede estar vacio'
	                },
	                stringLength: {
	                    min: 8,
	                    max: 11,
	                    message: 'El DNI debe contener minimo 8 y maximo de 11 letras'
	                },
	                regexp: {
	                    regexp: /^[0-9]{8}$/,
	                    message: 'El DNI sólo puede contener numeros.'
	                }
	            }
	        },
	        passwordLogin:{
	        	validators:{
	        		notEmpty: {
	                    message: 'El campo Clave es requerido. No puede estar vacio'
	                }
	        	}
	        }
	        
	        
	
	    }
	});
});
</script> 
   
 <!-- SCRIPTS NETAMENTE PARA EL FORMULARIO REGISTRAR -->  

<script type="text/javascript">
function postValidarRegistra() {
	var validator = $('#id_registra').data('bootstrapValidator');
    validator.validate();
    if (validator.isValid()) {
    	saveUsuario();
    }
}

function saveUsuario(){
	swal({
		  title: "Seguro de Guardar?",
		  text: "",
		  icon: "warning",
		  buttons: true,
		  dangerMode: true,
		})
		.then((willSave) => {
		  if (willSave) {
			    var cod,nom,ape,dni,sex,dis,json;
			    
			    cod=$("#idCodigo").val();		
				nom=$("#idNombre").val();
				ape=$("#idApellido").val();
				dni=$("#idDni").val();
				pass=$("#idPassword").val();
				tipUs=$("#idTipoUsuario").val();
				dis=$("#idDistrito").val();
				
				json=JSON.stringify({
					cod_usu: cod,
					nom_usu:nom,
					ape_usu:ape,
					dni_usu:dni,
					pass_usu:pass,
					tipoUsuario:{cod_tip_usu:tipUs,nom_tip_usu:""},   			 		
   			 		distrito:{cod_dis:dis,nom_dis:""}});
		   		 $.ajax({
		   				url:  'saveUsuario',
		   				type: 'POST',
		   			 	data: json,
		             	processData: false,
		             	contentType: "application/json",
		   				success:function(response){
		   					console.log(response);
		   					if(response.dataMensaje==1){
			   					swal("Registro Guardado...","","success");
			   					$('#id_registra').data('bootstrapValidator').resetForm(true);
			   					$('#id_registra').modal("hide");
			   					//location.reload();
		   					}
		   					else
		   						swal("Error...","","error");
		   				},
		   				error: function (jqXhr) { // error callback
		   					swal("Error guardando...","","error");
		   		    	}
		   			})
		  } 
		});
	
}

function cargarDistritos(){
	$.getJSON("listaDistritos",{},
	  function(response){
		$.each(response.dataDistritos,function(index,item){$("#idDistrito").append("<option value='"+item.cod_dis+"'>"+item.nom_dis+"</option>");})
	})
}

function cargarTipoUsuario(){
	$.getJSON("listaTipoUsuario",{},
	  function(response){
		$.each(response.dataTipoUsuario,function(index,item){$("#idTipoUsuario").append("<option value='"+item.cod_tip_usu+"'>"+item.nom_tip_usu+"</option>");})
	})
}

function mostrarVentana(){
	$('#id_registra').trigger("reset");
	$('#id_registra').data('bootstrapValidator').resetForm(true);
	$("#idCodigo").val("0");
			
}
</script>	
<script>	
$(document).ready(function() {
	cargarDistritos();	
	cargarTipoUsuario();
	$('#resetBtn').click(function() {
        $('#id_registra').data('bootstrapValidator').resetForm(true);
        $('#signup').modal("hide");
    });   
});
</script>
<script type="text/javascript">
$(document).ready(function() {
	//validar registra nuevo empleado
	$('#id_registra').bootstrapValidator({
	    message: 'This value is not valid',
	    feedbackIcons: {
	        valid: 'glyphicon glyphicon-ok',
	        invalid: 'glyphicon glyphicon-remove',
	        validating: 'glyphicon glyphicon-refresh'
	    },
	    fields: {
	    	nombre: {
	            validators: {
	                notEmpty: {
	                    message: 'El campo Nombre es requerido. No puede estar vacio'
	                },
	                stringLength: {
	                    min: 3,
	                    max: 30,
	                    message: 'El nombre debe contener minimo 3 y maximo de 30 letras'
	                },
	                regexp: {
	                    regexp: /^[a-zA-Z\s\á\é\í\ó\ú\Á\É\Í\Ó\Ú\ñ\Ñ]+$/,
	                    message: 'El nombre sólo puede contener letras'
	                }
	            }
	        },
	        stock:{
	        	validators:{
	        		notEmpty: {
	                    message: 'El campo Stock es requerido. No puede estar vacio'
	                }
	        	}
	        }
	        
	        
	
	    }
	});
});
</script> 
    
  </body>
</html>