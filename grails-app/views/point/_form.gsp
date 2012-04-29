<%@ page import="runnersweb.Point" %>



<div class="fieldcontain ${hasErrors(bean: pointInstance, field: 'type', 'error')} required">
	<label for="type">
		<g:message code="point.type.label" default="Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="type" name="type.id" from="${runnersweb.PointType.list()}" optionKey="id" required="" value="${pointInstance?.type?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: pointInstance, field: 'value', 'error')} required">
	<label for="value">
		<g:message code="point.value.label" default="Value" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="value" required="" value="${fieldValue(bean: pointInstance, field: 'value')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: pointInstance, field: 'activity', 'error')} required">
	<label for="activity">
		<g:message code="point.activity.label" default="Activity" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="activity" name="activity.id" from="${runnersweb.Activity.list()}" optionKey="id" required="" value="${pointInstance?.activity?.id}" class="many-to-one"/>
</div>

