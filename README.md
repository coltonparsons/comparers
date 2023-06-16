# Equality Comparer Open Challenge

tl;dr: Replicate sensible `==` behavior in Javascript.

## JavaScript `==` Behavior

JavaScript is known for the quirky behavior of its `==` operator.
For example, these are all true:

```js
{}  != {}
[]  != []
[]  == false
![] == false
[]  == ![]
2   == "2"
[2] == "2"
[2] != [2]
[0] == false
```

Some say to use `===` instead, but this comparer is too strict.
In particular, like `==` it rejects equality of identical objects unless they're the same instance:

```js
{}  !== {}
[]  !== []
[2] !== [2]
```

## Consensus on `==`

In contrast, Python, Ruby, and even JQ all have nearly identitical behavior for their `==` operators.
Python is quirky in that `1 == True` and `0 == False` but that is the only difference I've found among the three.
This behavior is reflected in [test.json](./test.json), where each row contains two values and a boolean representing whether they "should" be equal according to this consensus (ignoring Python's quirk).

## The Challenge

Is it possible to create a JavaScript function `is_equal(a, b)` which reproduces this behavior?
This repo has a few examples of this in other languages ([is_equal.py](./is_equal.py), [is_equal.rb](./is_equal.rb), [is_equal.jq](./is_equal.jq)) where `is_equal()` is a minimal de-quirker or just a glorified wrapper around `==`.
They can be tested by running:

```sh
./is_equal.xx <test.json
```

At the moment [is_equal.js](./is_equal.js) uses `===` which passes 34 out of 42 tests in `test.json`.
Can this be improved upon substantially?
