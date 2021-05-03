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



 
<title>Modal Producto</title>
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
		<h3 align="center">Listado de Productos</h3>
					<button type="button" data-toggle='modal'  
					class='btn btn-primary' 
					id="validateBtnw2" 
					onclick="mostrarVentana()">Nuevo Producto</button><br>&nbsp;<br>		
			<div id="divEmpleado">
		 								<table id="id_table_producto" class="table table-striped table-bordered" >
												<thead>
														<tr>
															<th>Codigo</th>
															<th>Nombre</th>
															<th>Precio</th>
															<th>Stock</th>
															<th>Marca</th>
															<th>Proveedor</th>
															<th>Descripcion</th>
															<th>DescripcionHTML</th>
															<th>Foto1</th>
															<th>Foto2</th>
															<th>Foto3</th>
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
					<h4 id="idMensaje">Registro de Producto</h4>
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
		                                        <label class="col-lg-3 control-label" for="id_reg_precio">Precio</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="idPrecio" name="precio" placeholder="Ingrese precio"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_stock">Stock</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="idStock" name="stock" placeholder="Ingrese Stock"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_marca">Marca</label>
		                                        <div class="col-lg-5">
													<select id="idMarca" name="marca" class='form-control'>
							                                 <option value="-1" >[SELECCIONE]</option>
							                         </select>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_proveedor">Proveedor</label>
		                                        <div class="col-lg-5">
													<select id="idProveedor" name="proveedor" class='form-control'>
							                                 <option value="-1" >[SELECCIONE]</option>
							                         </select>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_descripcion">Descripcion</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="idDescripcion" name="descripcion" placeholder="Ingrese descripcion"/>
		                                        </div>
		                                    </div>
		                                     <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_descripcion_html">Descripcion HTML</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="idDescripcion_html" name="descripcion_html" placeholder="Ingrese descripcion"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_foto1">Foto 1</label>
		                                        <div class="col-lg-5">
													<input type="file" id="idFoto1" name="foto1" />
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_foto2">Foto 2</label>
		                                        <div class="col-lg-5">
													<input type="file" id="idFoto2" name="foto2" />
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_foto3">Foto 3</label>
		                                        <div class="col-lg-5">
													<input type="file" id="idFoto3" name="foto3" />
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

	function tablaProducto(){
		$("#id_table_producto").DataTable().destroy();
		$("#id_table_producto tbody").empty(); 
		$.getJSON("listaProductos",{}, function (response){
			$.each(response.dataProductos, function(index, item){
				var editar='<button type="button" class="btn btn-success" onclick="editar('+item.cod_pro+","+
																						"'"+item.nom_pro+"',"+
																						"'"+item.pre_pro+"',"+
																						"'"+item.stock_pro+"',"+																									
																						"'"+item.marca.cod_mar+"',"+
																						"'"+item.proveedor.cod_prov+"',"+
																						"'"+item.desc_sim_pro+"',"+
																						"'"+item.desc_html_pro+"',"+
																						"'"+item.foto1+"',"+
																						"'"+item.foto2+"',"+
																						   +item.foto3+')">Editar</button>';
																																											    
																									
																													    
			    var eliminar='<button type="button" class="btn btn-btn-danger" onclick="eliminar('+item.cod_pro+')">Eliminar</button>';
																										
																									    
				$("#id_table_producto").append("<tr><td>"+item.cod_pro+"</td>"+
												  "<td>"+item.nom_pro+"</td>"+
												  "<td>"+item.pre_pro+"</td>"+
												  "<td>"+item.stock_pro+"</td>"+
												  "<td>"+item.marca.cod_mar+"</td>"+
												  "<td>"+item.proveedor.cod_prov+"</td>"+
												  "<td>"+item.desc_sim_pro+"</td>"+
												  "<td>"+item.desc_html_pro+"</td>"+
												  "<td>"+item.foto1+"</td>"+
												  "<td>"+item.foto2+"</td>"+
												  "<td>"+item.foto3+"</td>"+
												  "<td>"+editar+"</td>"+
												  "<td>"+eliminar+"</td>");
			});
			$("#id_table_producto").DataTable().draw();
			$("#id_table_producto").DataTable();
		});
	}
	
	function eliminar(cod){

		swal({
			  title: "Seguro de eliminar el siguiente Producto con Código : "+cod,
			  text: "",
			  icon: "warning",
			  buttons: true,
			  dangerMode: true,
			})
			.then((willSave) => {
			  if (willSave) {
				  $.ajax({
						url:  'deleteProducto',
						type: 'POST',
						data: {cod_pro:cod},
						success:function(response){
							console.log(response)
							if(response.dataMensaje==1){
								tablaProducto();
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
        	saveProducto();
        }
	}
	
	function saveProducto(){
		swal({
			  title: "Seguro de Guardar?",
			  text: "",
			  icon: "warning",
			  buttons: true,
			  dangerMode: true,
			})
			.then((willSave) => {
			  if (willSave) {
				    var cod,nom,pre,sto,mar,prov,desc,desch,f1,f2,f3,json;
				    
				    cod=$("#idCodigo").val();		
					nom=$("#idNombre").val();
					pre=$("#idPrecio").val();
					sto=$("#idStock").val();
					mar=$("#idMarca").val();
					prov=$("#idProveedor").val();
					desc=$("#idDescripcion").val();
					desch=$("#idDescripcion_html").val();
					f1=$("#idFoto1").val();
					f2=$("#idFoto2").val();
					f3=$("#idFoto3").val();
					
					json=JSON.stringify({
						cod_pro: cod,
						nom_pro: nom,
						pre_pro: pre,
						stock_pro: sto,
						marca:{cod_mar:mar,nom_mar:""},
						proveedor:{cod_prov:prov,nom_prov:""},
	   			 		desc_sim_pro:desc,
	   			 	    desc_html_pro:desch,
	   	        		foto1:f1,
	   	        		foto2:f2,
	   	        		foto3:f3});
	   			 		
			   		 $.ajax({
			   				url:  'saveProductos',
			   				type: 'POST',
			   			 	data: json,
			             	processData: false,
			             	contentType: "application/json",
			   				success:function(response){
			   					console.log(response);
			   					if(response.dataMensaje==1){
				   					tablaProducto();
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
	
	function editar(cod,nom,pre,sto,mar,prov,desc,desch,f1,f2,f3){

		$("#idCodigo").val(cod);		
		$("#idNombre").val(nom);
		$("#idPrecio").val(pre);
		$("#idStock").val(sto);
		$("#idMarca").val(mar);
		$("#idProveedor").val(prov);
		$("#idDescripcion").val(desc);
		$("#idDescripcion_html").val(desch);
		$("#idFoto1").val(f1);
		$("#idFoto2").val(f2);
		$("#idFoto3").val(f3);
		$("#idMensaje").text("Actualizar Producto");
		$('#idModalRegistra').modal({backdrop: 'static',keyboard:false,show:true});
	}
	
	function mostrarVentana(){
		$('#id_registra').trigger("reset");
		$('#id_registra').data('bootstrapValidator').resetForm(true);
		$("#idCodigo").val("0");		
		$("#idMensaje").text("Registrar Producto");
		$('#idModalRegistra').modal({backdrop: 'static',keyboard:false,show:true});
	}
	function cargarMarcas(){
		$.getJSON("listaMarcas",{},
		  function(response){
			$.each(response.dataMarcas,function(index,item){
			  $("#idMarca").append("<option value='"+item.cod_mar+"'>"+
							item.nom_mar+"</option>");	
				})
		})
	}
	function cargarProveedores(){
		$.getJSON("listaProveedores",{},
		  function(response){
			$.each(response.dataProveedores,function(index,item){
			  $("#idProveedor").append("<option value='"+item.cod_prov+"'>"+
							item.nom_prov+"</option>");	
				})
		})
	}
</script>
<script>	
	$(document).ready(function() {
		cargarMarcas();	
		tablaProducto();
		$('#resetBtn').click(function() {
	        $('#id_registra').data('bootstrapValidator').resetForm(true);
	        $('#idModalRegistra').modal("hide");
	    });   
	});
</script>
<script>	
	$(document).ready(function() {
		cargarProveedores();	
		tablaProducto();
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












