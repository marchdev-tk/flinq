// Copyright (c) 2020, the MarchDev Toolkit project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:flinq/flinq.dart';

import 'pet.model.dart';

final _emptyCollection = [];
final _singleItemCollection = ["item"];
final _numCollection = [3, 6, 2, 7, 9];
final _comparableCollection = [
  Pet("rat", "Mike"),
  Pet("dog", "Rex"),
  Pet("cat", "Lucy"),
];

void _firstOrNull() {
  print('---- firstOrNull ----\n');

  var result = _emptyCollection.firstOrNull; // []
  assert(result == null); // true
  print(result?.toString());

  result = _singleItemCollection.firstOrNull; // ["item"]
  assert(result == "item"); // true
  print(result?.toString());

  result = _numCollection.firstOrNull; // [3, 6, 2, 7, 9]
  assert(result == 3); // true
  print(result?.toString());

  result = _comparableCollection
      .firstOrNull; // [ Pet("rat", "Mike"), Pet("dog", "Rex"), Pet("cat", "Lucy") ]
  assert(result == Pet("rat", "Mike")); // true
  print(result?.toString());

  print('---- ----------- ----\n');
}

void _lastOrNull() {
  print('---- lastOrNull ----\n');

  var result = _emptyCollection.lastOrNull; // []
  assert(result == null); // true
  print(result?.toString());

  result = _singleItemCollection.lastOrNull; // ["item"]
  assert(result == "item"); // true
  print(result?.toString());

  result = _numCollection.lastOrNull; // [3, 6, 2, 7, 9]
  assert(result == 9); // true
  print(result?.toString());

  result = _comparableCollection
      .lastOrNull; // [ Pet("rat", "Mike"), Pet("dog", "Rex"), Pet("cat", "Lucy") ]
  assert(result == Pet("cat", "Lucy")); // true
  print(result?.toString());

  print('---- ---------- ----\n');
}

void _singleOrNull() {
  print('---- singleOrNull ----\n');

  var result = _emptyCollection.singleOrNull; // []
  assert(result == null); // true
  print(result?.toString());

  result = _singleItemCollection.singleOrNull; // ["item"]
  assert(result == "item"); // true
  print(result?.toString());

  try {
    result = _numCollection.singleOrNull; // [3, 6, 2, 7, 9]
    assert(false);
    print(result?.toString());
  } catch (e) {
    assert(e is StateError); // true (Too many elements)
    print(e.toString());
  }

  try {
    result = _comparableCollection
        .singleOrNull; // [ Pet("rat", "Mike"), Pet("dog", "Rex"), Pet("cat", "Lucy") ]
    assert(false);
    print(result?.toString());
  } catch (e) {
    assert(e is StateError); // true (Too many elements)
    print(e.toString());
  }

  print('---- ------------ ----\n');
}

void _firstOrNullWhere() {
  print('---- firstOrNullWhere ----\n');

  var result = _emptyCollection.firstOrNullWhere((item) => item != null); // []
  assert(result == null); // true
  print(result?.toString());

  result = _singleItemCollection
      .firstOrNullWhere((item) => item != "item"); // ["item"]
  assert(result == null); // true
  print(result?.toString());

  result =
      _numCollection.firstOrNullWhere((item) => item > 3); // [3, 6, 2, 7, 9]
  assert(result == 6); // true
  print(result?.toString());

  result = _comparableCollection.firstOrNullWhere(
    (item) => item.name.contains("at"),
  ); // [ Pet("rat", "Mike"), Pet("dog", "Rex"), Pet("cat", "Lucy") ]
  assert(result == Pet("rat", "Mike")); // true
  print(result?.toString());

  print('---- ---------------- ----\n');
}

void _lastOrNullWhere() {
  print('---- lastOrNullWhere ----\n');

  var result = _emptyCollection.lastOrNullWhere((item) => item != null); // []
  assert(result == null); // true
  print(result?.toString());

  result = _singleItemCollection
      .lastOrNullWhere((item) => item != "item"); // ["item"]
  assert(result == null); // true
  print(result?.toString());

  result =
      _numCollection.lastOrNullWhere((item) => item > 3); // [3, 6, 2, 7, 9]
  assert(result == 9); // true
  print(result?.toString());

  result = _comparableCollection.lastOrNullWhere(
    (item) => item.name.contains("at"),
  ); // [ Pet("rat", "Mike"), Pet("dog", "Rex"), Pet("cat", "Lucy") ]
  assert(result == Pet("cat", "Lucy")); // true
  print(result?.toString());

  print('---- --------------- ----\n');
}

void _singleOrNullWhere() {
  print('---- singleOrNullWhere ----\n');

  var result = _emptyCollection.singleOrNullWhere((item) => item != null); // []
  assert(result == null); // true
  print(result?.toString());

  result = _singleItemCollection
      .singleOrNullWhere((item) => item != "item"); // ["item"]
  assert(result == null); // true
  print(result?.toString());

  result =
      _numCollection.singleOrNullWhere((item) => item < 3); // [3, 6, 2, 7, 9]
  assert(result == 2); // true
  print(result?.toString());

  result = _comparableCollection.singleOrNullWhere(
    (item) => item.name == "rat",
  ); // [ Pet("rat", "Mike"), Pet("dog", "Rex"), Pet("cat", "Lucy") ]
  assert(result == Pet("rat", "Mike")); // true
  print(result?.toString());

  print('---- ----------------- ----\n');
}

void _mapList() {
  print('---- mapList ----\n');

  final result = _numCollection.mapList((item) => item.toDouble());
  assert(result is List<double>);
  print(result.toString());

  print('---- ------- ----\n');
}

void _whereList() {
  print('---- whereList ----\n');

  final result = _numCollection.whereList((_) => _ > 4);
  assert(result.toString() == <int>[6, 7, 9].toString());
  print(result.toString());

  print('---- --------- ----\n');
}

void _whereMapList() {
  print('---- whereMapList ----\n');

  final result = _numCollection.whereMapList((_) => _ > 4, (_) => _.toDouble());
  assert(result.toString() == <double>[6, 7, 9].toString());
  print(result.toString());

  print('---- ------------ ----\n');
}

void _mapWhereList() {
  print('---- mapWhereList ----\n');

  final result =
      _numCollection.mapWhereList<double>((_) => _.toDouble(), (_) => _ > 4);
  assert(result.toString() == <double>[6, 7, 9].toString());
  print(result.toString());

  print('---- ------------ ----\n');
}

void _notNull() {
  print('---- notNull ----\n');

  final numCollection = [null, ..._numCollection, null];

  final result = numCollection.notNull;
  assert(result.toString() == _numCollection.toString());
  print(result.toString());

  print('---- ------- ----\n');
}

void iterableCommonTest() {
  _firstOrNull();
  _lastOrNull();
  _singleOrNull();
  _firstOrNullWhere();
  _lastOrNullWhere();
  _singleOrNullWhere();
  _mapList();
  _whereList();
  _whereMapList();
  _mapWhereList();
  _notNull();
}
