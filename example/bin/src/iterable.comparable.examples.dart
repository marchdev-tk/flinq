// Copyright (c) 2020, the MarchDev Toolkit project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:flinq/flinq.dart';

import 'pet.model.dart';

final _emptyCollection = <Pet>[];
final _collection = [
  Pet("rat", "Mike"),
  Pet("dog", "Rex"),
  Pet("cat", "Lucy"),
];

void _min() {
  print('---- min ----\n');

  // [ Pet("rat", "Mike"), Pet("dog", "Rex"), Pet("cat", "Lucy") ]
  var result = _collection.min;
  assert(result == Pet("cat", "Lucy")); // true
  print(result?.toString());

  try {
    result = _emptyCollection.min; // []
    assert(false);
    print(result?.toString());
  } catch (e) {
    assert(e is StateError); // true (No element)
    print(e.toString());
  }

  print('---- --- ----\n');
}

void _minWhere() {
  print('---- minWhere ----\n');

  // [ Pet("rat", "Mike"), Pet("dog", "Rex"), Pet("cat", "Lucy") ]
  var result = _collection.minWhere((_) => _.name != "cat");
  assert(result == Pet("dog", "Rex")); // true
  print(result?.toString());

  try {
    result = _collection.minWhere((_) => _.name == "rabbit"); // []
    assert(false);
    print(result?.toString());
  } catch (e) {
    assert(e is StateError); // true (No element)
    print(e.toString());
  }

  print('---- --- ----\n');
}

void _minOrNull() {
  print('---- minOrNull ----\n');

  // [ Pet("rat", "Mike"), Pet("dog", "Rex"), Pet("cat", "Lucy") ]
  var result = _collection.minOrNull;
  assert(result == Pet("cat", "Lucy")); // true
  print(result?.toString());

  result = _emptyCollection.minOrNull; // []
  assert(result == null); // true
  print(result?.toString());

  print('---- --------- ----\n');
}

void _minOrNullWhere() {
  print('---- minOrNullWhere ----\n');

  // [ Pet("rat", "Mike"), Pet("dog", "Rex"), Pet("cat", "Lucy") ]
  var result = _collection.minOrNullWhere((_) => _.name != "cat");
  assert(result == Pet("dog", "Rex")); // true
  print(result?.toString());

  result = _emptyCollection.minOrNullWhere((_) => _.name == "rabbit"); // []
  assert(result == null); // true
  print(result?.toString());

  print('---- --------- ----\n');
}

void _max() {
  print('---- max ----\n');

  // [ Pet("rat", "Mike"), Pet("dog", "Rex"), Pet("cat", "Lucy") ]
  var result = _collection.max;
  assert(result == Pet("rat", "Mike")); // true
  print(result?.toString());

  try {
    result = _emptyCollection.max; // []
    assert(false);
    print(result?.toString());
  } catch (e) {
    assert(e is StateError); // true (No element)
    print(e.toString());
  }

  print('---- --- ----\n');
}

void _maxWhere() {
  print('---- maxWhere ----\n');

  // [ Pet("rat", "Mike"), Pet("dog", "Rex"), Pet("cat", "Lucy") ]
  var result = _collection.maxWhere((_) => _.name != "cat");
  assert(result == Pet("rat", "Mike")); // true
  print(result?.toString());

  try {
    result = _collection.maxWhere((_) => _.name == "rabbit"); // []
    assert(false);
    print(result?.toString());
  } catch (e) {
    assert(e is StateError); // true (No element)
    print(e.toString());
  }

  print('---- --- ----\n');
}

void _maxOrNull() {
  print('---- maxOrNull ----\n');

  // [ Pet("rat", "Mike"), Pet("dog", "Rex"), Pet("cat", "Lucy") ]
  var result = _collection.maxOrNull;
  assert(result == Pet("rat", "Mike")); // true
  print(result?.toString());

  result = _emptyCollection.maxOrNull; // []
  assert(result == null); // true
  print(result?.toString());

  print('---- --------- ----\n');
}

void _maxOrNullWhere() {
  print('---- maxOrNullWhere ----\n');

  // [ Pet("rat", "Mike"), Pet("dog", "Rex"), Pet("cat", "Lucy") ]
  var result = _collection.maxOrNullWhere((_) => _.name != "cat");
  assert(result == Pet("rat", "Mike")); // true
  print(result?.toString());

  result = _emptyCollection.maxOrNullWhere((_) => _.name == "rabbit"); // []
  assert(result == null); // true
  print(result?.toString());

  print('---- --------- ----\n');
}

void _group() {
  print('---- group ----\n');

  final result = _collection.group((item) => item.name.endsWith('at'));
  assert(result.toString() ==
      <bool, List<Pet>>{
        true: [
          Pet("rat", "Mike"),
          Pet("cat", "Lucy"),
        ],
        false: [
          Pet("dog", "Rex"),
        ],
      }.toString()); // true
  print(result?.toString());

  print('---- ----- ----\n');
}

void _groupMap() {
  print('---- groupMap ----\n');

  final result = _collection.groupMap(
      (item) => item.name.endsWith('at'), (group) => group.length);
  assert(result.toString() ==
      <bool, int>{
        true: 2,
        false: 1,
      }.toString()); // true
  print(result?.toString());

  print('---- -------- ----\n');
}

void iterableComparableTest() {
  _min();
  _minWhere();
  _minOrNull();
  _minOrNullWhere();
  _max();
  _maxWhere();
  _maxOrNull();
  _maxOrNullWhere();
  _group();
  _groupMap();
}
