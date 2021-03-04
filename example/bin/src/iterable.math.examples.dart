// Copyright (c) 2021, the MarchDev Toolkit project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:flinq/flinq.dart';

void iterableMathTest() {
  print('---- iterable math ----\n');

  final emptyCollection = <num>[];
  final oneCollection = [8]; // 8
  final manyCollection = [1, 3, 5, 7, 8, 2, 4]; // 30

  assert(emptyCollection.sum == 0); // true
  print(emptyCollection.sum);
  assert(oneCollection.sum == 8); // true
  print(oneCollection.sum);
  assert(manyCollection.sum == 30); // true
  print(manyCollection.sum);

  assert(emptyCollection.average == 0); // true
  print(emptyCollection.average);
  assert(oneCollection.average == 8); // true
  print(oneCollection.average);
  assert(manyCollection.average == 30 / 7); // true
  print(manyCollection.average);

  assert(emptyCollection.sumWhere((_) => _ > 4) == 0); // true
  print(emptyCollection.sumWhere((_) => _ > 4));
  assert(oneCollection.sumWhere((_) => _ > 4) == 8); // true
  print(oneCollection.sumWhere((_) => _ > 4));
  assert(manyCollection.sumWhere((_) => _ > 4) == 20); // true
  print(manyCollection.sumWhere((_) => _ > 4));

  assert(emptyCollection.averageWhere((_) => _ > 4) == 0); // true
  print(emptyCollection.averageWhere((_) => _ > 4));
  assert(oneCollection.averageWhere((_) => _ > 4) == 8); // true
  print(oneCollection.averageWhere((_) => _ > 4));
  assert(manyCollection.averageWhere((_) => _ > 4) == 20 / 3); // true
  print(manyCollection.averageWhere((_) => _ > 4));

  print('---- ------------- ----\n');
}
