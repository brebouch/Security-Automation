import unittest

from sf_client import SFHIClient


class TestSFHIClient(unittest.TestCase):
    def test_newClient(self):
        # Test case for creating a new client
        client = SFHIClient()
        self.assertRaises(FileNotFoundError, client.newClient, server='example.com', port=1234,
                          crtfile='./nonexistent.crt', keyfile='./nonexistent.key', proto='AF_INET')


if __name__ == '__main__':
    unittest.main()
