from unittest import TestCase
from Upgrader import Delta

class TestUpgrader(TestCase):
    """Test the class Upgrader."""

    def setUp(self):
        pass

    def test_delta_valid_name(self):
        self.assertTrue(Delta.is_valid_delta_name('delta_1.1.0_17072017.sql'))
        self.assertTrue(Delta.is_valid_delta_name('delta_1.1.0_17072017.sql.pre'))
        self.assertTrue(Delta.is_valid_delta_name('delta_1.1.0_17072017.sql.post'))
        self.assertTrue(Delta.is_valid_delta_name('delta_1.1.0.sql'))
        self.assertTrue(Delta.is_valid_delta_name('delta_1.1.0_blahblah_foo_bar.sql'))

        self.assertFalse(Delta.is_valid_delta_name('1.1.0_17072017.sql'))
        self.assertFalse(Delta.is_valid_delta_name('Delta_1.1.0_17072017.sql'))
        self.assertFalse(Delta.is_valid_delta_name('delta_1.1.0_17072017'))
        self.assertFalse(Delta.is_valid_delta_name('delta_1.1.0_17072017.post'))
        self.assertFalse(Delta.is_valid_delta_name('delta_1.1.0_17072017.pre'))
        self.assertFalse(Delta.is_valid_delta_name('delta_1.1_17072017.sql'))

    def test_delta_get_version(self):
        delta = Delta('delta_0.0.0_17072017.sql')
        self.assertEqual(delta.get_version(), '0.0.0')

        delta = Delta('delta_1.2.3_17072017.sql')
        self.assertEqual(delta.get_version(), '1.2.3')

        delta = Delta('delta_100.002.9999_17072017.sql')
        self.assertEqual(delta.get_version(), '100.002.9999')

    def test_delta_get_name(self):
        delta = Delta('delta_0.0.0_17072017.sql')
        self.assertEqual(delta.get_name(), '17072017')

        delta = Delta('delta_0.0.0_.sql')
        self.assertEqual(delta.get_name(), '')

        delta = Delta('delta_0.0.0.sql')
        self.assertEqual(delta.get_name(), '')

        delta = Delta('delta_0.0.0_foo.sql.pre')
        self.assertEqual(delta.get_name(), 'foo')


        delta = Delta('delta_0.0.0_foo.sql.post')
        self.assertEqual(delta.get_name(), 'foo')

    def test_delta_get_checksum(self):
        #TODO
        pass

    def test_delta_get_type(self):
        delta = Delta('delta_0.0.0_17072017.sql')
        self.assertEqual(delta.get_type(), Delta.DELTA)

        delta = Delta('delta_0.0.0_17072017.sql.pre')
        self.assertEqual(delta.get_type(), Delta.PRE)

        delta = Delta('delta_0.0.0_17072017.sql.post')
        self.assertEqual(delta.get_type(), Delta.POST)