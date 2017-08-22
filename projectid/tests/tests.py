import sys
import os

sys.path.append(os.path.dirname(os.path.realpath(__file__)) + "/../modules")

import utils.aux


def test_len_must_succes():
    assert len("hello") == 5


def test_string_content_must_success():
    teststr = "hello"
    assert teststr == "hello"


def test_stringequal():
    assert len("hello") == 5


def test_count_words():
    resu = utils.aux.count_words('aabbcde')
    dico_ref = {'b': 2, 'a': 2, 'c': 1, 'e': 1, 'd': 1}
    assert resu, dico_ref
