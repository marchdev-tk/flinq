// Copyright (c) 2021, the MarchDev Toolkit project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

part of '../flinq_test.dart';

final Iterable<int> _manyCollectionSet = <int>[4, 3, 6, 1, 9, 5, 3, 1, 5];

void iterableSetTests() {
  distinctTests();
  unionTests();
  intersectionTests();
  differenceTests();
  distinctWhereTests();
  unionWhereTests();
  intersectionWhereTests();
  differenceWhereTests();
}

void distinctTests() {
  test(
    'Iterable.distinct on empty collection',
    () {
      final actual = _emptyCollection.distinct;
      expect(actual is List<int>, true);
      expect(actual, <int>[]);
    },
  );
  test(
    'Iterable.distinct on collection with 1 element',
    () {
      final actual = _oneItemCollection.distinct;
      expect(actual is List<int>, true);
      expect(actual, <int>[7]);
    },
  );
  test(
    'Iterable.distinct on collection with many elements',
    () {
      final actual = _manyCollectionSet.distinct;
      expect(actual is List<int>, true);
      expect(actual, <int>[4, 3, 6, 1, 9, 5]);
    },
  );
}

void unionTests() {
  test(
    'Iterable.union on empty collection with empty collection',
    () {
      final actual = _emptyCollection.union(_emptyCollection as List<int>);
      expect(actual is List<int>, true);
      expect(actual, <int>[]);
    },
  );
  test(
    'Iterable.union on empty collection with full collection',
    () {
      final actual = _emptyCollection.union(_manyCollectionSet as List<int>);
      expect(actual is List<int>, true);
      expect(actual, <int>[4, 3, 6, 1, 9, 5]);
    },
  );
  test(
    'Iterable.union on collection (1 element) with empty collection',
    () {
      final actual = _oneItemCollection.union(_emptyCollection as List<int>);
      expect(actual is List<int>, true);
      expect(actual, <int>[7]);
    },
  );
  test(
    'Iterable.union on collection (1 element) with full collection',
    () {
      final actual = _oneItemCollection.union(_manyCollectionSet as List<int>);
      expect(actual is List<int>, true);
      expect(actual, <int>[7, 4, 3, 6, 1, 9, 5]);
    },
  );
  test(
    'Iterable.union on collection (many elements) with empty collection',
    () {
      final actual = _manyCollectionSet.union(_emptyCollection as List<int>);
      expect(actual is List<int>, true);
      expect(actual, <int>[4, 3, 6, 1, 9, 5]);
    },
  );
  test(
    'Iterable.union on collection (many elements) with full collection',
    () {
      final fullCollection = <int>[2, 4, 7, 0];
      final actual = _manyCollectionSet.union(fullCollection);
      expect(actual is List<int>, true);
      expect(actual, <int>[4, 3, 6, 1, 9, 5, 2, 7, 0]);
    },
  );
}

void intersectionTests() {
  test(
    'Iterable.intersection on empty collection with empty collection',
    () {
      final actual =
          _emptyCollection.intersection(_emptyCollection as List<int>);
      expect(actual is List<int>, true);
      expect(actual, <int>[]);
    },
  );
  test(
    'Iterable.intersection on empty collection with full collection',
    () {
      final actual =
          _emptyCollection.intersection(_manyCollectionSet as List<int>);
      expect(actual is List<int>, true);
      expect(actual, <int>[]);
    },
  );
  test(
    'Iterable.intersection on collection (1 element) with empty collection',
    () {
      final actual =
          _oneItemCollection.intersection(_emptyCollection as List<int>);
      expect(actual is List<int>, true);
      expect(actual, <int>[]);
    },
  );
  test(
    'Iterable.intersection on collection (1 element) with full collection',
    () {
      final fullCollection = <int>[2, 4, 7, 0];
      final actual = _oneItemCollection.intersection(fullCollection);
      expect(actual is List<int>, true);
      expect(actual, <int>[7]);
    },
  );
  test(
    'Iterable.intersection on collection (many elements) with empty collection',
    () {
      final actual =
          _manyCollectionSet.intersection(_emptyCollection as List<int>);
      expect(actual is List<int>, true);
      expect(actual, <int>[]);
    },
  );
  test(
    'Iterable.intersection on collection (many elements) with full collection',
    () {
      final fullCollection = <int>[2, 4, 7, 0, 5, 3];
      final actual = _manyCollectionSet.intersection(fullCollection);
      expect(actual is List<int>, true);
      expect(actual, <int>[4, 3, 5]);
    },
  );
}

void differenceTests() {
  test(
    'Iterable.difference on empty collection with empty collection',
    () {
      final actual = _emptyCollection.difference(_emptyCollection as List<int>);
      expect(actual is List<int>, true);
      expect(actual, <int>[]);
    },
  );
  test(
    'Iterable.difference on empty collection with full collection',
    () {
      final actual =
          _emptyCollection.difference(_manyCollectionSet as List<int>);
      expect(actual is List<int>, true);
      expect(actual, <int>[]);
    },
  );
  test(
    'Iterable.difference on collection (1 element) with empty collection',
    () {
      final actual =
          _oneItemCollection.difference(_emptyCollection as List<int>);
      expect(actual is List<int>, true);
      expect(actual, <int>[7]);
    },
  );
  test(
    'Iterable.difference on collection (1 element) with full collection',
    () {
      final fullCollection = <int>[2, 4, 7, 0];
      final actual = _oneItemCollection.difference(fullCollection);
      expect(actual is List<int>, true);
      expect(actual, <int>[]);
    },
  );
  test(
    'Iterable.difference on collection (many elements) with empty collection',
    () {
      final actual =
          _manyCollectionSet.difference(_emptyCollection as List<int>);
      expect(actual is List<int>, true);
      expect(actual, <int>[4, 3, 6, 1, 9, 5]);
    },
  );
  test(
    'Iterable.difference on collection (many elements) with full collection',
    () {
      final fullCollection = <int>[2, 4, 7, 0, 5, 3];
      final actual = _manyCollectionSet.difference(fullCollection);
      expect(actual is List<int>, true);
      expect(actual, <int>[6, 1, 9]);
    },
  );
}

void distinctWhereTests() {
  test(
    'Iterable.distinctWhere on empty collection',
    () {
      final actual = _emptyCollection.distinctWhere((_) => _ > 4);
      expect(actual is List<int>, true);
      expect(actual, <int>[]);
    },
  );
  test(
    'Iterable.distinctWhere on collection with 1 element - positive',
    () {
      final actual = _oneItemCollection.distinctWhere((_) => _ > 4);
      expect(actual is List<int>, true);
      expect(actual, <int>[7]);
    },
  );
  test(
    'Iterable.distinctWhere on collection with 1 element - negative',
    () {
      final actual = _oneItemCollection.distinctWhere((_) => _ < 4);
      expect(actual is List<int>, true);
      expect(actual, <int>[]);
    },
  );
  test(
    'Iterable.distinctWhere on collection with many elements',
    () {
      final actual = _manyCollectionSet.distinctWhere((_) => _ < 4);
      expect(actual is List<int>, true);
      expect(actual, <int>[3, 1]);
    },
  );
}

void unionWhereTests() {
  test(
    'Iterable.unionWhere on empty collection with empty collection',
    () {
      final actual = _emptyCollection.unionWhere(
          _emptyCollection as List<int>, (_) => _ > 4);
      expect(actual is List<int>, true);
      expect(actual, <int>[]);
    },
  );
  test(
    'Iterable.unionWhere on empty collection with full collection',
    () {
      final actual = _emptyCollection.unionWhere(
          _manyCollectionSet as List<int>, (_) => _ >= 4);
      expect(actual is List<int>, true);
      expect(actual, <int>[4, 6, 9, 5]);
    },
  );
  test(
    'Iterable.unionWhere on collection (1 element) with empty collection',
    () {
      final actual = _oneItemCollection.unionWhere(
          _emptyCollection as List<int>, (_) => _ > 4);
      expect(actual is List<int>, true);
      expect(actual, <int>[7]);
    },
  );
  test(
    'Iterable.unionWhere on collection (1 element) with full collection',
    () {
      final actual = _oneItemCollection.unionWhere(
          _manyCollectionSet as List<int>, (_) => _ >= 4);
      expect(actual is List<int>, true);
      expect(actual, <int>[7, 4, 6, 9, 5]);
    },
  );
  test(
    'Iterable.unionWhere on collection (many elements) with empty collection',
    () {
      final actual = _manyCollectionSet.unionWhere(
          _emptyCollection as List<int>, (_) => _ >= 4);
      expect(actual is List<int>, true);
      expect(actual, <int>[4, 6, 9, 5]);
    },
  );
  test(
    'Iterable.unionWhere on collection (many elements) with full collection',
    () {
      final fullCollection = <int>[2, 4, 7, 0];
      final actual =
          _manyCollectionSet.unionWhere(fullCollection, (_) => _ >= 4);
      expect(actual is List<int>, true);
      expect(actual, <int>[4, 6, 9, 5, 7]);
    },
  );
}

void intersectionWhereTests() {
  test(
    'Iterable.intersectionWhere on empty collection with empty collection',
    () {
      final actual = _emptyCollection.intersectionWhere(
          _emptyCollection as List<int>, (_) => _ >= 4);
      expect(actual is List<int>, true);
      expect(actual, <int>[]);
    },
  );
  test(
    'Iterable.intersectionWhere on empty collection with full collection',
    () {
      final actual = _emptyCollection.intersectionWhere(
          _manyCollectionSet as List<int>, (_) => _ >= 4);
      expect(actual is List<int>, true);
      expect(actual, <int>[]);
    },
  );
  test(
    'Iterable.intersectionWhere on collection (1 element) with empty collection',
    () {
      final actual = _oneItemCollection.intersectionWhere(
          _emptyCollection as List<int>, (_) => _ >= 4);
      expect(actual is List<int>, true);
      expect(actual, <int>[]);
    },
  );
  test(
    'Iterable.intersectionWhere on collection (1 element) with full collection',
    () {
      final fullCollection = <int>[2, 4, 7, 0];
      final actual =
          _oneItemCollection.intersectionWhere(fullCollection, (_) => _ >= 4);
      expect(actual is List<int>, true);
      expect(actual, <int>[7]);
    },
  );
  test(
    'Iterable.intersectionWhere on collection (many elements) with empty collection',
    () {
      final actual = _manyCollectionSet.intersectionWhere(
          _emptyCollection as List<int>, (_) => _ >= 4);
      expect(actual is List<int>, true);
      expect(actual, <int>[]);
    },
  );
  test(
    'Iterable.intersectionWhere on collection (many elements) with full collection',
    () {
      final fullCollection = <int>[2, 4, 7, 0, 5, 3];
      final actual =
          _manyCollectionSet.intersectionWhere(fullCollection, (_) => _ >= 4);
      expect(actual is List<int>, true);
      expect(actual, <int>[4, 5]);
    },
  );
}

void differenceWhereTests() {
  test(
    'Iterable.differenceWhere on empty collection with empty collection',
    () {
      final actual = _emptyCollection.differenceWhere(
          _emptyCollection as List<int>, (_) => _ >= 4);
      expect(actual is List<int>, true);
      expect(actual, <int>[]);
    },
  );
  test(
    'Iterable.differenceWhere on empty collection with full collection',
    () {
      final actual = _emptyCollection.differenceWhere(
          _manyCollectionSet as List<int>, (_) => _ >= 4);
      expect(actual is List<int>, true);
      expect(actual, <int>[]);
    },
  );
  test(
    'Iterable.differenceWhere on collection (1 element) with empty collection',
    () {
      final actual = _oneItemCollection.differenceWhere(
          _emptyCollection as List<int>, (_) => _ >= 4);
      expect(actual is List<int>, true);
      expect(actual, <int>[7]);
    },
  );
  test(
    'Iterable.differenceWhere on collection (1 element) with full collection',
    () {
      final fullCollection = <int>[2, 4, 7, 0];
      final actual =
          _oneItemCollection.differenceWhere(fullCollection, (_) => _ >= 4);
      expect(actual is List<int>, true);
      expect(actual, <int>[]);
    },
  );
  test(
    'Iterable.differenceWhere on collection (many elements) with empty collection',
    () {
      final actual = _manyCollectionSet.differenceWhere(
          _emptyCollection as List<int>, (_) => _ >= 4);
      expect(actual is List<int>, true);
      expect(actual, <int>[4, 6, 9, 5]);
    },
  );
  test(
    'Iterable.differenceWhere on collection (many elements) with full collection',
    () {
      final fullCollection = <int>[2, 4, 7, 0, 5, 3];
      final actual =
          _manyCollectionSet.differenceWhere(fullCollection, (_) => _ >= 4);
      expect(actual is List<int>, true);
      expect(actual, <int>[6, 9]);
    },
  );
}
