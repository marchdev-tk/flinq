// Copyright (c) 2020, the MarchDev Toolkit project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:test/test.dart';
import 'package:flinq/flinq.dart';

final Iterable<int> _emptyCollection = <int>[];
final Iterable<int> _oneItemCollection = <int>[7];
final Iterable<int> _manyCollection = <int>[4, 3, 6, 1, 9, 5];

void iterableMathTests() {
  sumTests();
  averageTests();
}

void sumTests() {
  test(
    'Iterable<T extends num>.sum on empty collection',
    () => expect(_emptyCollection.sum, 0),
  );
  test(
    'Iterable<T extends num>.sum on collection with 1 element',
    () => expect(_oneItemCollection.sum, 7),
  );
  test(
    'Iterable<T extends num>.sum on collection with many elements',
    () => expect(_manyCollection.sum, 28),
  );
}

void averageTests() {
  test(
    'Iterable<T extends num>.average on empty collection',
    () => expect(_emptyCollection.average, 0),
  );
  test(
    'Iterable<T extends num>.average on collection with 1 element',
    () => expect(_oneItemCollection.average, 7),
  );
  test(
    'Iterable<T extends num>.average on collection with many elements',
    () => expect(_manyCollection.average, 28 / 6),
  );
}
