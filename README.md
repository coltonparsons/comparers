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

Is it possible to create a JavaScript function `is_equal` which reproduces this behavior?
