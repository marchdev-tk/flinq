// Copyright (c) 2020, the MarchDev Toolkit project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// Math extensions for numeric `Iterable`
extension IterableMathExtension<T extends num> on Iterable<T> {
  /// Returns the sum of all elements.
  ///
  /// If `this` is empty, the result of invoking is [0].
  num get sum => this.fold<num>(0, (prev, element) => prev + element);

  /// Returns the average of all elements.
  ///
  /// If `this` is empty, the result of invoking is [0].
  num get average => this.isNotEmpty ? sum / this.length : 0;

  /// Returns the sum of all elements iltered by `test` predicate.
  ///
  /// If `this` is empty, the result of invoking is [0].
  num sumWhere(bool test(T element)) => this.where(test).sum;

  /// Returns the average of all elements filtered by `test` predicate.
  ///
  /// If `this` is empty, the result of invoking is [0].
  num averageWhere(bool test(T element)) => this.where(test).average;
}
