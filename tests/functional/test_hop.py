from bloghopbar.tests import *

class TestHopController(TestController):

    def test_index(self):
        response = self.app.get(url(controller='hop', action='index'))
        # Test response...
