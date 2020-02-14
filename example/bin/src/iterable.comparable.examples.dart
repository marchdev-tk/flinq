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

  var result = _collection
      .min; // [ Pet("rat", "Mike"), Pet("dog", "Rex"), Pet("cat", "Lucy") ]
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

void _minOrNull() {
  print('---- minOrNull ----\n');

  var result = _collection
      .minOrNull; // [ Pet("rat", "Mike"), Pet("dog", "Rex"), Pet("cat", "Lucy") ]
  assert(result == Pet("cat", "Lucy")); // true
  print(result?.toString());

  result = _emptyCollection.minOrNull; // []
  assert(result == null); // true
  print(result?.toString());

  print('---- --------- ----\n');
}

void _max() {
  print('---- max ----\n');

  var result = _collection
      .max; // [ Pet("rat", "Mike"), Pet("dog", "Rex"), Pet("cat", "Lucy") ]
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

void _maxOrNull() {
  print('---- maxOrNull ----\n');

  var result = _collection
      .maxOrNull; // [ Pet("rat", "Mike"), Pet("dog", "Rex"), Pet("cat", "Lucy") ]
  assert(result == Pet("rat", "Mike")); // true
  print(result?.toString());

  result = _emptyCollection.maxOrNull; // []
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
  _minOrNull();
  _max();
  _maxOrNull();
  _group();
  _groupMap();
}
