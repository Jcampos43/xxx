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



 
<title>Modal Servicio</title>
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
		<h3 align="center">Listado de Servicios</h3>
					<button type="button" data-toggle='modal'  
					class='btn btn-primary' 
					id="validateBtnw2" 
					onclick="mostrarVentana()">Nuevo Servicio</button><br>&nbsp;<br>		
			<div id="divEmpleado">
		 								<table id="id_table_servicio" class="table table-striped table-bordered" >
												<thead>
														<tr>
															<th>Codigo</th>
															<th>Servicio</th>
															<th>Precio</th>
															<th>Descripci�n</th>
															<th>Horario</th>
															<th>Fecha de Servicio</th>
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
					<h4 id="idMensaje">Registro de Servicio</h4>
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
		                                        <label class="col-lg-3 control-label" for="id_reg_servicio">Servicio</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="idServicio" name="servicio" placeholder="Ingrese el Servicio"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_apellido">Precio</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="idPrecio" name="precio" placeholder="Ingrese Precio"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_descripcion">Descripci�n</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="idDescripcion" name="descripcion" placeholder="Ingrese Descripci�n"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_horario">Horario</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="idHorario" name="horario" placeholder="Ingrese Horario"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_fechas">Fechas de Servicio</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="idFechas" name="fechas" placeholder="Ingrese Fechas de Servicio"/>
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

	function tablaServicio(){
		$("#id_table_servicio").DataTable().destroy();
		$("#id_table_servicio tbody").empty(); 
		$.getJSON("listaServicio",{}, function (response){			
			$.each(response.dataServicios, function(index, item){
				var editar='<button type="button" class="btn btn-success" onclick="editar('+     	    item.cod_ser+","+
																									"'"+item.nom_ser+"',"+
																									"'"+item.pre_ser+"',"+
																									"'"+item.desc_ser+"',"+
																									"'"+item.horio_ser+"',"+
																									    item.fec_ser+')">Editar</button>';
																													    
			    var eliminar='<button type="button" class="btn btn-btn-danger" onclick="eliminar('+
																										item.cod_ser+')">Eliminar</button>';
																									    
				$("#id_table_servicio").append("<tr><td>"+item.cod_ser+"</td>"+
												  "<td>"+item.nom_ser+"</td>"+
												  "<td>"+item.pre_ser+"</td>"+
												  "<td>"+item.desc_ser+"</td>"+
												  "<td>"+item.horio_ser+"</td>"+
												  "<td>"+item.fec_ser+"</td>"+
												  "<td>"+editar+"</td>"+
												  "<td>"+eliminar+"</td>");
			});
			$("#id_table_servicio").DataTable().draw();
			$("#id_table_servicio").DataTable();
		});
	}
	
	function eliminar(cod){

		swal({
			  title: "Seguro de eliminar el siguiente Servicio con C�digo : "+cod,
			  text: "",
			  icon: "warning",
			  buttons: true,
			  dangerMode: true,
			})
			.then((willSave) => {
			  if (willSave) {
				  $.ajax({
						url:  'deleteServicio',
						type: 'POST',
						data: {cod_ser:cod},
						success:function(response){
							console.log(response)
							if(response.dataMensaje==1){
								tablaServicio();
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
        	saveServicio();
        }
	}
	
	function saveServicio(){
		swal({
			  title: "Seguro de Guardar?",
			  text: "",
			  icon: "warning",
			  buttons: true,
			  dangerMode: true,
			})
			.then((willSave) => {
			  if (willSave) {
				    var cod,ser,pre,des,hora,fech,json;
				    
				    cod=$("#idCodigo").val();		
					ser=$("#idServicio").val();
					pre=$("#idPrecio").val();
					des=$("#idDescripcion").val();
					hora=$("#idHorario").val();
					fech=$("#idFechas").val();
					
					json=JSON.stringify({
						cod_ser:cod,nom_ser:ser,pre_ser:pre,desc_ser:des,horio_ser:hora,fec_ser:fech});
			   		 $.ajax({
			   				url:  'saveServicio',
			   				type: 'POST',
			   			 	data: json,
			             	processData: false,
			             	contentType: "application/json",
			   				success:function(response){
			   					console.log(response);
			   					if(response.dataMensaje==1){
			   						tablaServicio();
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
	
	function editar(cod,ser,pre,des,hora,fech){

		$("#idCodigo").val(cod);		
		$("#idServicio").val(ser);
		$("#idPrecio").val(pre);
		$("#idDescripcion").val(des);
		$("#idHorario").val(hora);
		$("#idFechas").val(fech);
		$("#idMensaje").text("Actualizar Servicio");
		$('#idModalRegistra').modal({backdrop: 'static',keyboard:false,show:true});
	}
	
	function mostrarVentana(){
		$('#id_registra').trigger("reset");
		$('#id_registra').data('bootstrapValidator').resetForm(true);
		$("#idCodigo").val("0");		
		$("#idMensaje").text("Registrar Servicio");
		$('#idModalRegistra').modal({backdrop: 'static',keyboard:false,show:true});
	}

</script>
<script>	
	$(document).ready(function() {
		tablaServicio();
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












