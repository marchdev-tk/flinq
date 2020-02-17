// Copyright (c) 2020, the MarchDev Toolkit project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:test/test.dart';
import 'package:flinq/flinq.dart';

final Iterable<int> _emptyCollection = <int>[];
final Iterable<int> _oneItemCollection = <int>[7];
final Iterable<int> _manyCollection = <int>[4, 3, 6, 1, 9, 5];

void iterableComparableTests() {
  minTests();
  maxTests();
  minOrNullTests();
  maxOrNullTests();
  minWhereTests();
  maxWhereTests();
  minOrNullWhereTests();
  maxOrNullWhereTests();
  groupTests();
  groupMapTest();
}

void minTests() {
  test(
    'Iterable<T extends Comparable>.min on empty collection',
    () =>
        expect(() => _emptyCollection.min, throwsA(TypeMatcher<StateError>())),
  );
  test(
    'Iterable<T extends Comparable>.min on collection with 1 element',
    () => expect(_oneItemCollection.min, 7),
  );
  test(
    'Iterable<T extends Comparable>.min on collection with many elements',
    () => expect(_manyCollection.min, 1),
  );
}

void maxTests() {
  test(
    'Iterable<T extends Comparable>.max on empty collection',
    () =>
        expect(() => _emptyCollection.max, throwsA(TypeMatcher<StateError>())),
  );
  test(
    'Iterable<T extends Comparable>.max on collection with 1 element',
    () => expect(_oneItemCollection.max, 7),
  );
  test(
    'Iterable<T extends Comparable>.max on collection with many elements',
    () => expect(_manyCollection.max, 9),
  );
}

void minOrNullTests() {
  test(
    'Iterable<T extends Comparable>.minOrNull on empty collection',
    () => expect(_emptyCollection.minOrNull, null),
  );
  test(
    'Iterable<T extends Comparable>.minOrNull on collection with 1 element',
    () => expect(_oneItemCollection.minOrNull, 7),
  );
  test(
    'Iterable<T extends Comparable>.minOrNull on collection with many elements',
    () => expect(_manyCollection.minOrNull, 1),
  );
}

void maxOrNullTests() {
  test(
    'Iterable<T extends Comparable>.maxOrNull on empty collection',
    () => expect(_emptyCollection.maxOrNull, null),
  );
  test(
    'Iterable<T extends Comparable>.maxOrNull on collection with 1 element',
    () => expect(_oneItemCollection.maxOrNull, 7),
  );
  test(
    'Iterable<T extends Comparable>.maxOrNull on collection with many elements',
    () => expect(_manyCollection.maxOrNull, 9),
  );
}

void minWhereTests() {
  test(
    'Iterable<T extends Comparable>.minWhere on empty collection',
    () => expect(() => _emptyCollection.minWhere((_) => _ > 4),
        throwsA(TypeMatcher<StateError>())),
  );
  test(
    'Iterable<T extends Comparable>.minWhere on collection with 1 element - positive',
    () => expect(_oneItemCollection.minWhere((_) => _ > 4), 7),
  );
  test(
    'Iterable<T extends Comparable>.minWhere on collection with 1 element - negative',
    () => expect(() => _oneItemCollection.minWhere((_) => _ < 4),
        throwsA(TypeMatcher<StateError>())),
  );
  test(
    'Iterable<T extends Comparable>.minWhere on collection with many elements',
    () => expect(_manyCollection.minWhere((_) => _ > 4), 5),
  );
}

void maxWhereTests() {
  test(
    'Iterable<T extends Comparable>.maxWhere on empty collection',
    () => expect(() => _emptyCollection.maxWhere((_) => _ > 4),
        throwsA(TypeMatcher<StateError>())),
  );
  test(
    'Iterable<T extends Comparable>.maxWhere on collection with 1 element - positive',
    () => expect(_oneItemCollection.maxWhere((_) => _ > 4), 7),
  );
  test(
    'Iterable<T extends Comparable>.maxWhere on collection with 1 element - negative',
    () => expect(() => _oneItemCollection.maxWhere((_) => _ < 4),
        throwsA(TypeMatcher<StateError>())),
  );
  test(
    'Iterable<T extends Comparable>.maxWhere on collection with many elements',
    () => expect(_manyCollection.maxWhere((_) => _ < 4), 3),
  );
}

void minOrNullWhereTests() {
  test(
    'Iterable<T extends Comparable>.minOrNullWhere on empty collection',
    () => expect(_emptyCollection.minOrNullWhere((_) => _ < 4), null),
  );
  test(
    'Iterable<T extends Comparable>.minOrNullWhere on collection with 1 element - positive',
    () => expect(_oneItemCollection.minOrNullWhere((_) => _ > 4), 7),
  );
  test(
    'Iterable<T extends Comparable>.minOrNullWhere on collection with 1 element - negative',
    () => expect(_oneItemCollection.minOrNullWhere((_) => _ < 4), null),
  );
  test(
    'Iterable<T extends Comparable>.minOrNullWhere on collection with many elements',
    () => expect(_manyCollection.minOrNullWhere((_) => _ > 4), 5),
  );
}

void maxOrNullWhereTests() {
  test(
    'Iterable<T extends Comparable>.maxOrNullWhere on empty collection',
    () => expect(_emptyCollection.maxOrNullWhere((_) => _ > 4), null),
  );
  test(
    'Iterable<T extends Comparable>.maxOrNullWhere on collection with 1 element - positive',
    () => expect(_oneItemCollection.maxOrNullWhere((_) => _ > 4), 7),
  );
  test(
    'Iterable<T extends Comparable>.maxOrNullWhere on collection with 1 element - negative',
    () => expect(_oneItemCollection.maxOrNullWhere((_) => _ < 4), null),
  );
  test(
    'Iterable<T extends Comparable>.maxOrNullWhere on collection with many elements',
    () => expect(_manyCollection.maxOrNullWhere((_) => _ < 4), 3),
  );
}

void groupTests() {
  test(
    'Iterable<T extends Comparable>.group on empty collection',
    () => expect(_emptyCollection.group((item) => item), <int, List<int>>{}),
  );
  test(
    'Iterable<T extends Comparable>.group on collection with 1 element',
    () => expect(_oneItemCollection.group((item) => item), <int, List<int>>{
      7: [7]
    }),
  );
  test(
    'Iterable<T extends Comparable>.group on collection with many elements',
    () => expect(
        _manyCollection.followedBy(<int>[4, 4, 6, 3]).group((item) => item),
        <int, List<int>>{
          4: [4, 4, 4],
          3: [3, 3],
          6: [6, 6],
          1: [1],
          9: [9],
          5: [5],
        }),
  );
}

void groupMapTest() {
  test(
    'Iterable<T extends Comparable>.groupMap on empty collection',
    () => expect(
        _emptyCollection.groupMap((item) => item, (group) => group.length),
        <int, int>{}),
  );
  test(
    'Iterable<T extends Comparable>.groupMap on collection with 1 element',
    () => expect(
        _oneItemCollection.groupMap((item) => item, (group) => group.length),
        <int, int>{7: 1}),
  );
  test(
    'Iterable<T extends Comparable>.groupMap on collection with many elements',
    () => expect(
        _manyCollection.followedBy(<int>[4, 4, 6, 3]).groupMap(
            (item) => item, (group) => group.length),
        <int, int>{
          4: 3,
          3: 2,
          6: 2,
          1: 1,
          9: 1,
          5: 1,
        }),
  );
}
