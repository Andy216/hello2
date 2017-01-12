<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<c:url value="/j_spring_security_logout" var="logoutUrl" />
<c:set var="context" value="${pageContext.request.contextPath}" />

<div class="col-md-3 left_col">
	<div class="left_col scroll-view">
		<div class="navbar nav_title" style="border: 0;">
			<a href="${context}/inicio" class="site_title">
<!-- 				<i class="fa fa-paw"></i> -->
				<span>Time Report</span>
			</a>
		</div>
		<div class="clearfix"></div>
		<br />
		<!-- sidebar menu -->
		<div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
			<div class="menu_section">
<!-- 				<h3>General</h3> --><br>
				<ul class="nav side-menu">
					
						<li>
							<a>
								<span class="glyphicon glyphicon-folder-close"/> Seguridad 
								<span class="fa fa-chevron-down"></span>
							</a>
							<ul class="nav child_menu">
								<sec:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_USER')">
									<li><a href="${context}/usua/pageCambio">Cambiar Clave</a></li>
								</sec:authorize>
								<sec:authorize access="hasRole('ROLE_ADMIN')">
									<li><a href="${context}/usua/page">Usuario</a></li>
								</sec:authorize>
							</ul>
						</li>
					<sec:authorize access="hasRole('ROLE_ADMIN')">
						<li>
							<a>
								<span class="glyphicon glyphicon-folder-close"/> Maestros 
								<span class="fa fa-chevron-down"></span>
							</a>
							<ul class="nav child_menu">
								<li><a href="${context}/cliente/page">Cliente</a></li>
								<li><a href="${context}/usuaC/page">Usuario - Cliente</a></li>
								<li><a href="${context}/sistema/page">Sistema</a></li>
								<li><a href="${context}/documento/page">Documento</a></li>
							</ul>
						</li>
					</sec:authorize>
					<sec:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_USER')">
						<li>
							<a>
								<span class="glyphicon glyphicon-copy"/> Proceso 
								<span class="fa fa-chevron-down"></span>
							</a>
							<ul class="nav child_menu">
								<li><a href="${context}/atencion/page">Atenci&oacute;n</a></li>							
							</ul>
						</li>
					</sec:authorize>
				</ul>
			</div>
		</div>
	</div>
</div>

<div class="top_nav">
	<div class="nav_menu">
		<nav class="" role="navigation">
			<div class="nav toggle">
				<a id="menu_toggle">
					<span class="glyphicon glyphicon-th-list"></span>
				</a>
			</div>
			<ul class="head_menu nav navbar-nav navbar-right">
				<li class="head_menu">
					<a href="javascript:;" class="user-profile dropdown-toggle" 
						data-toggle="dropdown" aria-expanded="false">
						&nbsp;&nbsp;${USUA.nombre}&nbsp;
						<span class="glyphicon glyphicon-user"></span>
					</a>
					<ul class="dropdown-menu dropdown-usermenu pull-right">											
						<li>
							<a href="${logoutUrl}">							
								<span class="glyphicon glyphicon-log-out"/> Salir
							</a>
						</li>
					</ul>
				</li>
			</ul>
		</nav>
	</div>
</div>