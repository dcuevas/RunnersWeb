<%@ page import="runnersweb.Runner" %>



<div class="fieldcontain ${hasErrors(bean: runnerInstance, field: 'username', 'error')} required">
	<label for="username">
		<g:message code="runner.username.label" default="Username" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="username" required="" value="${runnerInstance?.username}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: runnerInstance, field: 'password', 'error')} required">
	<label for="password">
		<g:message code="runner.password.label" default="Password" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="password" required="" value="${runnerInstance?.password}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: runnerInstance, field: 'fullName', 'error')} required">
	<label for="fullName">
		<g:message code="runner.fullName.label" default="Full Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="fullName" required="" value="${runnerInstance?.fullName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: runnerInstance, field: 'birthday', 'error')} ">
	<label for="birthday">
		<g:message code="runner.birthday.label" default="Birthday" />
		
	</label>
	<g:datePicker name="birthday" precision="day"  value="${runnerInstance?.birthday}" default="none" noSelection="['': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: runnerInstance, field: 'mail', 'error')} required">
	<label for="mail">
		<g:message code="runner.mail.label" default="Mail" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="email" name="mail" required="" value="${runnerInstance?.mail}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: runnerInstance, field: 'activities', 'error')} ">
	<label for="activities">
		<g:message code="runner.activities.label" default="Activities" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${runnerInstance?.activities?}" var="a">
    <li><g:link controller="activity" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="activity" action="create" params="['runner.id': runnerInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'activity.label', default: 'Activity')])}</g:link>
</li>
</ul>

</div>

