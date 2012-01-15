<%inherit file="/main.mako" />
<%def name="title()">Admin Control Panel</%def>

This is home of the toolkit. <br>
For now you can only 
<a href="${url(controller="toolkit", action="create")}">add</a>
blog posts.
<p>
Later on you'll be able to delete and edit also.