<%@ page import="runnersweb.PointType" %>



<div class="fieldcontain ${hasErrors(bean: pointTypeInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="pointType.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${pointTypeInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: pointTypeInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="pointType.description.label" default="Description" />
		
	</label>
	<g:textArea name="description" cols="40" rows="5" maxlength="5000" value="${pointTypeInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: pointTypeInstance, field: 'pointsGiven', 'error')} required">
	<label for="pointsGiven">
		<g:message code="pointType.pointsGiven.label" default="Points Given" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="pointsGiven" required="" value="${fieldValue(bean: pointTypeInstance, field: 'pointsGiven')}"/>
</div>

