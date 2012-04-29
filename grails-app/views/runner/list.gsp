
<%@ page import="runnersweb.Runner" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'runner.label', default: 'Runner')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-runner" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-runner" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="username" title="${message(code: 'runner.username.label', default: 'Username')}" />
					
						<g:sortableColumn property="password" title="${message(code: 'runner.password.label', default: 'Password')}" />
					
						<g:sortableColumn property="fullName" title="${message(code: 'runner.fullName.label', default: 'Full Name')}" />
					
						<g:sortableColumn property="birthday" title="${message(code: 'runner.birthday.label', default: 'Birthday')}" />
					
						<g:sortableColumn property="mail" title="${message(code: 'runner.mail.label', default: 'Mail')}" />
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'runner.dateCreated.label', default: 'Date Created')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${runnerInstanceList}" status="i" var="runnerInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${runnerInstance.id}">${fieldValue(bean: runnerInstance, field: "username")}</g:link></td>
					
						<td>${fieldValue(bean: runnerInstance, field: "password")}</td>
					
						<td>${fieldValue(bean: runnerInstance, field: "fullName")}</td>
					
						<td><g:formatDate date="${runnerInstance.birthday}" /></td>
					
						<td>${fieldValue(bean: runnerInstance, field: "mail")}</td>
					
						<td><g:formatDate date="${runnerInstance.dateCreated}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${runnerInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
