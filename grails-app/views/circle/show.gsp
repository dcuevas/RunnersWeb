
<%@ page import="runnersweb.Circle" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'circle.label', default: 'Circle')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-circle" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-circle" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list circle">
			
				<g:if test="${circleInstance?.groupName}">
				<li class="fieldcontain">
					<span id="groupName-label" class="property-label"><g:message code="circle.groupName.label" default="Group Name" /></span>
					
						<span class="property-value" aria-labelledby="groupName-label"><g:fieldValue bean="${circleInstance}" field="groupName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${circleInstance?.owner}">
				<li class="fieldcontain">
					<span id="owner-label" class="property-label"><g:message code="circle.owner.label" default="Owner" /></span>
					
						<span class="property-value" aria-labelledby="owner-label"><g:link controller="runner" action="show" id="${circleInstance?.owner?.id}">${circleInstance?.owner?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${circleInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="circle.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${circleInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${circleInstance?.runners}">
				<li class="fieldcontain">
					<span id="runners-label" class="property-label"><g:message code="circle.runners.label" default="Runners" /></span>
					
						<g:each in="${circleInstance.runners}" var="r">
						<span class="property-value" aria-labelledby="runners-label"><g:link controller="runner" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${circleInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="circle.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${circleInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${circleInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="circle.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${circleInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${circleInstance?.id}" />
					<g:link class="edit" action="edit" id="${circleInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
