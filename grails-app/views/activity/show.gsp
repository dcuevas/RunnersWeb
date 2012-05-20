
<%@ page import="runnersweb.Activity" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'activity.label', default: 'Activity')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-activity" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-activity" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list activity">
			
				<g:if test="${activityInstance?.type}">
				<li class="fieldcontain">
					<span id="type-label" class="property-label"><g:message code="activity.type.label" default="Type" /></span>
					
						<span class="property-value" aria-labelledby="type-label"><g:fieldValue bean="${activityInstance}" field="type"/></span>
					
				</li>
				</g:if>

				<g:if test="${activityInstance?.points}">
				<li class="fieldcontain">
					<span id="points-label" class="property-label"><g:message code="activity.points.label" default="Points" /></span>
					
						<g:each in="${activityInstance.points}" var="p">
						<span class="property-value" aria-labelledby="points-label"><g:link controller="point" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${activityInstance?.notes}">
				<li class="fieldcontain">
					<span id="notes-label" class="property-label"><g:message code="activity.notes.label" default="Notes" /></span>
					
						<span class="property-value" aria-labelledby="notes-label"><g:fieldValue bean="${activityInstance}" field="notes"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${activityInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="activity.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${activityInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${activityInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="activity.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${activityInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${activityInstance?.distance}">
				<li class="fieldcontain">
					<span id="distance-label" class="property-label"><g:message code="activity.distance.label" default="Distance" /></span>
					
						<span class="property-value" aria-labelledby="distance-label"><g:fieldValue bean="${activityInstance}" field="distance"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${activityInstance?.duration}">
				<li class="fieldcontain">
					<span id="duration-label" class="property-label"><g:message code="activity.duration.label" default="Duration" /></span>
					
						<span class="property-value" aria-labelledby="duration-label"><g:fieldValue bean="${activityInstance}" field="duration"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${activityInstance?.runner}">
				<li class="fieldcontain">
					<span id="runner-label" class="property-label"><g:message code="activity.runner.label" default="Runner" /></span>
					
						<span class="property-value" aria-labelledby="runner-label"><g:link controller="runner" action="show" id="${activityInstance?.runner?.id}">${activityInstance?.runner?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${activityInstance?.startTime}">
				<li class="fieldcontain">
					<span id="startTime-label" class="property-label"><g:message code="activity.startTime.label" default="Start Time" /></span>
					
						<span class="property-value" aria-labelledby="startTime-label"><g:formatDate date="${activityInstance?.startTime}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${activityInstance?.id}" />
					<g:link class="edit" action="edit" id="${activityInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
