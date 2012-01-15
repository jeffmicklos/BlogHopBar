# -*- coding: utf-8 -*-
<%def name="title()"></%def>

<%def name="css()">
	## CSS files that are needed everywhere
	## This is sub-classed and append to on other templates
	${h.stylesheet_link('/css/reset.css', '/css/base.css')}
</%def>

<%def name="js()">
	${h.javascript_link('https://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js')}
	${h.javascript_link('/js/base.js')}
</%def>

<%def name="js_head()">
	window.BHB = window.BHB || {};
</%def>

<%def name="js_foot()">

</%def>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml"
      xmlns:xlink="http://www.w3.org/1999/xlink"
      xml:lang="en-us" lang="en-us">

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        ${self.css()}
        <title>BlogHopBar: ${self.title()}</title>
        
        <script>
        	${self.js_head()}
        </script>
        
    </head>
    
    <body>

		${self.body()}
		
		${self.js()}
		
		<script>
			${self.js_foot()}
		</script>

    </body>
</html>