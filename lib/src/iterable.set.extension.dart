// Copyright (c) 2020, the MarchDev Toolkit project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// Set extensions for `Iterable`
extension IterableSetExtension<T> on Iterable<T> {
  /// Returns new collection of objects in which each object can
  /// occur only once
  ///
  /// The order of the elements is not guaranteed to be the same
  /// as for the iterable.
  List<T> get distinct => this.toSet().toList();

  /// Returns a new list which is the intersection between this list and [other].
  ///
  /// That is, the returned list contains all the elements of this [List] that
  /// are also elements of [other] according to `other.contains`.
  ///
  /// Note that `this` list and `other` will be cleared from item duplicates.
  List<T> intersection(List<T> other) =>
      this.toSet().intersection(other.toSet()).toList();

  /// Returns a new list which contains all the elements of this list and [other].
  ///
  /// That is, the returned list contains all the elements of this [list] and
  /// all the elements of [other].
  ///
  /// Note that `this` list and `other` will be cleared from item duplicates.
  List<T> union(List<T> other) => this.toSet().union(other.toSet()).toList();

  /// Returns a new list with the elements of this that are not in [other].
  ///
  /// That is, the returned list contains all the elements of this [Set] that
  /// are not elements of [other] according to `other.contains`.
  ///
  /// Note that `this` list and `other` will be cleared from item duplicates.
  List<T> difference(List<T> other) =>
      this.toSet().difference(other.toSet()).toList();
}
