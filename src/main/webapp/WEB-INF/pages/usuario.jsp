<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%> --%>

<jsp:include page="util/head.jsp" />

<body class="nav-md">
	<div id="preloader">
    	<div id="loader">&nbsp;</div>
	</div>
	<div class="container body">
		<div class="main_container">
			<jsp:include page="util/menu.jsp" />
			<div class="right_col" role="main"  style="height: 95.5% !important;">
				<div class="">
					<div class="page-title">
						<div class="title_left">
							<h3>Usuario</h3>
						</div>
					</div>
				</div>
				
				<div class="clearfix"></div>
				<div class="ln_solid"></div>
				
				<div class="row">
					<div class="col-md-12 col-sm-12 col-xs-12">
						<form id="frmSearch" class="form-horizontal ">
							
							<div class="form-group">
								<label class="control-label col-md-2 col-sm-2 col-xs-12">Usuario</label>
								<div class=" col-md-5 col-sm-5 col-xs-12">
									<input class="form-control text-uppercase" type="text" id="usuarioS" name="usuarioS">
								</div>
								<div class="visible-xs ">
									<div class="clearfix"></div>
									<br>
								</div>
	
								<div class="col-md-2 col-sm-2 col-xs-12">
									<button type="button" id="btnToolB" data-toggle="tooltip" title="Buscar" 
										class="btn btn-primary btn-sm" onclick="filtrar()">
										<span class="glyphicon glyphicon-search"/>
									</button>
									&nbsp;&nbsp;
									<button type="button" id="btnToolL" data-toggle="tooltip" title="Limpiar"
										class="btn btn-primary btn-sm" onclick="limpiarFormS()">
										<span class="glyphicon glyphicon-erase"/>
									</button>
								</div>						
							</div>
						</form>
					</div>
				</div>
				<div class="clearfix"></div>
				<div class="ln_solid"></div>
				<button type="button" class="btn btn-success btn-sm" onclick="nuevo()">
					<i class="glyphicon glyphicon-erase"></i> Nuevo
				</button>
				
				<div class="clearfix"></div>
				
				<div class="x_panel">
					<div class="x_content">
						<div class="table-responsive tbl_res" >
							<table id="example" class="table table-hover table-bordered dt-responsive nowrap" 
								cellspacing="0" width="100%">
								<thead>
									<tr>
										<th>Usuario</th>
										<th>Nombre</th>
										<th>Estado</th>
										<th>Acci&oacute;n</th>
									</tr>
								</thead>
							</table>
						</div>
					</div>
				</div>
				
			</div>
		</div>
	</div>
	
<div id="nuevo" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title" id="gridSystemModalLabel">Nuevo</h4>
			</div>
			<div class="modal-body">
				<form id="frmUsuarioC" name ="frmItem" method="post" data-parsley-validate
									class="form-horizontal form-label-left">
					<div class="row">
						<div class="col-md-12 col-sm-12 col-xs-12">
							<input type="hidden" id="id" name="id">													
							<div class="form-group">
								<label class="control-label col-md-2 col-sm-2 col-xs-12">Usuario</label>
								<div class=" col-md-5 col-sm-5 col-xs-12">
									<input class="form-control text-uppercase" type="text" id="usuario" name="usuario">
								</div>	
							</div>
							<div class="form-group">
								<label class="control-label col-md-2 col-sm-2 col-xs-12">Nombre</label>
								<div class=" col-md-7 col-sm-7 col-xs-12">
									<input class="form-control text-uppercase" type="text" id="nombre" name="nombre">	
								</div>							
							</div>							
						</div>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-danger btn-sm" data-dismiss="modal">Cancelar</button>
				<button id="btnSub" type="button" class="btn btn-success btn-sm btn_modal_success" onclick="grabar()">Aceptar</button>
			</div>
		</div>
	</div>
</div>
	
<div id="darBaja" class="modal fade" >
		<div class="modal-dialog" style="width: 280px !important;">
			<div class="modal-content">
				<div class="modal-header" style="font-size: 13px !important; padding: 5px !important;">
					¿Realmente desea cambiar el estado al Usuario?
				</div>
				<input type="hidden" id="idEstado" name="idEstado">
				<div class="modal-footer" style="text-align: center; padding: 5px !important;">
					<button id="nombre1" type="button" class="btn btn-success btn-sm btn_modal_success" 
						onclick="bajaOk()">Si
					</button>
					<button id="btnBajaKo" type="button" class="btn btn-success btn-sm btn_modal_success">No
					</button>
				</div>
			</div>
		</div> 
</div>

<div id="reiClav" class="modal fade" >
		<div class="modal-dialog" style="width: 280px !important;">
			<div class="modal-content">
				<div class="modal-header" style="font-size: 13px !important; padding: 5px !important;">
					¿Realmente desea reiniciar la clave del Usuario?
				</div>
				<input type="hidden" id="idRein" name="idRein">
				<div class="modal-footer" style="text-align: center; padding: 5px !important;">
					<button id="nombre1" type="button" class="btn btn-success btn-sm btn_modal_success" 
						onclick="reinicioOk()">Si
					</button>
					<button id="btnReinicioKo" type="button" class="btn btn-success btn-sm btn_modal_success">No
					</button>
				</div>
			</div>
		</div> 
</div>
	
	
</body>
<jsp:include page="util/libjs.jsp" />
<script type="text/javascript">

$(document).ready(function() {
	tablaForm();
	$('#btnToolT').tooltip();
	$('#btnToolR').tooltip();
});

function tablaForm(){

	var urlLoad = '${pageContext.request.contextPath}/usua/lst';
	
	$("#example").dataTable({        
		"sAjaxSource" : urlLoad,
		"fnServerParams" : function(aoData) {
			aoData.push(
					{ "name" : "nombre", "value" : $('#usuarioS').val() });  
		},
		"aoColumns" : [			
			{ "mData" : "usuario" },
			{ "mData" : "nombre" },
			{ "mData" : function(d) {
				if(d.estado!="1"){ return "INACTIVO"; }else { return "ACTIVO"; } } 
			},
			{ "mData": null, "sClass": "buttonCol", "mRender":
            function (obj) {
			return '<button type="button" id="btnToolT" data-toggle="tooltip" title="Cambiar Estado"'+
					'class="btn btn-success btn-xs margin_button" onclick="editar(\''+obj.id+'\')">'
            		+'<i class="glyphicon glyphicon-transfer"></i>'+
            	'</button>&nbsp;&nbsp;'+
            	'<button type="button" id="btnToolD" data-toggle="tooltip" title="Eliminar"'+
					'class="btn btn-success btn-xs margin_button" '
            		+'onclick="eliminar(\''+obj.id+'\',\'al Usuario\')">' 
            		+'<i class="glyphicon glyphicon-remove-circle"></i>'+
            	'</button>&nbsp;&nbsp;'+
            	'<button type="button" id="btnToolR" data-toggle="tooltip" title="Reiniciar clave"'+
            		'class="btn btn-success btn-xs margin_button" onclick="reiniciar(\''+obj.id+'\')">'
	        		+'<i class="glyphicon glyphicon-cog"></i>'+
	        	'</button>';
            	}
            }
		]
	});
}

function reiniciar(id){
	$('#idRein').val(id);
	$('#reiClav').modal({
		show : true,
		backdrop : 'static',
		keyboard : false
	});
	$('#btnReinicioKo').click(function() {
		   $('#reiClav').modal('hide');
	});
}

function reinicioOk(){
	var urlDel = '${pageContext.request.contextPath}/usua/reinicioClave';

	var formData = {
		"id" : $('#idRein').val()
	};

	$.ajax({
		type : "POST",
		contentType : 'application/json; charset=utf-8',
		dataType : 'json',
		url : urlDel,
		data : JSON.stringify(formData),
		success : function(response) {
			$('#reiClav').modal('hide');
			if(response.estado=='1'){
				mnsjOk('Se ha reiniciado clave correctamente');
				var oTable = $('#example').DataTable();
				oTable.ajax.reload();
			}
			else{
				mnsjWa(response.mensaje);
			}
		},
		error : function() {
			alert('Error while request..');
		}
	});
}

function nuevo(){
	limpiarForm(); 
	$("#btnSub").removeAttr('disabled');
	$('#nuevo').modal({
		show : true,
		backdrop : 'static',
		keyboard : false
	});
}

function limpiarFormS(){
	 $('#usuarioS').val('');
	 var oTable = $('#example').DataTable();
		oTable.ajax.reload();
}

function limpiarForm(){
	$('#id').val('');
	$('#usuario').val('');
	$('#nombre').val('');
	$('#frmUsuario').find('input, label, select, textarea').removeClass('has_error_per');
}

function grabar(){

	$("#btnSub").attr('disabled', 'disabled');
		
	var usu = $('#usuario').val();
	var nom = $('#nombre').val();
	var msg = '';
	
	if(!usu.trim() ){
		$('#usuario').addClass("has_error_per");
		msg=msg+" - Ingrese un nombre <br>";	
	}
	if(!nom.trim() ){
		$('#nombre').addClass("has_error_per");
		msg=msg+" - Ingrese un usuario <br>";	
	}

	if(!msg.trim()){

		var urlSave = '${pageContext.request.contextPath}/usua/saveOrUpdate';

		var formData = {   
			"id" : $("#id").val(),
			"usuario" : usu,
			"nombre" : nom		
		};
		
		$.ajax({
			type : "POST",
			contentType : 'application/json; charset=utf-8',
			dataType : 'json',
			url : urlSave,
			data : JSON.stringify(formData),					
			success : function(response) {
			
				if(response.estado=='1'){
					mnsjOk(response.mensaje);
					$('#nuevo').modal('hide');				
					var oTable = $('#example').DataTable();
					oTable.ajax.reload();							
				}
				else{
					mnsjWa(response.mensaje);					
					$("#btnSub").removeAttr('disabled');
				}
			},
			error : function() {
				alert('Error while request..');
			}
		});
	}else{
		$("#btnSub").removeAttr('disabled');
		mnsjKo(msg);
	}
}

function editar(id){
	$('#idEstado').val(id);
	$('#darBaja').modal({
		show : true,
		backdrop : 'static',
		keyboard : false
	});
	$('#btnBajaKo').click(function() { 
		   $('#darBaja').modal('hide');
	});
}

function bajaOk(){
	var urlDel = '${pageContext.request.contextPath}/usua/updateEstado';

	var formData = {
		"id" : $('#idEstado').val()
	};

	$.ajax({
		type : "POST",
		contentType : 'application/json; charset=utf-8',
		dataType : 'json',
		url : urlDel,
		data : JSON.stringify(formData),
		success : function(response) {
			$('#darBaja').modal('hide');
			if(response.estado=='1'){
				mnsjOk('Se ha dado de baja correctamente');
				var oTable = $('#example').DataTable();
				oTable.ajax.reload();
			}
			else{
				mnsjWa(response.mensaje);
			}
		},
		error : function() {
			alert('Error while request..');
		}
	});
}

function eliminarOk(){

	var urlDel = '${pageContext.request.contextPath}/usua/eliminar';

	var formData = {
		"id" : $('#idElim').val()
	};

	$.ajax({
		type : "POST",
		contentType : 'application/json; charset=utf-8',
		dataType : 'json',
		url : urlDel,
		data : JSON.stringify(formData),
		success : function(response) {
			$('#eliminarObjetc').modal('hide');
			if(response.estado=='1'){
				mnsjOk('Se ha eliminado correctamente');
				var oTable = $('#example').DataTable();
				oTable.ajax.reload();
			}
			else{
				mnsjWa(response.mensaje);
			}
		},
		error : function() {
			alert('Error while request..');
		}
	});
}

function filtrar() {
	var oTable = $('#example').DataTable();
	oTable.ajax.reload();
}

</script>
</html>