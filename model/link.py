import sqlalchemy as sa
from sqlalchemy import types

from bloghopbar.model.meta import Base

class Link(Base):
	__tablename__ = 'Link'
	__mapper_args__ = dict(order_by='id desc')
	
	id = sa.Column(types.Integer, primary_key=True)
	url = sa.Column(types.Text())
	visits = sa.Column(types.Integer())
	last_visit = sa.Column(types.DateTime())