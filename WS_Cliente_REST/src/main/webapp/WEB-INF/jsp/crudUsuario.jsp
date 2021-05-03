<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="esS">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
 
<link href="<c:url value="/resources/css/bootstrap.min.css"/>" rel="stylesheet">
<link href="<c:url value="/resources/css/bootstrap-theme.min.css"/>" rel="stylesheet">
<link href="<c:url value="/resources/css/bootstrapValidator.min.css"/>" rel="stylesheet">

<link href="<c:url value="/resources/css/bootstrap-datepicker.css"/>" rel="stylesheet">

<link href="<c:url value="/resources/css/dataTables.bootstrap.min.css"/>" rel="stylesheet">
<link href="<c:url value="/resources/css/bootstrapValidator.min.css"/>" rel="stylesheet">


<script type="text/javascript" src="<c:url value="/resources/js/jquery.min.js" />"></script>
<script type="text/javascript" src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
<script type="text/javascript" src="<c:url value="/resources/js/bootstrapValidator.min.js" />"></script>
<script type="text/javascript" src="<c:url value="/resources/js/jquery.dataTables.min.js" />"></script>
<script type="text/javascript" src="<c:url value="/resources/js/dataTables.bootstrap.min.js" />"></script>

<script type="text/javascript" src="<c:url value="/resources/js/bootstrap-datepicker.min.js" />"></script>


<script type="text/javascript" src="<c:url value="/resources/sweetalert/sweetalert.min.js" />"></script>



 
<title>Modal Usuario</title>
<style>
	.modal-header, h4, .close {
		background-color: #286090;
		color: white !important;
		text-align: center;
		font-size: 20px;
	}
</style> 
</head>
<body>
		
	<div class="container">
		<h3 align="center">Listado de Usuarios</h3>
					<button type="button" data-toggle='modal'  
					class='btn btn-primary' 
					id="validateBtnw2" 
					onclick="mostrarVentana()">Nuevo Usuario</button><br>&nbsp;<br>		
			<div id="divEmpleado">
		 								<table id="id_table_usuario" class="table table-striped table-bordered" >
												<thead>
														<tr>
															<th>Codigo</th>
															<th>Nombre</th>
															<th>Apellido</th>
															<th>DNI</th>
															<th>Sexo</th>
															<th>Distrito</th>
															<th></th>
															<th></th>
														</tr>
												</thead>
												<tbody>


												</tbody>
											</table>	

			</div>	
	</div>
	
<!-- INICIO DIV NUEVO -->
 <div class="modal fade" id="idModalRegistra" >
			<div class="modal-dialog" style="width: 50%">
				<!-- Modal content-->
				<div class="modal-content">
				<div class="modal-header" style="padding: 5px 20px">
					<h4 id="idMensaje">Registro de Usuario</h4>
				</div>
				<div class="modal-body" style="padding: 20px 10px;">
					<form id="id_registra" accept-charset="UTF-8" action="" class="form-horizontal" method="post" data-toggle="validator" role="form">
							
							<input type="hidden" id="idCodigo" name="codigo">										
		                    
		                    <div class="panel-group" id="steps">
		                        <!-- Step 1 -->
		                        <div class="panel panel-default">
		                            <div class="panel-heading" style="text-align: center;font-size: 14px">
		                               
		                            </div>
		                                <div class="panel-body">
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_nombre">Nombre</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="idNombre" name="nombre" placeholder="Ingrese el Nombre"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_apellido">Apellido</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="idApellido" name="apellido" placeholder="Ingrese Apellido"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_dni">DNI</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="idDni" name="dni" placeholder="Ingrese DNI"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_sexo">Sexo</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="idSexo" name="sexo" placeholder="Ingrese Sexo"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_distrito">Distrito</label>
		                                        <div class="col-lg-5">
													<select id="idDistrito" name="distrito" class='form-control'>
							                                 <option value="-1" >[SELECCIONE]</option>
							                         </select>
		                                        </div>
		                                    </div>
		                                   
		                                    
		                                    
		                                </div>		                        
										<div class="modal-footer" style="padding: 5px 20px; text-align:center">
											<button type="button" class="btn btn-primary" onclick="postValidarRegistra()">Registrar</button>
											<button type="button" class="btn btn-danger" id="resetBtn">Cerrar</button>
										</div>
		                  		</div>
		                  </div>
		            </form>      
				</div>
			</div>
		</div>
  </div>
		<!-- FIN Nuevo y Acualizar-->			



<script type="text/javascript">

	function tablaUsuario(){
		$("#id_table_usuario").DataTable().destroy();
		$("#id_table_usuario tbody").empty(); 
		$.getJSON("listaUsuarios",{}, function (response){
			$.each(response.dataUsuarios, function(index, item){
				var editar='<button type="button" class="btn btn-success" onclick="editar('+
																									    item.cod_cli+","+
																									"'"+item.nom_cli+"',"+
																									"'"+item.ape_cli+"',"+
																									"'"+item.dni_cli+"',"+
																									"'"+item.sexo_cli+"',"+
																									    item.distrito.cod_dis+')">Editar</button>';
																													    
			    var eliminar='<button type="button" class="btn btn-btn-danger" onclick="eliminar('+
																										item.cod_cli+')">Eliminar</button>';
																									    
				$("#id_table_usuario").append("<tr><td>"+item.cod_cli+"</td>"+
												  "<td>"+item.nom_cli+"</td>"+
												  "<td>"+item.ape_cli+"</td>"+
												  "<td>"+item.dni_cli+"</td>"+
												  "<td>"+item.sexo_cli+"</td>"+
												  "<td>"+item.distrito.nom_dis+"</td>"+
												  "<td>"+editar+"</td>"+
												  "<td>"+eliminar+"</td>");
			});
			$("#id_table_usuario").DataTable().draw();
			$("#id_table_usuario").DataTable();
		});
	}
	
	function eliminar(cod){

		swal({
			  title: "Seguro de eliminar el siguiente Usuario con C�digo : "+cod,
			  text: "",
			  icon: "warning",
			  buttons: true,
			  dangerMode: true,
			})
			.then((willSave) => {
			  if (willSave) {
				  $.ajax({
						url:  'deleteUsuario',
						type: 'POST',
						data: {cod_cli:cod},
						success:function(response){
							console.log(response)
							if(response.dataMensaje==1){
								tablaUsuario();
								swal("Registro Eliminado correctamente...","","success");
							}
							else
								swal("Error al eliminar el registro...","","success");
						},
						error: function (jqXhr) { // error callback 
							swal("Error guardando...","",jqXhr);
				    	}
					})	
			  } 
			})
		
			    	

		
	}
	
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
					sex=$("#idSexo").val();
					dis=$("#idDistrito").val();
					
					json=JSON.stringify({
						cod_cli: cod,
						nom_cli:nom,
						ape_cli:ape,
						dni_cli:dni,
	   			 		sexo_cli:sex,	   			 		
	   			 		distrito:{cod_dis:dis,nom_dis:""}});
			   		 $.ajax({
			   				url:  '	saveUsuario',
			   				type: 'POST',
			   			 	data: json,
			             	processData: false,
			             	contentType: "application/json",
			   				success:function(response){
			   					console.log(response);
			   					if(response.dataMensaje==1){
				   					tablaUsuario();
				   					swal("Registro Guardado...","","success");
				   					$('#id_registra').data('bootstrapValidator').resetForm(true);
				   					$('#idModalRegistra').modal("hide");
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
	
	function editar(cod,nom,ape,dni,sex,dis){

		$("#idCodigo").val(cod);		
		$("#idNombre").val(nom);
		$("#idApellido").val(ape);
		$("#idDni").val(dni);
		$("#idSexo").val(sex);
		$("#idDistrito").val(dis);
		$("#idMensaje").text("Actualizar Usuario");
		$('#idModalRegistra').modal({backdrop: 'static',keyboard:false,show:true});
	}
	
	function mostrarVentana(){
		$('#id_registra').trigger("reset");
		$('#id_registra').data('bootstrapValidator').resetForm(true);
		$("#idCodigo").val("0");		
		$("#idMensaje").text("Registrar Usuario");
		$('#idModalRegistra').modal({backdrop: 'static',keyboard:false,show:true});
	}
	function cargarDistritos(){
		$.getJSON("listaDistritos",{},
		  function(response){
			$.each(response.dataDistritos,function(index,item){
			  $("#idDistrito").append("<option value='"+item.cod_dis+"'>"+
							item.nom_dis+"</option>");	
				})
		})
	}
</script>
<script>	
	$(document).ready(function() {
		cargarDistritos();	
		tablaUsuario();
		$('#resetBtn').click(function() {
	        $('#id_registra').data('bootstrapValidator').resetForm(true);
	        $('#idModalRegistra').modal("hide");
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
	                    regexp: /^[a-zA-Z\s\�\�\�\�\�\�\�\�\�\�\�\�]+$/,
	                    message: 'El nombre s�lo puede contener letras'
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












