<%inherit file="/main.mako" />
<%def name="title()">Start a new hop!</%def>


${h.form(url(controller='toolkit', action='add'))}

	<label>Title: ${h.text('title')}</label><br>
	
	<label>Site 1: ${h.text('link')}</label><br>
	<label>Site 2: ${h.text('link')}</label><br>
	<label>Site 3: ${h.text('link')}</label><br>


${h.submit('post', 'Start the Hop')}
${h.end_form()}