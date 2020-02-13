// Copyright (c) 2020, the MarchDev Toolkit project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:test/test.dart';
import 'package:flinq/flinq.dart';

final Iterable<int> _emptyCollection = <int>[];
final Iterable<int> _oneItemCollection = <int>[7];
final Iterable<int> _manyCollection = <int>[4, 3, 6, 1, 9, 5, 3, 1, 5];

void iterableSetTests() {
  distinctTests();
  unionTests();
  intersectionTests();
  differenceTests();
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
      final actual = _manyCollection.distinct;
      expect(actual is List<int>, true);
      expect(actual, <int>[4, 3, 6, 1, 9, 5]);
    },
  );
}

void unionTests() {
  test(
    'Iterable.union on empty collection with empty collection',
    () {
      final actual = _emptyCollection.union(_emptyCollection);
      expect(actual is List<int>, true);
      expect(actual, <int>[]);
    },
  );
  test(
    'Iterable.union on empty collection with full collection',
    () {
      final actual = _emptyCollection.union(_manyCollection);
      expect(actual is List<int>, true);
      expect(actual, <int>[4, 3, 6, 1, 9, 5]);
    },
  );
  test(
    'Iterable.union on collection (1 element) with empty collection',
    () {
      final actual = _oneItemCollection.union(_emptyCollection);
      expect(actual is List<int>, true);
      expect(actual, <int>[7]);
    },
  );
  test(
    'Iterable.union on collection (1 element) with full collection',
    () {
      final actual = _oneItemCollection.union(_manyCollection);
      expect(actual is List<int>, true);
      expect(actual, <int>[7, 4, 3, 6, 1, 9, 5]);
    },
  );
  test(
    'Iterable.union on collection (many elements) with empty collection',
    () {
      final actual = _manyCollection.union(_emptyCollection);
      expect(actual is List<int>, true);
      expect(actual, <int>[4, 3, 6, 1, 9, 5]);
    },
  );
  test(
    'Iterable.union on collection (many elements) with full collection',
    () {
      final fullCollection = <int>[2, 4, 7, 0];
      final actual = _manyCollection.union(fullCollection);
      expect(actual is List<int>, true);
      expect(actual, <int>[4, 3, 6, 1, 9, 5, 2, 7, 0]);
    },
  );
}

void intersectionTests() {
  test(
    'Iterable.intersection on empty collection with empty collection',
    () {
      final actual = _emptyCollection.intersection(_emptyCollection);
      expect(actual is List<int>, true);
      expect(actual, <int>[]);
    },
  );
  test(
    'Iterable.intersection on empty collection with full collection',
    () {
      final actual = _emptyCollection.intersection(_manyCollection);
      expect(actual is List<int>, true);
      expect(actual, <int>[]);
    },
  );
  test(
    'Iterable.intersection on collection (1 element) with empty collection',
    () {
      final actual = _oneItemCollection.intersection(_emptyCollection);
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
      final actual = _manyCollection.intersection(_emptyCollection);
      expect(actual is List<int>, true);
      expect(actual, <int>[]);
    },
  );
  test(
    'Iterable.intersection on collection (many elements) with full collection',
    () {
      final fullCollection = <int>[2, 4, 7, 0, 5, 3];
      final actual = _manyCollection.intersection(fullCollection);
      expect(actual is List<int>, true);
      expect(actual, <int>[4, 3, 5]);
    },
  );
}

void differenceTests() {
  test(
    'Iterable.difference on empty collection with empty collection',
    () {
      final actual = _emptyCollection.difference(_emptyCollection);
      expect(actual is List<int>, true);
      expect(actual, <int>[]);
    },
  );
  test(
    'Iterable.difference on empty collection with full collection',
    () {
      final actual = _emptyCollection.difference(_manyCollection);
      expect(actual is List<int>, true);
      expect(actual, <int>[]);
    },
  );
  test(
    'Iterable.difference on collection (1 element) with empty collection',
    () {
      final actual = _oneItemCollection.difference(_emptyCollection);
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
      final actual = _manyCollection.difference(_emptyCollection);
      expect(actual is List<int>, true);
      expect(actual, <int>[4, 3, 6, 1, 9, 5]);
    },
  );
  test(
    'Iterable.difference on collection (many elements) with full collection',
    () {
      final fullCollection = <int>[2, 4, 7, 0, 5, 3];
      final actual = _manyCollection.difference(fullCollection);
      expect(actual is List<int>, true);
      expect(actual, <int>[6, 1, 9]);
    },
  );
}
