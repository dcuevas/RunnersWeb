
<%@ page import="runnersweb.Circle" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'circle.label', default: 'Circle')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-circle" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-circle" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="groupName" title="${message(code: 'circle.groupName.label', default: 'Group Name')}" />
					
						<th><g:message code="circle.owner.label" default="Owner" /></th>
					
						<g:sortableColumn property="description" title="${message(code: 'circle.description.label', default: 'Description')}" />
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'circle.dateCreated.label', default: 'Date Created')}" />
					
						<g:sortableColumn property="lastUpdated" title="${message(code: 'circle.lastUpdated.label', default: 'Last Updated')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${circleInstanceList}" status="i" var="circleInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${circleInstance.id}">${fieldValue(bean: circleInstance, field: "groupName")}</g:link></td>
					
						<td>${fieldValue(bean: circleInstance, field: "owner")}</td>
					
						<td>${fieldValue(bean: circleInstance, field: "description")}</td>
					
						<td><g:formatDate date="${circleInstance.dateCreated}" /></td>
					
						<td><g:formatDate date="${circleInstance.lastUpdated}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${circleInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
