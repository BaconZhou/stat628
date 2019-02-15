---
layout: page
title: Discussion 4 - 02/15
description: notes, links, example code and exercises
---

### SQL practice

- `people.db`: [Download](../assets/data/people.db)
- [practice-part1](https://cs.brown.edu/courses/csci1951-a/assignments/sql.html)


### string

- [official documentation](https://docs.python.org/3.7/library/string.html)
- [w3school](https://www.w3schools.com/python/python_strings.asp)
- [string methods](https://www.w3schools.com/python/python_ref_string.asp)

They can be enclosed in single quotes (`'...'`) or double quotes (`"..."`) with the same result. `\` can be used to escape quotes:

```python
>>> 'spam eggs'  # single quotes
'spam eggs'
>>> 'doesn\'t'  # use \' to escape the single quote...
"doesn't"
>>> "doesn't"  # ...or use double quotes instead
"doesn't"
>>> '"Yes," they said.'
'"Yes," they said.'
>>> "\"Yes,\" they said."
'"Yes," they said.'
>>> '"Isn\'t," they said.'
'"Isn\'t," they said.'
```

String literals can span multiple lines. One way is using triple-quotes: `"""..."""` or`'''...'''`. End of lines are automatically included in the string, but it’s possible to prevent this by adding a `\` at the end of the line. The following example:

```python
print("""\
Usage: thingy [OPTIONS]
     -h                        Display this usage message
     -H hostname               Hostname to connect to
""")
```

Strings can be concatenated (glued together) with the `+` operator, and repeated with `*`:

```python
>>> # 3 times 'un', followed by 'ium'
>>> 3 * 'un' + 'ium'
'unununium'
```

Strings can be indexed (subscripted), with the first character having index 0. There is no separate character type; a character is simply a string of size one:

```python
>>> word = 'Python'
>>> word[0]  # character in position 0
'P'
>>> word[5]  # character in position 5
'n'
>>> word[-1]  # last character
'n'
>>> word[-2]  # second-last character
'o'
>>> word[-6]
'P'
>>> word[0:2]  # characters from position 0 (included) to 2 (excluded)
'Py'
>>> word[2:5]  # characters from position 2 (included) to 5 (excluded)
'tho'
```

**Practice** Create a string in Python, and play with some of the string method. `.split`, `.strip`, `.replace`, `.lower`, `.upper`


### dict

- [official documentation](https://docs.python.org/3/tutorial/datastructures.html#dictionaries)
- [w3schools](https://www.w3schools.com/python/python_dictionaries.asp)
- [dict methods](https://www.w3schools.com/python/python_ref_dictionary.asp)

Dictionaries are sometimes found in other languages as “associative memories” or “associative arrays”. Unlike sequences, which are indexed by a range of numbers, **dictionaries are indexed by keys**, which can be any **immutable type**; **strings** and **numbers** can always be keys. **Tuples** can be used as keys if they contain **only** strings, numbers, or tuples; if a tuple contains any mutable object either directly or indirectly, it cannot be used as a key

It is best to think of a dictionary as a set of key: value pairs, with the requirement that the keys are **unique** (within one dictionary). A pair of braces creates an empty dictionary: `{}`. Placing a comma-separated list of key:value pairs within the braces adds initial `key:value` pairs to the dictionary; this is also the way dictionaries are written on output. 

```python
>>> tel = {'jack': 4098, 'sape': 4139}
>>> tel['guido'] = 4127
>>> tel
{'jack': 4098, 'sape': 4139, 'guido': 4127}
>>> tel['jack']
4098
>>> del tel['sape']
>>> tel['irv'] = 4127
>>> tel
{'jack': 4098, 'guido': 4127, 'irv': 4127}
>>> list(tel)
['jack', 'guido', 'irv']
>>> sorted(tel)
['guido', 'irv', 'jack']
>>> 'guido' in tel
True
>>> 'jack' not in tel
False
>>> dict([('sape', 4139), ('guido', 4127), ('jack', 4098)])
{'sape': 4139, 'guido': 4127, 'jack': 4098}
>>> {x: x**2 for x in (2, 4, 6)}
{2: 4, 4: 16, 6: 36}
>>> dict(sape=4139, guido=4127, jack=4098)
{'sape': 4139, 'guido': 4127, 'jack': 4098}
```

**Looping Techniques**

```python
>>> knights = {'gallahad': 'the pure', 'robin': 'the brave'}
>>> for k, v in knights.items():
...     print(k, v)
...
gallahad the pure
robin the brave
```

To loop over two or more sequences at the same time, the entries can be paired with the zip() function.

```python
>>> questions = ['name', 'quest', 'favorite color']
>>> answers = ['lancelot', 'the holy grail', 'blue']
>>> for q, a in zip(questions, answers):
...     print('What is your {0}?  It is {1}.'.format(q, a))
...
What is your name?  It is lancelot.
What is your quest?  It is the holy grail.
What is your favorite color?  It is blue.
```

### file

- [official documentation](https://docs.python.org/3/tutorial/inputoutput.html#reading-and-writing-files)
- [w3schools](https://www.w3schools.com/python/python_file_handling.asp)

`open()` returns a file object, and is most commonly used with two arguments: `open(filename, mode)`.

```python
>>> f = open('workfile', 'w')

>>> with open('workfile') as f:
...     read_data = f.read()
>>> f.closed
True
```

### JSON

- [official documentation](https://docs.python.org/3/library/json.html?highlight=json#module-json)
- [w3schools](https://www.w3schools.com/python/python_json.asp)

Decoding JSON:

```python
>>> import json
>>> json.loads('["foo", {"bar":["baz", null, 1.0, 2]}]')
['foo', {'bar': ['baz', None, 1.0, 2]}]
```

[notebook](../assets/python/json.zip)

---
