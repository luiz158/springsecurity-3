<%@page session="true"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<c:url var="addProject" value="/app/user/add-project" />
<c:url var="modifyProject" value="/app/user/modify-project" />

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<script type="text/javascript" src="<c:url value="/resources/js/jquery-3.4.1.js" />" ></script>
	<script type="text/javascript" src="<c:url value="/resources/js/bootstrap.bundle.min.js" />" ></script>
	<link rel="stylesheet" href="<c:url value="/resources/css/bootstrap.css" />" >
	<link rel="stylesheet" href="${pageContext.request.contextPath}<spring:theme code='styleSheet'/>" type="text/css"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/app.css" type="text/css"/>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Title</title>
</head>
<body>
	<div class="container-fluid wrapper">
		<div class="row header">
			<div class="col-md-2 header-item"><spring:message code="app.header.projectname.label"/>
			</div>
			<div class="col-md-3 offset-7 user-info-session-control-box">
				<div class="row">
					<div class="col-md-4 header-item">
						<span class="badge badge-primary" title="click to keep session alive" id="sessionTimeRemaining" 
							onclick="ajaxSessionRefresh()" style="display:none;">
							<i class="badge badge-danger" id="sessionTimeRemainingBadge" style="float:left">30</i>
							 &nbsp; 
							 <small>Refresh</small>
							 <i class="glyphicon glyphicon-refresh"></i>
						</span>
					</div>
					<div class="col-md-4 header-item">
						<span class="glyphicon glyphicon-user"></span>
						<span>${loggedInUser.userName}</span>
					</div>
					<div class="col-md-4 header-item">
						<a href="${pageContext.request.contextPath}/logout">
							<span class="glyphicon glyphicon-off"></span>
							<span class="logout-label"><spring:message code="app.header.logout.label"/></span>
						</a>
					</div>
				</div>
			</div>
		</div>
		<div class="row content">
			<div class="col-md-2 col-sm-2 col-xs-2 sidebar">
				<div class="menu-item">
					<a href="${pageContext.request.contextPath}/app/admin/list-user" style="color:white">
						<spring:message code="app.menu.userlist.label"/>
					</a>
				</div>
				<div class="menu-item">
					<a href="${pageContext.request.contextPath}/app/user/projects-list" style="color:white">
						<spring:message code="app.menu.projectlist.label"/>
					</a>
				</div>
				<div class="menu-item">
					<a href="${pageContext.request.contextPath}/app/user/issue-list" style="color:white">
						<spring:message code="app.menu.issuelist.label"/>
					</a>
				</div>
				<div class="menu-item">
					<a href="${pageContext.request.contextPath}/app/admin/app-config" style="color:white">
						<spring:message code="app.menu.appconfig.label"/>
					</a>
				</div>
				<div class="menu-item">
					<a href="${pageContext.request.contextPath}/app/user/dashboard" style="color:white">
						<spring:message code="app.dashboard.label"/>
					</a>
				</div>
			</div>
			<div class="col-md-10 col-sm-10 col-xs-10">
				<br>
				<c:if test="${empty update}">
					<span style="font-size:20px"><spring:message code="app.projectdetails.addproject.label" /></span> 
					<hr>
					<form:form action="${addProject}" modelAttribute="project">
						<table class="table table-bordered" style="font-size:12px">
						    <tr><th><spring:message code="app.projectdetails.name.label" /></th> <td><form:input path="name"/></td></tr>
						    <tr><th><spring:message code="app.projectdetails.description.label" /></th> <td><form:input path="description"/></td></tr>
						    <tr>
						    	<th><spring:message code="app.projectdetails.manager.label" /></th>
						    	<td>
						    		<form:select path="mgr" multiple="false">
									    <form:options items="${users}" itemValue="id" itemLabel="userName"/>
									</form:select>
								</td>
						    </tr>
						    
						</table>
						<form:button value="submit"><spring:message code="app.actions.save.label" /></form:button>
					</form:form>
				</c:if>
				<c:if test="${not empty update}">
					<span style="font-size:20px"><spring:message code="app.projectdetails.updateproject.label" /></span> 
					<hr>
					<form:form action="${modifyProject}" modelAttribute="project">
						<table class="table table-bordered" style="font-size:12px">
							<form:hidden path="id"/>
						    <tr><th><spring:message code="app.projectdetails.name.label" /></th> <td><form:input path="name"/></td></tr>
						    <tr><th><spring:message code="app.projectdetails.description.label" /></th> <td><form:input path="description"/></td></tr>
						    <tr>
						    	<th><spring:message code="app.projectdetails.manager.label" /></th> 
						    	<td>
						    		<form:select path="mgr" multiple="false">
									    <form:options items="${users}" itemValue="id" itemLabel="userName"/>
									</form:select>
								</td>
						    </tr>
						</table>
						<form:button value="submit"><spring:message code="app.actions.update.label" /></form:button>
					</form:form>
				</c:if>
			</div>
		</div>
		
		<div class="row footer">
			<div style="margin: auto;">
				&copy;Copyright  2019-2020 nlpraveennl@gmail.com
			</div>
		</div>
	</div>
</body>
</html>
