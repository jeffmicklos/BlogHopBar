import datetime
import logging
import simplejson

from pylons import request, response, session, tmpl_context as c, url
from pylons.controllers.util import abort, redirect

from bloghopbar.lib.base import BaseController, render
from bloghopbar import model

log = logging.getLogger(__name__)

class ToolkitController(BaseController):

	def index(self):
		return render('/toolkit/index.mako')
	
	def create(self):
		## Template with form field for making hop
		return render('/toolkit/create.mako')
	
	def add(self):
		# Actually makes the new hop and redirects
		
		new_hop = model.Hop()
		new_hop.date = datetime.datetime.now()
		new_hop.title = request.params['title']
		new_hop.links = simplejson.dumps(request.params.getall('link'))
		new_hop.userid = 1
		# I didn't set ID because it will get a value automatically.
		
		# Attach the object to the session (sort of like staging the query, preparing it)
		model.Session.add(new_hop)
		
		# Commit the transaction (make the query)
		model.Session.commit()
		
		last_insert_id = new_hop.id
		
		# Redirect to the blog home page.
		redirect(url(controller='hop', action='view', id=last_insert_id))