<%@ page import="runnersweb.Circle" %>



<div class="fieldcontain ${hasErrors(bean: circleInstance, field: 'groupName', 'error')} required">
	<label for="groupName">
		<g:message code="circle.groupName.label" default="Group Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="groupName" required="" value="${circleInstance?.groupName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: circleInstance, field: 'owner', 'error')} required">
	<label for="owner">
		<g:message code="circle.owner.label" default="Owner" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="owner" name="owner.id" from="${runnersweb.Runner.list()}" optionKey="id" required="" value="${circleInstance?.owner?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: circleInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="circle.description.label" default="Description" />
		
	</label>
	<g:textArea name="description" cols="40" rows="5" maxlength="5000" value="${circleInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: circleInstance, field: 'runners', 'error')} ">
	<label for="runners">
		<g:message code="circle.runners.label" default="Runners" />
		
	</label>
	
</div>

