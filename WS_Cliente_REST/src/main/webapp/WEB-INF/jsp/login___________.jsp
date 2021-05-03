<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
    <html lang="es">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login</title>
        <link href="<c:url value="/resources/css/bootstrap.min.css"/>" rel="stylesheet">       
        <script type="text/javascript" src="<c:url value="/resources/js/jquery.min.js" />"></script>
		<script type="text/javascript" src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
		<script type="text/javascript" src="<c:url value="/resources/js/bootstrapValidator.min.js" />"></script>
		<script type="text/javascript" src="<c:url value="/resources/js/jquery.dataTables.min.js" />"></script>
		<script type="text/javascript" src="<c:url value="/resources/js/dataTables.bootstrap.min.js" />"></script>
		
		<script type="text/javascript" src="<c:url value="/resources/js/bootstrap-datepicker.min.js" />"></script>
		
		
		<script type="text/javascript" src="<c:url value="/resources/sweetalert/sweetalert.min.js" />"></script>
        <style>
            .contenedor {
                width: 20%;
                display: flex;
                flex-direction: column;
                justify-content: center;
                margin: 20px auto 0 auto;

            }
            
            .modal-header, h4, .close {
				background-color: #286090;
				color: white !important;
				text-align: center;
				font-size: 20px;
			}
        </style>
    </head>

    <body>
     
        <div class="contenedor">
            <c:if test="${sessionScope.MENSAJE != null}">
                <div class="alert alert-danger fade in" id="success-alert">
                    <a href="#" class="close" data-dismiss="alert">&times;</a>
                    <strong>${sessionScope.MENSAJE}</strong>
                </div>
            </c:if>
            <c:remove var="MENSAJE" />
            <form class="form-sign" action="iniciarSesion" method="post">
                <div class="form-group text-center">
                    <img style="height:200px;width: 100%;" alt="logo"
                        src="https://firebasestorage.googleapis.com/v0/b/webproject-5b633.appspot.com/o/login.PNG?alt=media&token=528d3f90-64be-4a81-b189-a9dff5d6bb39">
                    <br><br>
                    <label>Bienvenidos al sistema</label>
                </div>
                <div class="form-group">
                    <label>Usuario:</label>
                    <input type="text" name="login" class="form-control">
                </div>
                <div class="form-group">
                    <label>Password:</label>
                    <input type="password" name="pass" class="form-control">
                </div>
                <input type="submit" value="Ingresar" class="btn btn-primary btn-block">
            </form>
            <div class="text-center">
                <a style="cursor:pointer;" data-toggle="modal" data-target="#idModalRegistra">Registrarse</a>

            </div>

        </div>

        </div>


        <div class="modal fade" id="idModalRegistra" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
            aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Registro de Cliente</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
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

        <script type="text/javascript">
        function postValidarRegistra() {
    		var validator = $('#id_registra').data('bootstrapValidator');
            validator.validate();
            if (validator.isValid()) {
            	saveCliente();
            }
    	}
    	
    	function saveCliente(){
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
    			   				url:  'cliente/saveClientes',
    			   				type: 'POST',
    			   			 	data: json,
    			             	processData: false,
    			             	contentType: "application/json",
    			   				success:function(response){
    			   					console.log(response);
    			   					if(response.dataMensaje==1){
    			   						$('#idModalRegistra').modal('hide');
    				   					swal("Registro Guardado...","","success");
    				   					$('#id_registra').data('bootstrapValidator').resetForm(true);
    				   					location.reload();
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
    	
    	function mostrarVentana(){
    		$('#id_registra').trigger("reset");
    		$('#id_registra').data('bootstrapValidator').resetForm(true);
    		$("#idCodigo").val("0");		
    		$("#idMensaje").text("Registrar Cliente");
    		$('#idModalRegistra').modal({backdrop: 'static',keyboard:false,show:true});
    	}
    	
    	function cargarDistritos(){
    		$.getJSON("cliente/listaDistritos",{},
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