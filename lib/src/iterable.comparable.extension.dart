// Copyright (c) 2020, the MarchDev Toolkit project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// Extensions for comparable `Iterable`
extension IterableComparableExtension<T extends Comparable> on Iterable<T> {
  Iterable<T> get _sorted => this.toList()..sort();

  /// Returns the element with minimum value.
  ///
  /// If `this` is empty, [StateError] will be thrown.
  T get min {
    if (this.isEmpty) {
      throw StateError('No element');
    }
    return _sorted.first;
  }

  /// Returns the element with maximum value.
  ///
  /// If `this` is empty, [StateError] will be thrown.
  T get max {
    if (this.isEmpty) {
      throw StateError('No element');
    }
    return _sorted.last;
  }

  /// Returns the element with minimum value.
  ///
  /// If `this` is empty, the result of invoking is [null].
  T get minOrNull {
    if (this.isEmpty) {
      return null;
    }
    return _sorted.first;
  }

  /// Returns the element with maximum value.
  ///
  /// If `this` is empty, the result of invoking is [null].
  T get maxOrNull {
    if (this.isEmpty) {
      return null;
    }
    return _sorted.last;
  }

  /// Returns the element with minimum value of filtered
  /// collection by `test` predicate.
  ///
  /// If `this` is empty, [StateError] will be thrown.
  ///
  /// For more info about filtering refer to [Iterable.where].
  T minWhere(bool test(T element)) => this.where(test).min;

  /// Returns the element with maximum value of filtered
  /// collection by `test` predicate.
  ///
  /// If `this` is empty, [StateError] will be thrown.
  ///
  /// For more info about filtering refer to [Iterable.where].
  T maxWhere(bool test(T element)) => this.where(test).max;

  /// Returns the element with minimum value of filtered
  /// collection by `test` predicate.
  ///
  /// If `this` is empty, the result of invoking is [null].
  ///
  /// For more info about filtering refer to [Iterable.where].
  T minOrNullWhere(bool test(T element)) => this.where(test).minOrNull;

  /// Returns the element with maximum value of filtered
  /// collection by `test` predicate.
  ///
  /// If `this` is empty, the result of invoking is [null].
  ///
  /// For more info about filtering refer to [Iterable.where].
  T maxOrNullWhere(bool test(T element)) => this.where(test).maxOrNull;

  /// Groups [Iterable] via `K by(T item)`
  ///
  /// if [this] is empty, the result of invoking is [<K, List<T>>{}]
  Map<K, List<T>> group<K>(K by(T item)) {
    final map = <K, List<T>>{};

    this.forEach((value) {
      final key = by(value);

      if (map.containsKey(key)) {
        map[key].add(value);
      } else {
        map[key] = <T>[value];
      }
    });

    return map;
  }

  /// Groups [Iterable] via `K by(T item)` and maps it using `V as(List<T> item)` conversion.
  ///
  /// For more info about mapping refer to [Iterable.map].
  Map<K, V> groupMap<K, V>(K by(T item), V as(List<T> item)) =>
      group(by).map((k, v) => MapEntry(k, as(v)));
}
