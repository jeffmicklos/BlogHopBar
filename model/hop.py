import sqlalchemy as sa
from sqlalchemy import types

from bloghopbar.model.meta import Base

class Hop(Base):
	__tablename__ = 'Hop'
	__mapper_args__ = dict(order_by='id desc')
	
	id = sa.Column(types.Integer, primary_key=True)
	title = sa.Column(types.Unicode(255))
	links = sa.Column(types.Text())
	userid = sa.Column(types.Integer())
	date = sa.Column(types.DateTime())