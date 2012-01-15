import sqlalchemy as sa
from sqlalchemy import types

from bloghopbar.model.meta import Session, Base
from bloghopbar.model.hop import Hop
from bloghopbar.model.link import Link

def init_model(engine):
	"""Call me before using any of the tables or classes in the model"""
 	Session.configure(bind=engine)