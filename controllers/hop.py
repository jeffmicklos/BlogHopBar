import logging
import simplejson

from pylons import request, response, session, tmpl_context as c, url
from pylons.controllers.util import abort, redirect

from bloghopbar.lib.base import BaseController, render
from bloghopbar import model

log = logging.getLogger(__name__)

class HopController(BaseController):

	def index(self):
		return render('/home.mako')
	 
	def view(self, id):
		
		hop = model.Session.query(model.Hop).filter_by(id = id).first()
		
		c.js = {
			'links': hop.links
		}

		link_array = simplejson.loads(hop.links)
		
		c.title = hop.title
		c.links = link_array
		c.count = len(link_array)

		return render('/view.mako')
