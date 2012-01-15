from bloghopbar.tests import *

class TestToolkitController(TestController):

    def test_index(self):
        response = self.app.get(url(controller='toolkit', action='index'))
        # Test response...
