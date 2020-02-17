// Copyright (c) 2020, the MarchDev Toolkit project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:flinq/flinq.dart';

void iterableSetTest() {
  print('---- iterable set ----\n');

  final collectionOne = [2, 5, 8, 2];
  final collectionTwo = [1, 3, 5, 7];

  print(collectionOne.distinct); // [2, 5, 8]
  print(collectionOne.union(collectionTwo)); // [2, 5, 8, 1, 3, 7]
  print(collectionOne.intersection(collectionTwo)); // [5]
  print(collectionOne.difference(collectionTwo)); // [2, 8]
  print(collectionTwo.difference(collectionOne)); // [1, 3, 7]

  print(collectionOne.distinctWhere((_) => _ > 4)); // [2, 5, 8]
  print(collectionOne.unionWhere(collectionTwo, (_) => _ > 4)); // [5, 8, 7]
  print(collectionOne.intersectionWhere(collectionTwo, (_) => _ < 4)); // []
  print(collectionOne.differenceWhere(collectionTwo, (_) => _ < 4)); // [2]
  print(collectionTwo.differenceWhere(collectionOne, (_) => _ < 4)); // [1, 3]
 
  print('---- ------------ ----\n');
}
