<%@ page import="runnersweb.Activity" %>



<div class="fieldcontain ${hasErrors(bean: activityInstance, field: 'type', 'error')} required">
	<label for="type">
		<g:message code="activity.type.label" default="Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="type" from="${activityInstance.constraints.type.inList}" required="" value="${activityInstance?.type}" valueMessagePrefix="activity.type"/>
</div>

<div class="fieldcontain ${hasErrors(bean: activityInstance, field: 'points', 'error')} ">
	<label for="points">
		<g:message code="activity.points.label" default="Points" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${activityInstance?.points?}" var="p">
    <li><g:link controller="point" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="point" action="create" params="['activity.id': activityInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'point.label', default: 'Point')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: activityInstance, field: 'notes', 'error')} ">
	<label for="notes">
		<g:message code="activity.notes.label" default="Notes" />
		
	</label>
	<g:textArea name="notes" cols="40" rows="5" maxlength="5000" value="${activityInstance?.notes}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: activityInstance, field: 'distance', 'error')} required">
	<label for="distance">
		<g:message code="activity.distance.label" default="Distance" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="distance" required="" value="${fieldValue(bean: activityInstance, field: 'distance')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: activityInstance, field: 'duration', 'error')} required">
	<label for="duration">
		<g:message code="activity.duration.label" default="Duration" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="duration" required="" value="${fieldValue(bean: activityInstance, field: 'duration')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: activityInstance, field: 'runner', 'error')} required">
	<label for="runner">
		<g:message code="activity.runner.label" default="Runner" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="runner" name="runner.id" from="${runnersweb.Runner.list()}" optionKey="id" required="" value="${activityInstance?.runner?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: activityInstance, field: 'startTime', 'error')} required">
	<label for="startTime">
		<g:message code="activity.startTime.label" default="Start Time" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="startTime" precision="day"  value="${activityInstance?.startTime}"  />
</div>

