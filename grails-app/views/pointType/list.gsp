
<%@ page import="runnersweb.PointType" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'pointType.label', default: 'PointType')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-pointType" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-pointType" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'pointType.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'pointType.description.label', default: 'Description')}" />
					
						<g:sortableColumn property="pointsGiven" title="${message(code: 'pointType.pointsGiven.label', default: 'Points Given')}" />
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'pointType.dateCreated.label', default: 'Date Created')}" />
					
						<g:sortableColumn property="lastUpdated" title="${message(code: 'pointType.lastUpdated.label', default: 'Last Updated')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${pointTypeInstanceList}" status="i" var="pointTypeInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${pointTypeInstance.id}">${fieldValue(bean: pointTypeInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: pointTypeInstance, field: "description")}</td>
					
						<td>${fieldValue(bean: pointTypeInstance, field: "pointsGiven")}</td>
					
						<td><g:formatDate date="${pointTypeInstance.dateCreated}" /></td>
					
						<td><g:formatDate date="${pointTypeInstance.lastUpdated}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${pointTypeInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
