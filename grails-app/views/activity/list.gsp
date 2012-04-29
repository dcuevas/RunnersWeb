
<%@ page import="runnersweb.Activity" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'activity.label', default: 'Activity')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-activity" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-activity" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="type" title="${message(code: 'activity.type.label', default: 'Type')}" />
					
						<g:sortableColumn property="notes" title="${message(code: 'activity.notes.label', default: 'Notes')}" />
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'activity.dateCreated.label', default: 'Date Created')}" />
					
						<g:sortableColumn property="lastUpdated" title="${message(code: 'activity.lastUpdated.label', default: 'Last Updated')}" />
					
						<g:sortableColumn property="distance" title="${message(code: 'activity.distance.label', default: 'Distance')}" />
					
						<g:sortableColumn property="duration" title="${message(code: 'activity.duration.label', default: 'Duration')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${activityInstanceList}" status="i" var="activityInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${activityInstance.id}">${fieldValue(bean: activityInstance, field: "type")}</g:link></td>
					
						<td>${fieldValue(bean: activityInstance, field: "notes")}</td>
					
						<td><g:formatDate date="${activityInstance.dateCreated}" /></td>
					
						<td><g:formatDate date="${activityInstance.lastUpdated}" /></td>
					
						<td>${fieldValue(bean: activityInstance, field: "distance")}</td>
					
						<td>${fieldValue(bean: activityInstance, field: "duration")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${activityInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
