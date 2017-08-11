def test_len_must_succes():
	assert len("hello") == 5

def test_len_must_fail():
	assert len("hello") not 5

def test_string_content_must_success():
	teststr = "hello"
	assert teststr == "hello"

def test_stringequal():
	assert len("hello") == 5
