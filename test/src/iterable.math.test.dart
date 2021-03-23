// Copyright (c) 2021, the MarchDev Toolkit project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

part of '../flinq_test.dart';

void iterableMathTests() {
  sumTests();
  averageTests();
  sumWhereTests();
  averageWhereTests();
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

void sumWhereTests() {
  test(
    'Iterable<T extends num>.sumWhere on empty collection',
    () => expect(_emptyCollection.sumWhere((_) => _ > 4), 0),
  );
  test(
    'Iterable<T extends num>.sumWhere on collection with 1 element',
    () => expect(_oneItemCollection.sumWhere((_) => _ > 4), 7),
  );
  test(
    'Iterable<T extends num>.sumWhere on collection with many elements',
    () => expect(_manyCollection.sumWhere((_) => _ > 4), 20),
  );
}

void averageWhereTests() {
  test(
    'Iterable<T extends num>.averageWhere on empty collection',
    () => expect(_emptyCollection.averageWhere((_) => _ > 4), 0),
  );
  test(
    'Iterable<T extends num>.averageWhere on collection with 1 element',
    () => expect(_oneItemCollection.averageWhere((_) => _ > 4), 7),
  );
  test(
    'Iterable<T extends num>.averageWhere on collection with many elements',
    () => expect(_manyCollection.averageWhere((_) => _ > 4), 20 / 3),
  );
}
