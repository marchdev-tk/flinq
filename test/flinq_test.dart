// Copyright (c) 2021, the MarchDev Toolkit project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:test/test.dart';
import 'package:flinq/flinq.dart';

part 'src/iterable.comparable.test.dart';
part 'src/iterable.common.test.dart';
part 'src/iterable.math.test.dart';
part 'src/iterable.set.test.dart';

final Iterable<int> _emptyCollection = <int>[];
final Iterable<int> _oneItemCollection = <int>[7];
final Iterable<int> _manyCollection = <int>[4, 3, 6, 1, 9, 5];
/// to run tests use `pub run test`
void main() {  
  iterableCommonTests();
  iterableComparableTests();
  iterableMathTests();
  iterableSetTests();
}
