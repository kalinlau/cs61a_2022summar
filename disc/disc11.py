# Disc 11: Regular Expressions, SQL
#
# This discussion deals with Lession 22 and Lession 23-24,
# topics about declarative programming
#
# Author: Jialin, Liu.
# =============================================================================
import re
from xml import dom

def email_validator(email, domains):
    """
    >>> email_validator("oski@berkeley.edu", ["berkeley.edu", "gmail.com"])
    True
    >>> email_validator("oski@gmail.com", ["berkeley.edu", "gmail.com"])
    True
    >>> email_validator("oski@berkeley.com", ["berkeley.edu", "gmail.com"])
    False
    >>> email_validator("oski@berkeley.edu", ["yahoo.com"])
    False
    >>> email_validator("xX123_iii_OSKI_iii_123Xx@berkeley.edu", ["berkeley.edu", "gmail.com"])
    True
    >>> email_validator("oski@oski@berkeley.edu", ["berkeley.edu", "gmail.com"])
    False
    >>> email_validator("oski@berkeleysedu", ["berkeley.edu", "gmail.com"])
    False
    """
    pattern = r'(\w+)\.(\w+)'
    p = [re.sub(r'\.', '\.', i) for i in domains]
    pattern = r'^(\w+@){1}' + r'(' + r'|'.join(p) + r')'

    return bool(re.search(pattern, email))

def match_url(text):
    """
    >>> match_url("https://cs61a.org/resources/#regular-expressions")
    True
    >>> match_url("https://pythontutor.com/composingprograms.html")
    True
    >>> match_url("https://pythontutor.com/should/not.match.this")
    False
    >>> match_url("https://link.com/nor.this/")
    False
    >>> match_url("http://insecure.net")
    True
    >>> match_url("htp://domain.org")
    False
    """
    # scheme = r'http(s)?://'
    # domain = r'(\w+)\.(\w){3}'
    # TODO: Cannot disentangle path and anchor: (path (anchor)?)?$
    # path =
    # anchor =
    # full_string = scheme + domain + path + anchor
    full_string = r'http(s)?://(\w+)\.(\w){3}((/\w+)+(\.\w+)?(/#[\w-]+)?)?$'
    return bool(re.match(full_string, text))
