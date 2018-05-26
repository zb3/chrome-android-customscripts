import unittest
import re
url_compat = __import__('gm-compile').url_compat

cases = {
  '*//*.domain.com/path/*': {
    'output': r'/^[^/]*//([^/]*\.)?domain\.com/path\/.*$/',
    'match': ['http://domain.com/path/a/b/c', 'https://x.domain.com/path/'],
    'nomatch': ['http://evil.com/e.domain.com/path/x', 'http://evil.com/://domain.com/path/x']
  },
  'https://test.*.com/a*b': {
    'output': r'/^https\://test\.[^/]*\.com/a.*b$/',
    'match': ['https://test.x.com/ab/cb'],
    'nomatch': ['https://test.net/x.com/ab/cb']
  },
  '*#*': {
    'output': r'/^.*\#.*$/',
    'match': ['http://what.ever/#yeye'],
    'nomatch': []
  }
}

class TestUrlCompat(unittest.TestCase):
    def test_cases(self):
      for input in cases:
        case = cases[input]
        output = url_compat(input)

        self.assertEqual(output, cases[input]['output'])

        pat = re.compile(output[1:-1])

        for mcase in case['match']:
          self.assertTrue(pat.match(mcase), input + ' -> ' + mcase)

        for mcase in case['nomatch']:
          self.assertFalse(pat.match(mcase), input + ' -> ' + mcase)


if __name__ == '__main__':
  unittest.main()



