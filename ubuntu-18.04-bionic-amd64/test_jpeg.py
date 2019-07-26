import unittest

class Test(unittest.TestCase):
    def test_run(self):
        from PIL import features, __version__
        print(__version__)
        print(features.check_feature('libjpeg_turbo'))
        print(features.check('jpg'))
        print(features.get_supported_features())
