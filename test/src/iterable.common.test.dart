// Copyright (c) 2020, the MarchDev Toolkit project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:test/test.dart';
import 'package:flinq/flinq.dart';

final Iterable<int> _emptyCollection = <int>[];
final Iterable<int> _oneItemCollection = <int>[7];
final Iterable<int> _manyCollection = <int>[4, 3, 6, 1, 9, 5];

void iterableCommonTests() {
  firstOrNullTests();
  lastOrNullTests();
  singleOrNullTests();
  firstOrNullWhereTests();
  lastOrNullWhereTests();
  singleOrNullWhereTests();
  mapListTests();
  mapWhereListTests();
  whereMapListTests();
}

void firstOrNullTests() {
  test(
    'Iterable.firstOrNull on empty collection',
    () => expect(_emptyCollection.firstOrNull, null),
  );
  test(
    'Iterable.firstOrNull on collection with 1 element',
    () => expect(_oneItemCollection.firstOrNull, 7),
  );
  test(
    'Iterable.firstOrNull on collection with many elements',
    () => expect(_manyCollection.firstOrNull, 4),
  );
}

void lastOrNullTests() {
  test(
    'Iterable.lastOrNull on empty collection',
    () => expect(_emptyCollection.lastOrNull, null),
  );
  test(
    'Iterable.lastOrNull on collection with 1 element',
    () => expect(_oneItemCollection.lastOrNull, 7),
  );
  test(
    'Iterable.lastOrNull on collection with many elements',
    () => expect(_manyCollection.lastOrNull, 5),
  );
}

void singleOrNullTests() {
  test(
    'Iterable.singleOrNull on empty collection',
    () => expect(_emptyCollection.singleOrNull, null),
  );
  test(
    'Iterable.singleOrNull on collection with 1 element',
    () => expect(_oneItemCollection.singleOrNull, 7),
  );
  test(
    'Iterable.singleOrNull on collection with many elements',
    () => expect(
        () => _manyCollection.singleOrNull, throwsA(TypeMatcher<StateError>())),
  );
}

void firstOrNullWhereTests() {
  test(
    'Iterable.firstOrNullWhere on empty collection',
    () => expect(_emptyCollection.firstOrNullWhere((_) => true), null),
  );
  test(
    'Iterable.firstOrNullWhere on collection with 1 element, found',
    () => expect(_oneItemCollection.firstOrNullWhere((_) => _ > 4), 7),
  );
  test(
    'Iterable.firstOrNullWhere on collection with 1 element, not found',
    () => expect(_oneItemCollection.firstOrNullWhere((_) => _ < 4), null),
  );
  test(
    'Iterable.firstOrNullWhere on collection with many elements, found',
    () => expect(_manyCollection.firstOrNullWhere((_) => _ > 4), 6),
  );
  test(
    'Iterable.firstOrNullWhere on collection with many elements, not found',
    () => expect(_manyCollection.firstOrNullWhere((_) => _ > 10), null),
  );
}

void lastOrNullWhereTests() {
  test(
    'Iterable.lastOrNullWhere on empty collection',
    () => expect(_emptyCollection.lastOrNullWhere((_) => true), null),
  );
  test(
    'Iterable.lastOrNullWhere on collection with 1 element, found',
    () => expect(_oneItemCollection.lastOrNullWhere((_) => _ > 4), 7),
  );
  test(
    'Iterable.lastOrNullWhere on collection with 1 element, not found',
    () => expect(_oneItemCollection.lastOrNullWhere((_) => _ < 4), null),
  );
  test(
    'Iterable.lastOrNullWhere on collection with many elements, found',
    () => expect(_manyCollection.lastOrNullWhere((_) => _ > 5), 9),
  );
  test(
    'Iterable.lastOrNullWhere on collection with many elements, not found',
    () => expect(_manyCollection.lastOrNullWhere((_) => _ > 10), null),
  );
}

void singleOrNullWhereTests() {
  test(
    'Iterable.singleOrNullWhere on empty collection',
    () => expect(_emptyCollection.singleOrNullWhere((_) => true), null),
  );
  test(
    'Iterable.singleOrNullWhere on collection with 1 element, found',
    () => expect(_oneItemCollection.singleOrNullWhere((_) => _ > 4), 7),
  );
  test(
    'Iterable.singleOrNullWhere on collection with 1 element, not found',
    () => expect(_oneItemCollection.singleOrNullWhere((_) => _ < 4), null),
  );
  test(
    'Iterable.singleOrNullWhere on collection with many elements, found',
    () => expect(_manyCollection.singleOrNullWhere((_) => _ == 3), 3),
  );
  test(
    'Iterable.singleOrNullWhere on collection with many elements, too many',
    () => expect(() => _manyCollection.singleOrNullWhere((_) => _ > 3),
        throwsA(TypeMatcher<StateError>())),
  );
}

void mapListTests() {
  test(
    'Iterable.mapList on empty collection',
    () => expect(_emptyCollection.mapList((_) => _.toDouble()), <double>[]),
  );
  test(
    'Iterable.mapList on collection with 1 element',
    () => expect(_oneItemCollection.mapList((_) => _.toDouble()), <double>[7]),
  );
  test(
    'Iterable.mapList on collection with many elements',
    () => expect(_manyCollection.mapList((_) => _.toDouble()),
        <double>[4, 3, 6, 1, 9, 5]),
  );
}

void whereListTests() {
  test(
    'Iterable.whereList on empty collection',
    () => expect(_emptyCollection.whereList((_) => _ > 4), <int>[]),
  );
  test(
    'Iterable.whereList on collection with 1 element - positive',
    () => expect(_oneItemCollection.whereList((_) => _ > 4), <int>[7]),
  );
  test(
    'Iterable.whereList on collection with 1 element - negative',
    () => expect(_oneItemCollection.whereList((_) => _ < 4), <int>[]),
  );
  test(
    'Iterable.whereList on collection with many elements',
    () => expect(_manyCollection.whereList((_) => _ > 4), <int>[6, 9, 5]),
  );
}

void mapWhereListTests() {
  test(
    'Iterable.mapWhereList on empty collection',
    () => expect(
      _emptyCollection.mapWhereList<double>((_) => _.toDouble(), (_) => _ > 4),
      <double>[],
    ),
  );
  test(
    'Iterable.mapWhereList on collection with 1 element - positive',
    () => expect(
      _oneItemCollection.mapWhereList<double>(
          (_) => _.toDouble(), (_) => _ > 4),
      <double>[7],
    ),
  );
  test(
    'Iterable.mapWhereList on collection with 1 element - negative',
    () => expect(
      _oneItemCollection.mapWhereList<double>(
          (_) => _.toDouble(), (_) => _ < 4),
      <double>[],
    ),
  );
  test(
    'Iterable.mapWhereList on collection with many elements',
    () => expect(
      _manyCollection.mapWhereList<double>((_) => _.toDouble(), (_) => _ > 4),
      <double>[6, 9, 5],
    ),
  );
}

void whereMapListTests() {
  test(
    'Iterable.whereMapList on empty collection',
    () => expect(
      _emptyCollection.whereMapList<double>((_) => _ > 4, (_) => _.toDouble()),
      <double>[],
    ),
  );
  test(
    'Iterable.whereMapList on collection with 1 element - positive',
    () => expect(
      _oneItemCollection.whereMapList<double>(
          (_) => _ > 4, (_) => _.toDouble()),
      <double>[7],
    ),
  );
  test(
    'Iterable.whereMapList on collection with 1 element - negative',
    () => expect(
      _oneItemCollection.whereMapList<double>(
          (_) => _ < 4, (_) => _.toDouble()),
      <double>[],
    ),
  );
  test(
    'Iterable.whereMapList on collection with many elements',
    () => expect(
      _manyCollection.whereMapList<double>((_) => _ > 4, (_) => _.toDouble()),
      <double>[6, 9, 5],
    ),
  );
}
