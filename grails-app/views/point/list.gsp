
<%@ page import="runnersweb.Point" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'point.label', default: 'Point')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-point" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-point" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="point.type.label" default="Type" /></th>
					
						<g:sortableColumn property="value" title="${message(code: 'point.value.label', default: 'Value')}" />
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'point.dateCreated.label', default: 'Date Created')}" />
					
						<g:sortableColumn property="lastUpdated" title="${message(code: 'point.lastUpdated.label', default: 'Last Updated')}" />
					
						<th><g:message code="point.activity.label" default="Activity" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${pointInstanceList}" status="i" var="pointInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${pointInstance.id}">${fieldValue(bean: pointInstance, field: "type")}</g:link></td>
					
						<td>${fieldValue(bean: pointInstance, field: "value")}</td>
					
						<td><g:formatDate date="${pointInstance.dateCreated}" /></td>
					
						<td><g:formatDate date="${pointInstance.lastUpdated}" /></td>
					
						<td>${fieldValue(bean: pointInstance, field: "activity")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${pointInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
